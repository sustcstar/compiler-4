#ifndef MIPS_H
#define MIPS_H

#include "tac.h"
#define FALSE 0
#define TRUE 1

int register_num;
int var_offset;
int param_count;
int arg_count;

typedef unsigned char bool;

typedef enum {
    zero, at, v0, v1, a0, a1, a2, a3,
    t0, t1, t2, t3, t4, t5, t6, t7,
    s0, s1, s2, s3, s4, s5, s6, s7,
    t8, t9, k0, k1, gp, sp, fp, ra, NUM_REGS // 一共32个寄存器
} Register;


struct RegDesc {    // the register descriptor // 寄存器描述符
    const char *name; // 寄存器的名字
    char var[8]; // 存在哪个变量里呢？
    bool dirty; // value updated but not stored
    /* add other fields as you need */
} regs[NUM_REGS]; // 数组


struct VarDesc {    // the variable descriptor // 地址描述符, 我们不存临时变量
    char var[8]; // 这个变量的名字
    Register reg; // 存在哪个寄存器里呢？
    int offset; // the offset from stack 在内存中的位置：与fp的offset
    /* add other fields as you need */
    struct VarDesc *next;
} *vars; // 列表


void mips32_gen(tac *head, FILE *_fd);

#endif // MIPS_H
