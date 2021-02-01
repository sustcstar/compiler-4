#ifndef TAC_H
#define TAC_H

#include<assert.h>
#include<ctype.h>
#include<stdarg.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct tac_opd tac_opd;
typedef struct tac_node tac;

struct tac_opd { // TAC的操作数
    enum { OP_LABEL, OP_VARIABLE, OP_CONSTANT, OP_POINTER } kind; // 四种类型，label, 变量, 常数， 指针
    union {
        char char_val[8];   // stores variable name, pointer name // 储存变量名、指针名
        int int_val;        // stores label number, int constant // 储存label的数字以及常数值
    };
};

struct _tac_inst { // TAC 的指令
    enum { LABEL, FUNCTION, ASSIGN, ADD, SUB, MUL, DIV, ADDR, FETCH, DEREF, 
        // 标签， 函数， 赋值， 加法， 减法， 乘法， 出发， 寻址（指针）， FETCH?，指针取值
           GOTO, IFLT, IFLE, IFGT, IFGE, IFNE, IFEQ, RETURN, DEC, ARG,
        // 跳转，如果小于，小于等于，大于，大于等于，不等于，等于，返回，数组/结构体，参数
           CALL, PARAM, READ, WRITE, NONE } kind;
        // 函数调用，参数，读，写，没有
    union {     // all union variables are not pointer!
        // LABEL label[labelno] :
        struct { tac_opd *labelno; } label;
        // FUNCTION funcname :
        struct { char *funcname; } function;
        // left := right
        struct { tac_opd *left, *right; } assign;
        // left := r1 + r2
        struct { tac_opd *left, *r1, *r2; } add;
        // left := r1 - r2
        struct { tac_opd *left, *r1, *r2; } sub;
        // left := r1 * r2
        struct { tac_opd *left, *r1, *r2; } mul;
        // left := r1 / r2
        struct { tac_opd *left, *r1, *r2; } div;
        // left := &right
        struct { tac_opd *left, *right; } addr;
        // left := *raddr
        struct { tac_opd *left, *raddr; } fetch;
        // *laddr := right
        struct { tac_opd *laddr, *right; } deref;
        // GOTO label[labelno]
        struct { tac_opd *labelno; } goto_;
        // IF c1 < c2 GOTO label[labelno]
        struct { tac_opd *c1, *c2; tac_opd *labelno; } iflt;
        // IF c1 <= c2 GOTO label[labelno]
        struct { tac_opd *c1, *c2; tac_opd *labelno; } ifle;
        // IF c1 > c2 GOTO label[labelno]
        struct { tac_opd *c1, *c2; tac_opd *labelno; } ifgt;
        // IF c1 >= c2 GOTO label[labelno]
        struct { tac_opd *c1, *c2; tac_opd *labelno; } ifge;
        // IF c1 != c2 GOTO label[labelno]
        struct { tac_opd *c1, *c2; tac_opd *labelno; } ifne;
        // IF c1 == c2 GOTO label[labelno]
        struct { tac_opd *c1, *c2; tac_opd *labelno; } ifeq;
        // RETURN var
        struct { tac_opd *var; } return_;
        // DEC var size
        struct { tac_opd *var; int size; } dec;
        // ARG var
        struct { tac_opd *var; } arg;
        // ret := CALL funcname
        struct { tac_opd *ret; char *funcname; } call;
        // PARAM p
        struct { tac_opd *p; } param;
        // READ p
        struct { tac_opd *p; } read;
        // WRITE p
        struct { tac_opd *p; } write;
    };
};

struct tac_node { // TAC list是一个链表
    struct _tac_inst code;          // code is not a pointer!
    struct tac_node *prev, *next;   // doubly linked list impl
};

/*
 * construct a tac list from the input buffer
 * put a '\n' after each instruction (also the last one)
 * ## you should put a '\x7f' at the end of the buffer ##
 */
tac *tac_from_buffer(char *buf); // 从input buffer里建立一个tac_list



/*****************************************************************
    ####################### STOP HERE #########################
     The declaration below is related to the intermediate code
     generation, they are not helpful to you in project 4.
    ####################### STOP HERE #########################
 *****************************************************************/

void tac_opd_print(tac_opd*, FILE*);

/*
 * related to intermediate code generation
 * returns a single TAC operand
 */
tac_opd *tac_opd_label(int);
tac_opd *tac_opd_variable(char*);
tac_opd *tac_opd_constant(int);
tac_opd *tac_opd_pointer(char*);

// insert a segment of TAC next to head
void tac_insert(tac*, tac*);

// insert a segment of TAC at the end of list
void tac_append(tac*, tac*);

void tac_print(tac*, FILE*);

/*
 * related to intermediate code generation
 * returns a single TAC quadruple
 */
tac *tac_init_label(tac_opd*);
tac *tac_init_function(char*);
tac *tac_init_assign(tac_opd*, tac_opd*);
tac *tac_init_add(tac_opd*, tac_opd*, tac_opd*);
tac *tac_init_sub(tac_opd*, tac_opd*, tac_opd*);
tac *tac_init_mul(tac_opd*, tac_opd*, tac_opd*);
tac *tac_init_div(tac_opd*, tac_opd*, tac_opd*);
tac *tac_init_addr(tac_opd*, tac_opd*);
tac *tac_init_fetch(tac_opd*, tac_opd*);
tac *tac_init_deref(tac_opd*, tac_opd*);
tac *tac_init_goto(tac_opd*);
tac *tac_init_iflt(tac_opd*, tac_opd*, tac_opd*);
tac *tac_init_ifle(tac_opd*, tac_opd*, tac_opd*);
tac *tac_init_ifgt(tac_opd*, tac_opd*, tac_opd*);
tac *tac_init_ifge(tac_opd*, tac_opd*, tac_opd*);
tac *tac_init_ifne(tac_opd*, tac_opd*, tac_opd*);
tac *tac_init_ifeq(tac_opd*, tac_opd*, tac_opd*);
tac *tac_init_return(tac_opd*);
tac *tac_init_dec(tac_opd*, int);
tac *tac_init_arg(tac_opd*);
tac *tac_init_call(tac_opd*, char*);
tac *tac_init_param(tac_opd*);
tac *tac_init_read(tac_opd*);
tac *tac_init_write(tac_opd*);
tac *tac_init_none();

#endif // TAC_H
