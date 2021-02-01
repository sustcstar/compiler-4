#include "mips32.h"
#include<string.h>

/* the output file descriptor, may not be explicitly used */
FILE *fd;
// 用于寄存器分配

int fs_callee = 8;
int param_this_time = 0;
char *_tac_inst_tostring[] = {"LABEL", "FUNCTION", "ASSIGN", "ADD", "SUB", "MUL", "DIV", "ADDR", "FETCH", "DEREF", 
           "GOTO", "IFLT", "IFLE", "IFGT", "IFGE", "IFNE", "IFEQ", "RETURN", "DEC", "ARG",
           "CALL", "PARAM", "READ", "WRITE", "NONE"};


#define _tac_kind(tac) (((tac)->code).kind)
#define _tac_quadruple(tac) (((tac)->code).tac)
#define _reg_name(reg) regs[reg].name
#define TAG_DEBUG 0

void tag_debug_log(const char *str, ...){
#if  TAG_DEBUG==1
    va_list args;
    va_start(args, str);
    vfprintf(fd, str, args);
    va_end(args);
#endif
}

void _mips_printf(const char *fmt, ...){
    va_list args;
    va_start(args, fmt);
    vfprintf(fd, fmt, args);
    va_end(args);
    fputs("\n", fd);
}

void _mips_iprintf(const char *fmt, ...){
    va_list args;
    fputs("  ", fd); // `iprintf` stands for indented printf
    va_start(args, fmt);
    vfprintf(fd, fmt, args);
    va_end(args);
    fputs("\n", fd);
}

Register get_register(tac_opd *opd){
    if(opd->kind == OP_VARIABLE){ // 如果是变量
        char *var = opd->char_val;
        tag_debug_log("opd->char_val = %s\n", opd->char_val);
        /* COMPLETE the register allocation */
        // 最简单的方法：把变量从内存里load起来，然后分配这个寄存器
        // step1: 在变量描述符列表里查找相应的变量描述符
        struct VarDesc *p; // 一个指针，用来遍历地址描述符列表
        struct VarDesc *prep; // 一个辅助指针
        int find; // 判断是否在变量描述符列表中找到相应描述符
        p = vars;
        find = 0;
        prep = NULL;
        while(p){
            if(strcmp(opd->char_val, p->var) == 0){ // 找到了这个变量
                find = 1;
                break;
            }
            else{
                prep = p;
                p = p->next;
            }
        }
        // step2: 找到它与当前fp的offset,  产生一个lw指令，将其load进来（寄存器数字模3）
        // （注：这里必须能找到）
        assert(find); // 此时p就是相应变量描述符
        int tmp = register_num;
        register_num++;
        _mips_iprintf("lw %s, %d($fp)", _reg_name(t0 + tmp), -p->offset);
        // step3: 更新寄存器描述符
        strcpy(regs[t0 + tmp].var, opd->char_val);
        // steo4: 返回这个寄存器
        return t0 + tmp;
    }
    else{ // 如果是常数
        // step1: 使用寄存器t？，去li这个常量，随后返回该寄存器
        int tmp = register_num;
        register_num++;
        _mips_iprintf("li %s, %d", _reg_name(t0 + tmp), opd->int_val);
        return t0 + tmp;
    }
    
}

// TODO: 这里没有修改变量描述符
Register get_register_w(tac_opd *opd){ // 这个寄存器会被用来load value
    assert(opd->kind == OP_VARIABLE);
    char *var = opd->char_val;
    /* COMPLETE the register allocation (for write) */
    // 模+1，随后返回相应寄存器
    int tmp = register_num;
    register_num++;
    strcpy(regs[t0 + tmp].var, opd->char_val);
    return t0 + tmp;
}

// 把参数寄存器里的值丢进相应内存里
void spill_register(Register reg){ //TODO：每次计算完，都要把结果spill一下
    /* COMPLETE the register spilling */
    char *var_name; // 该寄存器存储的变量的名字
    struct VarDesc *p; // 一个指针，用来遍历地址描述符列表
    struct VarDesc *prep; // 一个辅助指针
    int find; // 判断是否在地址描述符列表中找到相应描述符
    // step1: 查找寄存器描述符，其存储的变量找到
    var_name = regs[reg].var;
    tag_debug_log("In spill, var_name = %s\n", var_name);
    // step2: 查找相应的变量描述符
    p = vars;
    find = 0;
    prep = NULL;
    while(p){
        if(strcmp(var_name, p->var) == 0){ // 找到了这个变量
            find = 1;
            break;
        }
        else{
            prep = p;
            p = p->next;
        }
    }
    // step3：将其存储进相应内存位置，记得sp要减少才能给出空间
    _mips_iprintf("addi $sp, $sp, -4");
    if(find){ // 此时p就是对应的变量描述符，找到相应的offset存进内存
        _mips_iprintf("sw %s, %d($fp)", _reg_name(reg), -p->offset);
        tag_debug_log("find: var_offset = %d\n", var_offset);
    }
    else{ // 没有找到，此时prep就是最后一个地址描述符
        // 产生一个新的地址描述符，offset增加，随后存进内存
        prep->next = (struct VarDesc*)malloc(sizeof(struct VarDesc));
        p = prep->next;
        strcpy(p->var, var_name);
        p->reg = reg; //其实目前没啥用
        var_offset += 4;
        tag_debug_log("var_offset = %d\n", var_offset);
        p->offset = var_offset;
        p->next = NULL;
        _mips_iprintf("sw %s, %d($fp)", _reg_name(reg), -p->offset);
    }
}

/* PARAM: a pointer to `struct tac_node` instance
   RETURN: the next instruction to be translated */
tac *emit_label(tac *label){
    assert(_tac_kind(label) == LABEL);
    _mips_printf("label%d:", _tac_quadruple(label).labelno->int_val);
    return label->next;
}

// TODO: 从别的函数回来之后，var_offset可能还要恢复？（应该不需要）
tac *emit_function(tac *function){
    _mips_printf("%s:", _tac_quadruple(function).funcname);
    _mips_iprintf("subu $sp, $sp, %d", fs_callee);
    _mips_iprintf("sw $ra, %d($sp)", fs_callee - 4);
    _mips_iprintf("sw $fp, %d($sp)", fs_callee - 8);
    _mips_iprintf("move $fp, $sp");
    var_offset = 0;
    return function->next;
}

tac *emit_assign(tac *assign){
    Register x, y;

    x = get_register_w(_tac_quadruple(assign).left);
    if(_tac_quadruple(assign).right->kind == OP_CONSTANT){ // 如果右边是常数
        _mips_iprintf("li %s, %d", _reg_name(x),
                                   _tac_quadruple(assign).right->int_val);
    }
    else{
        y = get_register(_tac_quadruple(assign).right);  // 如果有变是寄存器
        _mips_iprintf("move %s, %s", _reg_name(x), _reg_name(y));
    }

    // 所有运算在结束后，都会重置register_num，并且存储变量
    register_num = 0;
    spill_register(x);
    return assign->next;
}

tac *emit_add(tac *add){
    Register x, y, z;

    x = get_register_w(_tac_quadruple(add).left);
    if(_tac_quadruple(add).r1->kind == OP_CONSTANT){
        y = get_register(_tac_quadruple(add).r2);
        _mips_iprintf("addi %s, %s, %d", _reg_name(x),
                                         _reg_name(y),
                                         _tac_quadruple(add).r1->int_val);
    }
    else if(_tac_quadruple(add).r2->kind == OP_CONSTANT){
        y = get_register(_tac_quadruple(add).r1);
        _mips_iprintf("addi %s, %s, %d", _reg_name(x),
                                         _reg_name(y),
                                         _tac_quadruple(add).r2->int_val);
    }
    else{
        y = get_register(_tac_quadruple(add).r1);
        z = get_register(_tac_quadruple(add).r2);
        _mips_iprintf("add %s, %s, %s", _reg_name(x),
                                        _reg_name(y),
                                        _reg_name(z));
    }

    register_num = 0;
    spill_register(x);
    return add->next;
}

tac *emit_sub(tac *sub){
    Register x, y, z;

    x = get_register_w(_tac_quadruple(sub).left);
    if(_tac_quadruple(sub).r1->kind == OP_CONSTANT){
        y = get_register(_tac_quadruple(sub).r2);
        _mips_iprintf("neg %s, %s", _reg_name(y), _reg_name(y));
        _mips_iprintf("addi %s, %s, %d", _reg_name(x),
                                         _reg_name(y),
                                         _tac_quadruple(sub).r1->int_val);
    }
    else if(_tac_quadruple(sub).r2->kind == OP_CONSTANT){
        y = get_register(_tac_quadruple(sub).r1);
        _mips_iprintf("addi %s, %s, -%d", _reg_name(x),
                                          _reg_name(y),
                                          _tac_quadruple(sub).r2->int_val);
    }
    else{
        y = get_register(_tac_quadruple(sub).r1);
        z = get_register(_tac_quadruple(sub).r2);
        _mips_iprintf("sub %s, %s, %s", _reg_name(x),
                                        _reg_name(y),
                                        _reg_name(z));
    }

    register_num = 0;
    spill_register(x);
    return sub->next;
}

tac *emit_mul(tac *mul){
    Register x, y, z;

    x = get_register_w(_tac_quadruple(mul).left);
    if(_tac_quadruple(mul).r1->kind == OP_CONSTANT){
        y = get_register_w(_tac_quadruple(mul).r1);
        z = get_register(_tac_quadruple(mul).r2);
        _mips_iprintf("lw %s, %d", _reg_name(y),
                                   _tac_quadruple(mul).r1->int_val);
    }
    else if(_tac_quadruple(mul).r2->kind == OP_CONSTANT){
        y = get_register(_tac_quadruple(mul).r1);
        z = get_register_w(_tac_quadruple(mul).r2);
        _mips_iprintf("lw %s, %d", _reg_name(z),
                                   _tac_quadruple(mul).r2->int_val);
    }
    else{
        y = get_register(_tac_quadruple(mul).r1);
        z = get_register(_tac_quadruple(mul).r2);
    }
    _mips_iprintf("mul %s, %s, %s", _reg_name(x),
                                    _reg_name(y),
                                    _reg_name(z));
    // 该指令执行完成后，x, y, z都存进内存里
    register_num = 0;
    spill_register(x);
    return mul->next;
}

tac *emit_div(tac *div){
    Register x, y, z;

    x = get_register_w(_tac_quadruple(div).left);
    if(_tac_quadruple(div).r1->kind == OP_CONSTANT){
        y = get_register_w(_tac_quadruple(div).r1);
        z = get_register(_tac_quadruple(div).r2);
        _mips_iprintf("lw %s, %d", _reg_name(y),
                                   _tac_quadruple(div).r1->int_val);
    }
    else if(_tac_quadruple(div).r2->kind == OP_CONSTANT){
        y = get_register(_tac_quadruple(div).r1);
        z = get_register_w(_tac_quadruple(div).r2);
        _mips_iprintf("lw %s, %d", _reg_name(z),
                                   _tac_quadruple(div).r2->int_val);
    }
    else{
        y = get_register(_tac_quadruple(div).r1);
        z = get_register(_tac_quadruple(div).r2);
    }
    _mips_iprintf("div %s, %s", _reg_name(y), _reg_name(z));
    _mips_iprintf("mflo %s", _reg_name(x));

    register_num = 0;
    spill_register(x);
    return div->next;
}

tac *emit_addr(tac *addr){
    Register x, y;

    x = get_register_w(_tac_quadruple(addr).left);
    y = get_register(_tac_quadruple(addr).right);
    _mips_iprintf("move %s, %s", _reg_name(x), _reg_name(y));

    register_num = 0;
    spill_register(x);
    return addr->next;
}

tac *emit_fetch(tac *fetch){
    Register x, y;

    x = get_register_w(_tac_quadruple(fetch).left);
    y = get_register(_tac_quadruple(fetch).raddr);
    _mips_iprintf("lw %s, 0(%s)", _reg_name(x), _reg_name(y));

    register_num = 0;
    spill_register(x);
    return fetch->next;
}

tac *emit_deref(tac *deref){
    Register x, y;

    x = get_register(_tac_quadruple(deref).laddr);
    y = get_register(_tac_quadruple(deref).right);
    _mips_iprintf("sw %s, 0(%s)", _reg_name(y), _reg_name(x));

    register_num = 0;
    return deref->next;
}

tac *emit_goto(tac *goto_){
    _mips_iprintf("j label%d", _tac_quadruple(goto_).labelno->int_val);
    return goto_->next;
}

// TODO: 暂时不考虑IF中出现constant的情况
tac *emit_iflt(tac *iflt){ 
    /* COMPLETE emit function */
    Register x, y;

    x = get_register(_tac_quadruple(iflt).c1);
    y = get_register(_tac_quadruple(iflt).c2); 
    _mips_iprintf("blt %s, %s, label%d", _reg_name(x), _reg_name(y), _tac_quadruple(iflt).labelno->int_val);
    
    register_num = 0;
    return iflt->next;
}

tac *emit_ifle(tac *ifle){
    /* COMPLETE emit function */
    Register x, y;

    x = get_register(_tac_quadruple(ifle).c1);
    y = get_register(_tac_quadruple(ifle).c2); 
    _mips_iprintf("ble %s, %s, label%d", _reg_name(x), _reg_name(y), _tac_quadruple(ifle).labelno->int_val);
    
    register_num = 0;
    return ifle->next;
}

tac *emit_ifgt(tac *ifgt){
    /* COMPLETE emit function */
    Register x, y;

    x = get_register(_tac_quadruple(ifgt).c1);
    y = get_register(_tac_quadruple(ifgt).c2); 
    _mips_iprintf("bgt %s, %s, label%d", _reg_name(x), _reg_name(y), _tac_quadruple(ifgt).labelno->int_val);
    
    register_num = 0;
    return ifgt->next;
}

tac *emit_ifge(tac *ifge){
    /* COMPLETE emit function */
    Register x, y;

    x = get_register(_tac_quadruple(ifge).c1);
    y = get_register(_tac_quadruple(ifge).c2); 
    _mips_iprintf("bge %s, %s, label%d", _reg_name(x), _reg_name(y), _tac_quadruple(ifge).labelno->int_val);
    
    register_num = 0;
    return ifge->next;
}

tac *emit_ifne(tac *ifne){
    /* COMPLETE emit function */
    Register x, y;

    x = get_register(_tac_quadruple(ifne).c1);
    y = get_register(_tac_quadruple(ifne).c2); 
    _mips_iprintf("bne %s, %s, label%d", _reg_name(x), _reg_name(y), _tac_quadruple(ifne).labelno->int_val);
    
    register_num = 0;
    return ifne->next;
}

tac *emit_ifeq(tac *ifeq){
    /* COMPLETE emit function */
    Register x, y;

    x = get_register(_tac_quadruple(ifeq).c1);
    y = get_register(_tac_quadruple(ifeq).c2); 
    _mips_iprintf("beq %s, %s, label%d", _reg_name(x), _reg_name(y), _tac_quadruple(ifeq).labelno->int_val);
    
    register_num = 0;
    return ifeq->next;
}

//返回值由v0返回， TODO: 不考虑return一个常数
tac *emit_return(tac *return_){
    /* COMPLETE emit function */
    Register x;

    x = get_register(_tac_quadruple(return_).var);
    _mips_iprintf("move $sp, $fp");
    _mips_iprintf("lw $ra, %d($fp)", fs_callee - 4);
    _mips_iprintf("lw $fp, %d($fp)", fs_callee - 8);
    _mips_iprintf("move $v0, %s", _reg_name(x));
    _mips_iprintf("addi $sp, $sp, %d", fs_callee);
    _mips_iprintf("jr $ra");

    register_num = 0;
    return return_->next;
}

tac *emit_dec(tac *dec){
    /* NO NEED TO IMPLEMENT */
    return dec->next;
}

// TODO: 先不管参数大于4的情况
// TODO: 参数目前是反过来的，可以考虑倒过来
// 计算一共有多少个参数
void count_arg_aux(tac *arg, int *count){
    if(arg->next != NULL){
        if(arg->next->code.kind == ARG){ 
            count_arg_aux(arg->next, count);
        }
        (*count)++;
        return;
    }
}

tac *emit_arg(tac *arg){
    /* COMPLETE emit function */
    Register x;
    tac *tac_p = arg;
    int count = 0;

    count_arg_aux(arg, &count);
    param_this_time = count; // TODO: 在emit_jal处还要恢复成0
    while(count--){
        // step1: 从内存把变量load给t0
        x = get_register((tac_p->code).arg.var); 
        if(count > 3){
            // 参数放进stack里
            _mips_iprintf("addi $sp, $sp, -4"); // 腾出一个位置
            _mips_iprintf("sw %s, 0($sp)", _reg_name(x));
        }
        else{
            // 参数放进 $a3-a0
            _mips_iprintf("move $a%d, %s", count, _reg_name(x));
        }

        register_num = 0;
        tac_p = tac_p->next;
    }
    return tac_p;
}

// 跳转过去之后，返回值由$v0传回来
// TODO: 没有考虑上下文恢复等各种东西
tac *emit_call(tac *call){
    /* COMPLETE emit function */
    Register x;

    x = get_register_w(_tac_quadruple(call).ret);
    // 注意：fp = sp已经在另外一个函数里确定了
    // 产生一个jal指令
    _mips_iprintf("jal %s", _tac_quadruple(call).funcname); // 跳过去读
    _mips_iprintf("move %s, $v0", _reg_name(x));
    tag_debug_log("param_this_time = %d\n", param_this_time);
    _mips_iprintf("addi $sp, $sp, %d", (param_this_time-4)*4 > 0 ? (param_this_time-4)*4 : 0);

    param_this_time = 0;
    register_num = 0;
    spill_register(x);
    return call->next;
}

// TODO：先不管参数大于4的情况
// TODO: 不同函数之间需要重置offset
tac *emit_param(tac *param){
    /* COMPLETE emit function */
    // TODO:假设此时sp, fp已经设置好
    Register x;
    
    x = get_register_w(_tac_quadruple(param).p);
    // 所有参数在 a0 - a3，多余的在stack里
    // step1: 把参数从a0-a3以及stack中放进寄存器里
    if(param_count < 4){
        _mips_iprintf("move %s, $a%d", _reg_name(x), 
            param_count); // 把读取的数字存进x里
    }
    else{
        // 参数在Stack里
        _mips_iprintf("lw %s, %d($fp)", _reg_name(x),
                            fs_callee + (param_count-4)*4);
    }

    if(param->next != NULL){
        if(param->next->code.kind != PARAM){
            param_count = 0;
        }
        else{
            param_count++;
        }
    }

    // step2: 把寄存器中的值用spill存入内存
    register_num = 0;
    spill_register(x);
    return param->next;
}

tac *emit_read(tac *read){
    Register x = get_register_w(_tac_quadruple(read).p);

    _mips_iprintf("addi $sp, $sp, -4"); // 给stack腾出空间 
    _mips_iprintf("sw $ra, 0($sp)"); // 把$ra存入stack（储存上下文）
    _mips_iprintf("jal read"); // 跳过去读
    _mips_iprintf("lw $ra, 0($sp)"); // 把$ra放回来（恢复上下文）
    _mips_iprintf("addi $sp, $sp, 4"); // 恢复stack
    _mips_iprintf("move %s, $v0", _reg_name(x)); // 把读取的数字存进x里

    register_num = 0;
    spill_register(x);
    return read->next;
}

tac *emit_write(tac *write){
    Register x = get_register(_tac_quadruple(write).p);
    _mips_iprintf("move $a0, %s", _reg_name(x)); // 放入参数
    _mips_iprintf("addi $sp, $sp, -4"); // 腾出空间
    _mips_iprintf("sw $ra, 0($sp)"); // 储存上下文
    _mips_iprintf("jal write"); // 跳过去写
    _mips_iprintf("lw $ra, 0($sp)"); // 恢复上下文
    _mips_iprintf("addi $sp, $sp, 4");

    register_num = 0;
    return write->next;
}

void emit_preamble(){ // 打印前缀
    _mips_printf("# SPL compiler generated assembly");
    _mips_printf(".data");
    _mips_printf("_prmpt: .asciiz \"Enter an integer: \"");
    _mips_printf("_eol: .asciiz \"\\n\"");
    _mips_printf(".globl main");
    _mips_printf(".text");
}

void emit_read_function(){ // 读取函数
    _mips_printf("read:");
    _mips_iprintf("li $v0, 4");
    _mips_iprintf("la $a0, _prmpt");
    _mips_iprintf("syscall");
    _mips_iprintf("li $v0, 5");
    _mips_iprintf("syscall");
    _mips_iprintf("jr $ra");
}

void emit_write_function(){ // 写函数
    _mips_printf("write:");
    _mips_iprintf("li $v0, 1");
    _mips_iprintf("syscall");
    _mips_iprintf("li $v0, 4");
    _mips_iprintf("la $a0, _eol");
    _mips_iprintf("syscall");
    _mips_iprintf("move $v0, $0");
    _mips_iprintf("jr $ra");
}

static tac* (*emitter[])(tac*) = {
    emit_label, emit_function, emit_assign,
    emit_add, emit_sub, emit_mul, emit_div,
    emit_addr, emit_fetch, emit_deref, emit_goto,
    emit_iflt, emit_ifle, emit_ifgt, emit_ifge, emit_ifne, emit_ifeq,
    emit_return, emit_dec, emit_arg, emit_call, emit_param,
    emit_read, emit_write
};

tac *emit_code(tac *head){
    tac *(*tac_emitter)(tac*);
    tac *tac_code = head;
    emit_preamble();
    emit_read_function();
    emit_write_function();
    while(tac_code != NULL){
        if(_tac_kind(tac_code) != NONE){
            tag_debug_log("%s\n", _tac_inst_tostring[tac_code->code.kind]);
            tac_emitter = emitter[_tac_kind(tac_code)];
            tac_code = tac_emitter(tac_code);
        }
        else{
            tac_code = tac_code->next;

        }
    }
}

/* translate a TAC list into mips32 assembly
   output the textual assembly code to _fd */
void mips32_gen(tac *head, FILE *_fd){
    regs[zero].name = "$zero";
    regs[at].name = "$at";
    regs[v0].name = "$v0"; regs[v1].name = "$v1";
    regs[a0].name = "$a0"; regs[a1].name = "$a1";
    regs[a2].name = "$a2"; regs[a3].name = "$a3";
    regs[t0].name = "$t0"; regs[t1].name = "$t1";
    regs[t2].name = "$t2"; regs[t3].name = "$t3";
    regs[t4].name = "$t4"; regs[t5].name = "$t5";
    regs[t6].name = "$t6"; regs[t7].name = "$t7";
    regs[s0].name = "$s0"; regs[s1].name = "$s1";
    regs[s2].name = "$s2"; regs[s3].name = "$s3";
    regs[s4].name = "$s4"; regs[s5].name = "$s5";
    regs[s6].name = "$s6"; regs[s7].name = "$s7";
    regs[t8].name = "$t8"; regs[t9].name = "$t9";
    regs[k0].name = "$k0"; regs[k1].name = "$k1";
    regs[gp].name = "$gp";
    regs[sp].name = "$sp"; regs[fp].name = "$fp";
    regs[ra].name = "$ra";
    vars = (struct VarDesc*)malloc(sizeof(struct VarDesc));
    vars->next = NULL;
    fd = _fd;
    emit_code(head);
}
