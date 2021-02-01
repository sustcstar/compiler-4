# SPL compiler generated assembly
.data
_prmpt: .asciiz "Enter an integer: "
_eol: .asciiz "\n"
.globl main
.text
read:
  li $v0, 4
  la $a0, _prmpt
  syscall
  li $v0, 5
  syscall
  jr $ra
write:
  li $v0, 1
  syscall
  li $v0, 4
  la $a0, _eol
  syscall
  move $v0, $0
  jr $ra
FUNCTION
mod:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  move $fp, $sp
PARAM
  move $t0, $a0
In spill, var_name = number2
  addi $sp, $sp, -4
var_offset = 4
  sw $t0, -4($fp)
PARAM
  move $t0, $a1
In spill, var_name = m2
  addi $sp, $sp, -4
var_offset = 8
  sw $t0, -8($fp)
ASSIGN
opd->char_val = number2
  lw $t1, -4($fp)
  move $t0, $t1
In spill, var_name = t1
  addi $sp, $sp, -4
var_offset = 12
  sw $t0, -12($fp)
ASSIGN
opd->char_val = number2
  lw $t1, -4($fp)
  move $t0, $t1
In spill, var_name = t5
  addi $sp, $sp, -4
var_offset = 16
  sw $t0, -16($fp)
ASSIGN
opd->char_val = m2
  lw $t1, -8($fp)
  move $t0, $t1
In spill, var_name = t6
  addi $sp, $sp, -4
var_offset = 20
  sw $t0, -20($fp)
DIV
opd->char_val = t5
  lw $t1, -16($fp)
opd->char_val = t6
  lw $t2, -20($fp)
  div $t1, $t2
  mflo $t0
In spill, var_name = t3
  addi $sp, $sp, -4
var_offset = 24
  sw $t0, -24($fp)
ASSIGN
opd->char_val = m2
  lw $t1, -8($fp)
  move $t0, $t1
In spill, var_name = t4
  addi $sp, $sp, -4
var_offset = 28
  sw $t0, -28($fp)
MUL
opd->char_val = t3
  lw $t1, -24($fp)
opd->char_val = t4
  lw $t2, -28($fp)
  mul $t0, $t1, $t2
In spill, var_name = t2
  addi $sp, $sp, -4
var_offset = 32
  sw $t0, -32($fp)
SUB
opd->char_val = t1
  lw $t1, -12($fp)
opd->char_val = t2
  lw $t2, -32($fp)
  sub $t0, $t1, $t2
In spill, var_name = t0
  addi $sp, $sp, -4
var_offset = 36
  sw $t0, -36($fp)
ASSIGN
opd->char_val = t0
  lw $t1, -36($fp)
  move $t0, $t1
In spill, var_name = result
  addi $sp, $sp, -4
var_offset = 40
  sw $t0, -40($fp)
ASSIGN
opd->char_val = result
  lw $t1, -40($fp)
  move $t0, $t1
In spill, var_name = t7
  addi $sp, $sp, -4
var_offset = 44
  sw $t0, -44($fp)
ASSIGN
opd->char_val = t7
  lw $t1, -44($fp)
  move $t0, $t1
In spill, var_name = result2
  addi $sp, $sp, -4
var_offset = 48
  sw $t0, -48($fp)
ASSIGN
opd->char_val = result
  lw $t1, -40($fp)
  move $t0, $t1
In spill, var_name = t8
  addi $sp, $sp, -4
var_offset = 52
  sw $t0, -52($fp)
RETURN
opd->char_val = t8
  lw $t0, -52($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
FUNCTION
power:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  move $fp, $sp
PARAM
  move $t0, $a0
In spill, var_name = base1
  addi $sp, $sp, -4
var_offset = 4
  sw $t0, -4($fp)
PARAM
  move $t0, $a1
In spill, var_name = p1
  addi $sp, $sp, -4
var_offset = 8
  sw $t0, -8($fp)
ASSIGN
  li $t0, 1
In spill, var_name = t12
  addi $sp, $sp, -4
var_offset = 12
  sw $t0, -12($fp)
ASSIGN
opd->char_val = p1
  lw $t1, -8($fp)
  move $t0, $t1
In spill, var_name = t13
  addi $sp, $sp, -4
var_offset = 16
  sw $t0, -16($fp)
ADD
opd->char_val = t12
  lw $t1, -12($fp)
opd->char_val = t13
  lw $t2, -16($fp)
  add $t0, $t1, $t2
In spill, var_name = t10
  addi $sp, $sp, -4
var_offset = 20
  sw $t0, -20($fp)
ASSIGN
opd->char_val = p1
  lw $t1, -8($fp)
  move $t0, $t1
In spill, var_name = t11
  addi $sp, $sp, -4
var_offset = 24
  sw $t0, -24($fp)
SUB
opd->char_val = t10
  lw $t1, -20($fp)
opd->char_val = t11
  lw $t2, -24($fp)
  sub $t0, $t1, $t2
In spill, var_name = t9
  addi $sp, $sp, -4
var_offset = 28
  sw $t0, -28($fp)
ASSIGN
opd->char_val = t9
  lw $t1, -28($fp)
  move $t0, $t1
In spill, var_name = ret1
  addi $sp, $sp, -4
var_offset = 32
  sw $t0, -32($fp)
LABEL
label0:
ASSIGN
opd->char_val = p1
  lw $t1, -8($fp)
  move $t0, $t1
In spill, var_name = t14
  addi $sp, $sp, -4
var_offset = 36
  sw $t0, -36($fp)
ASSIGN
opd->char_val = ret1
  lw $t1, -32($fp)
  move $t0, $t1
In spill, var_name = t24
  addi $sp, $sp, -4
var_offset = 40
  sw $t0, -40($fp)
ASSIGN
opd->char_val = ret1
  lw $t1, -32($fp)
  move $t0, $t1
In spill, var_name = t25
  addi $sp, $sp, -4
var_offset = 44
  sw $t0, -44($fp)
SUB
opd->char_val = t24
  lw $t1, -40($fp)
opd->char_val = t25
  lw $t2, -44($fp)
  sub $t0, $t1, $t2
In spill, var_name = t22
  addi $sp, $sp, -4
var_offset = 48
  sw $t0, -48($fp)
ASSIGN
  li $t0, 90
In spill, var_name = t23
  addi $sp, $sp, -4
var_offset = 52
  sw $t0, -52($fp)
ADD
opd->char_val = t22
  lw $t1, -48($fp)
opd->char_val = t23
  lw $t2, -52($fp)
  add $t0, $t1, $t2
In spill, var_name = t20
  addi $sp, $sp, -4
var_offset = 56
  sw $t0, -56($fp)
ASSIGN
  li $t0, 89
In spill, var_name = t21
  addi $sp, $sp, -4
var_offset = 60
  sw $t0, -60($fp)
SUB
opd->char_val = t20
  lw $t1, -56($fp)
opd->char_val = t21
  lw $t2, -60($fp)
  sub $t0, $t1, $t2
In spill, var_name = t18
  addi $sp, $sp, -4
var_offset = 64
  sw $t0, -64($fp)
ASSIGN
  li $t0, 1
In spill, var_name = t19
  addi $sp, $sp, -4
var_offset = 68
  sw $t0, -68($fp)
ADD
opd->char_val = t18
  lw $t1, -64($fp)
opd->char_val = t19
  lw $t2, -68($fp)
  add $t0, $t1, $t2
In spill, var_name = t16
  addi $sp, $sp, -4
var_offset = 72
  sw $t0, -72($fp)
ASSIGN
  li $t0, 2
In spill, var_name = t17
  addi $sp, $sp, -4
var_offset = 76
  sw $t0, -76($fp)
SUB
opd->char_val = t16
  lw $t1, -72($fp)
opd->char_val = t17
  lw $t2, -76($fp)
  sub $t0, $t1, $t2
In spill, var_name = t15
  addi $sp, $sp, -4
var_offset = 80
  sw $t0, -80($fp)
IFGT
opd->char_val = t14
  lw $t0, -36($fp)
opd->char_val = t15
  lw $t1, -80($fp)
  bgt $t0, $t1, label1
GOTO
  j label2
LABEL
label1:
ASSIGN
opd->char_val = ret1
  lw $t1, -32($fp)
  move $t0, $t1
In spill, var_name = t28
  addi $sp, $sp, -4
var_offset = 84
  sw $t0, -84($fp)
ASSIGN
opd->char_val = base1
  lw $t1, -4($fp)
  move $t0, $t1
In spill, var_name = t29
  addi $sp, $sp, -4
var_offset = 88
  sw $t0, -88($fp)
MUL
opd->char_val = t28
  lw $t1, -84($fp)
opd->char_val = t29
  lw $t2, -88($fp)
  mul $t0, $t1, $t2
In spill, var_name = t27
  addi $sp, $sp, -4
var_offset = 92
  sw $t0, -92($fp)
ASSIGN
opd->char_val = t27
  lw $t1, -92($fp)
  move $t0, $t1
In spill, var_name = ret1
  addi $sp, $sp, -4
  sw $t0, -32($fp)
find: var_offset = 92
ASSIGN
opd->char_val = ret1
  lw $t1, -32($fp)
  move $t0, $t1
In spill, var_name = t26
  addi $sp, $sp, -4
var_offset = 96
  sw $t0, -96($fp)
ASSIGN
  li $t0, 2
In spill, var_name = t38
  addi $sp, $sp, -4
var_offset = 100
  sw $t0, -100($fp)
ASSIGN
  li $t0, 1
In spill, var_name = t39
  addi $sp, $sp, -4
var_offset = 104
  sw $t0, -104($fp)
MUL
opd->char_val = t38
  lw $t1, -100($fp)
opd->char_val = t39
  lw $t2, -104($fp)
  mul $t0, $t1, $t2
In spill, var_name = t36
  addi $sp, $sp, -4
var_offset = 108
  sw $t0, -108($fp)
ASSIGN
opd->char_val = p1
  lw $t1, -8($fp)
  move $t0, $t1
In spill, var_name = t37
  addi $sp, $sp, -4
var_offset = 112
  sw $t0, -112($fp)
MUL
opd->char_val = t36
  lw $t1, -108($fp)
opd->char_val = t37
  lw $t2, -112($fp)
  mul $t0, $t1, $t2
In spill, var_name = t34
  addi $sp, $sp, -4
var_offset = 116
  sw $t0, -116($fp)
ASSIGN
  li $t0, 1
In spill, var_name = t40
  addi $sp, $sp, -4
var_offset = 120
  sw $t0, -120($fp)
ASSIGN
opd->char_val = p1
  lw $t1, -8($fp)
  move $t0, $t1
In spill, var_name = t41
  addi $sp, $sp, -4
var_offset = 124
  sw $t0, -124($fp)
MUL
opd->char_val = t40
  lw $t1, -120($fp)
opd->char_val = t41
  lw $t2, -124($fp)
  mul $t0, $t1, $t2
In spill, var_name = t35
  addi $sp, $sp, -4
var_offset = 128
  sw $t0, -128($fp)
SUB
opd->char_val = t34
  lw $t1, -116($fp)
opd->char_val = t35
  lw $t2, -128($fp)
  sub $t0, $t1, $t2
In spill, var_name = t32
  addi $sp, $sp, -4
var_offset = 132
  sw $t0, -132($fp)
ASSIGN
  li $t0, 1
In spill, var_name = t33
  addi $sp, $sp, -4
var_offset = 136
  sw $t0, -136($fp)
SUB
opd->char_val = t32
  lw $t1, -132($fp)
opd->char_val = t33
  lw $t2, -136($fp)
  sub $t0, $t1, $t2
In spill, var_name = t31
  addi $sp, $sp, -4
var_offset = 140
  sw $t0, -140($fp)
ASSIGN
opd->char_val = t31
  lw $t1, -140($fp)
  move $t0, $t1
In spill, var_name = p1
  addi $sp, $sp, -4
  sw $t0, -8($fp)
find: var_offset = 140
ASSIGN
opd->char_val = p1
  lw $t1, -8($fp)
  move $t0, $t1
In spill, var_name = t30
  addi $sp, $sp, -4
var_offset = 144
  sw $t0, -144($fp)
GOTO
  j label0
LABEL
label2:
ASSIGN
opd->char_val = ret1
  lw $t1, -32($fp)
  move $t0, $t1
In spill, var_name = t42
  addi $sp, $sp, -4
var_offset = 148
  sw $t0, -148($fp)
RETURN
opd->char_val = t42
  lw $t0, -148($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
FUNCTION
getNumDigits:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  move $fp, $sp
PARAM
  move $t0, $a0
In spill, var_name = number3
  addi $sp, $sp, -4
var_offset = 4
  sw $t0, -4($fp)
ASSIGN
  li $t0, 0
In spill, var_name = t43
  addi $sp, $sp, -4
var_offset = 8
  sw $t0, -8($fp)
ASSIGN
opd->char_val = t43
  lw $t1, -8($fp)
  move $t0, $t1
In spill, var_name = ret3
  addi $sp, $sp, -4
var_offset = 12
  sw $t0, -12($fp)
ASSIGN
opd->char_val = number3
  lw $t1, -4($fp)
  move $t0, $t1
In spill, var_name = t44
  addi $sp, $sp, -4
var_offset = 16
  sw $t0, -16($fp)
ASSIGN
  li $t0, 0
In spill, var_name = t45
  addi $sp, $sp, -4
var_offset = 20
  sw $t0, -20($fp)
IFLT
opd->char_val = t44
  lw $t0, -16($fp)
opd->char_val = t45
  lw $t1, -20($fp)
  blt $t0, $t1, label3
GOTO
  j label4
LABEL
label3:
ASSIGN
  li $t0, 1
In spill, var_name = t47
  addi $sp, $sp, -4
var_offset = 24
  sw $t0, -24($fp)
SUB
opd->char_val = t47
  lw $t1, -24($fp)
  neg $t1, $t1
  addi $t0, $t1, 0
In spill, var_name = t46
  addi $sp, $sp, -4
var_offset = 28
  sw $t0, -28($fp)
RETURN
opd->char_val = t46
  lw $t0, -28($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
LABEL
label4:
LABEL
label5:
ASSIGN
opd->char_val = number3
  lw $t1, -4($fp)
  move $t0, $t1
In spill, var_name = t48
  addi $sp, $sp, -4
var_offset = 32
  sw $t0, -32($fp)
ASSIGN
  li $t0, 0
In spill, var_name = t49
  addi $sp, $sp, -4
var_offset = 36
  sw $t0, -36($fp)
IFGT
opd->char_val = t48
  lw $t0, -32($fp)
opd->char_val = t49
  lw $t1, -36($fp)
  bgt $t0, $t1, label6
GOTO
  j label7
LABEL
label6:
ASSIGN
opd->char_val = number3
  lw $t1, -4($fp)
  move $t0, $t1
In spill, var_name = t52
  addi $sp, $sp, -4
var_offset = 40
  sw $t0, -40($fp)
ASSIGN
  li $t0, 10
In spill, var_name = t53
  addi $sp, $sp, -4
var_offset = 44
  sw $t0, -44($fp)
DIV
opd->char_val = t52
  lw $t1, -40($fp)
opd->char_val = t53
  lw $t2, -44($fp)
  div $t1, $t2
  mflo $t0
In spill, var_name = t51
  addi $sp, $sp, -4
var_offset = 48
  sw $t0, -48($fp)
ASSIGN
opd->char_val = t51
  lw $t1, -48($fp)
  move $t0, $t1
In spill, var_name = number3
  addi $sp, $sp, -4
  sw $t0, -4($fp)
find: var_offset = 48
ASSIGN
opd->char_val = number3
  lw $t1, -4($fp)
  move $t0, $t1
In spill, var_name = t50
  addi $sp, $sp, -4
var_offset = 52
  sw $t0, -52($fp)
ASSIGN
opd->char_val = ret3
  lw $t1, -12($fp)
  move $t0, $t1
In spill, var_name = t56
  addi $sp, $sp, -4
var_offset = 56
  sw $t0, -56($fp)
ASSIGN
  li $t0, 2
In spill, var_name = t57
  addi $sp, $sp, -4
var_offset = 60
  sw $t0, -60($fp)
ADD
opd->char_val = t56
  lw $t1, -56($fp)
opd->char_val = t57
  lw $t2, -60($fp)
  add $t0, $t1, $t2
In spill, var_name = t55
  addi $sp, $sp, -4
var_offset = 64
  sw $t0, -64($fp)
ASSIGN
opd->char_val = t55
  lw $t1, -64($fp)
  move $t0, $t1
In spill, var_name = ret3
  addi $sp, $sp, -4
  sw $t0, -12($fp)
find: var_offset = 64
ASSIGN
opd->char_val = ret3
  lw $t1, -12($fp)
  move $t0, $t1
In spill, var_name = t54
  addi $sp, $sp, -4
var_offset = 68
  sw $t0, -68($fp)
ASSIGN
opd->char_val = ret3
  lw $t1, -12($fp)
  move $t0, $t1
In spill, var_name = t60
  addi $sp, $sp, -4
var_offset = 72
  sw $t0, -72($fp)
ASSIGN
  li $t0, 2
In spill, var_name = t61
  addi $sp, $sp, -4
var_offset = 76
  sw $t0, -76($fp)
ADD
opd->char_val = t60
  lw $t1, -72($fp)
opd->char_val = t61
  lw $t2, -76($fp)
  add $t0, $t1, $t2
In spill, var_name = t59
  addi $sp, $sp, -4
var_offset = 80
  sw $t0, -80($fp)
ASSIGN
opd->char_val = t59
  lw $t1, -80($fp)
  move $t0, $t1
In spill, var_name = ret3
  addi $sp, $sp, -4
  sw $t0, -12($fp)
find: var_offset = 80
ASSIGN
opd->char_val = ret3
  lw $t1, -12($fp)
  move $t0, $t1
In spill, var_name = t58
  addi $sp, $sp, -4
var_offset = 84
  sw $t0, -84($fp)
ASSIGN
opd->char_val = ret3
  lw $t1, -12($fp)
  move $t0, $t1
In spill, var_name = t64
  addi $sp, $sp, -4
var_offset = 88
  sw $t0, -88($fp)
ASSIGN
  li $t0, 3
In spill, var_name = t65
  addi $sp, $sp, -4
var_offset = 92
  sw $t0, -92($fp)
SUB
opd->char_val = t64
  lw $t1, -88($fp)
opd->char_val = t65
  lw $t2, -92($fp)
  sub $t0, $t1, $t2
In spill, var_name = t63
  addi $sp, $sp, -4
var_offset = 96
  sw $t0, -96($fp)
ASSIGN
opd->char_val = t63
  lw $t1, -96($fp)
  move $t0, $t1
In spill, var_name = ret3
  addi $sp, $sp, -4
  sw $t0, -12($fp)
find: var_offset = 96
ASSIGN
opd->char_val = ret3
  lw $t1, -12($fp)
  move $t0, $t1
In spill, var_name = t62
  addi $sp, $sp, -4
var_offset = 100
  sw $t0, -100($fp)
GOTO
  j label5
LABEL
label7:
ASSIGN
opd->char_val = ret3
  lw $t1, -12($fp)
  move $t0, $t1
In spill, var_name = t66
  addi $sp, $sp, -4
var_offset = 104
  sw $t0, -104($fp)
RETURN
opd->char_val = t66
  lw $t0, -104($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
FUNCTION
isNarcissistic:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  move $fp, $sp
PARAM
  move $t0, $a0
In spill, var_name = number4
  addi $sp, $sp, -4
var_offset = 4
  sw $t0, -4($fp)
ASSIGN
  li $t0, 1
In spill, var_name = t71
  addi $sp, $sp, -4
var_offset = 8
  sw $t0, -8($fp)
ASSIGN
opd->char_val = number4
  lw $t1, -4($fp)
  move $t0, $t1
In spill, var_name = t72
  addi $sp, $sp, -4
var_offset = 12
  sw $t0, -12($fp)
ADD
opd->char_val = t71
  lw $t1, -8($fp)
opd->char_val = t72
  lw $t2, -12($fp)
  add $t0, $t1, $t2
In spill, var_name = t69
  addi $sp, $sp, -4
var_offset = 16
  sw $t0, -16($fp)
ASSIGN
  li $t0, 1
In spill, var_name = t70
  addi $sp, $sp, -4
var_offset = 20
  sw $t0, -20($fp)
SUB
opd->char_val = t69
  lw $t1, -16($fp)
opd->char_val = t70
  lw $t2, -20($fp)
  sub $t0, $t1, $t2
In spill, var_name = t68
  addi $sp, $sp, -4
var_offset = 24
  sw $t0, -24($fp)
ARG
opd->char_val = t68
  lw $t0, -24($fp)
  move $a0, $t0
CALL
  jal getNumDigits
  move $t0, $v0
param_this_time = 1
  addi $sp, $sp, 0
In spill, var_name = t67
  addi $sp, $sp, -4
var_offset = 28
  sw $t0, -28($fp)
ASSIGN
opd->char_val = t67
  lw $t1, -28($fp)
  move $t0, $t1
In spill, var_name = numDigits4
  addi $sp, $sp, -4
var_offset = 32
  sw $t0, -32($fp)
ASSIGN
  li $t0, 0
In spill, var_name = t73
  addi $sp, $sp, -4
var_offset = 36
  sw $t0, -36($fp)
ASSIGN
opd->char_val = t73
  lw $t1, -36($fp)
  move $t0, $t1
In spill, var_name = sum4
  addi $sp, $sp, -4
var_offset = 40
  sw $t0, -40($fp)
ASSIGN
opd->char_val = number4
  lw $t1, -4($fp)
  move $t0, $t1
In spill, var_name = t74
  addi $sp, $sp, -4
var_offset = 44
  sw $t0, -44($fp)
ASSIGN
opd->char_val = t74
  lw $t1, -44($fp)
  move $t0, $t1
In spill, var_name = n4
  addi $sp, $sp, -4
var_offset = 48
  sw $t0, -48($fp)
LABEL
label8:
ASSIGN
opd->char_val = n4
  lw $t1, -48($fp)
  move $t0, $t1
In spill, var_name = t75
  addi $sp, $sp, -4
var_offset = 52
  sw $t0, -52($fp)
ASSIGN
  li $t0, 0
In spill, var_name = t76
  addi $sp, $sp, -4
var_offset = 56
  sw $t0, -56($fp)
IFGT
opd->char_val = t75
  lw $t0, -52($fp)
opd->char_val = t76
  lw $t1, -56($fp)
  bgt $t0, $t1, label9
GOTO
  j label10
LABEL
label9:
ASSIGN
opd->char_val = n4
  lw $t1, -48($fp)
  move $t0, $t1
In spill, var_name = t79
  addi $sp, $sp, -4
var_offset = 60
  sw $t0, -60($fp)
ASSIGN
  li $t0, 10
In spill, var_name = t80
  addi $sp, $sp, -4
var_offset = 64
  sw $t0, -64($fp)
ARG
opd->char_val = t80
  lw $t0, -64($fp)
  move $a1, $t0
opd->char_val = t79
  lw $t0, -60($fp)
  move $a0, $t0
CALL
  jal mod
  move $t0, $v0
param_this_time = 2
  addi $sp, $sp, 0
In spill, var_name = t78
  addi $sp, $sp, -4
var_offset = 68
  sw $t0, -68($fp)
ASSIGN
opd->char_val = t78
  lw $t1, -68($fp)
  move $t0, $t1
In spill, var_name = s4
  addi $sp, $sp, -4
var_offset = 72
  sw $t0, -72($fp)
ASSIGN
opd->char_val = s4
  lw $t1, -72($fp)
  move $t0, $t1
In spill, var_name = t77
  addi $sp, $sp, -4
var_offset = 76
  sw $t0, -76($fp)
ASSIGN
opd->char_val = n4
  lw $t1, -48($fp)
  move $t0, $t1
In spill, var_name = t85
  addi $sp, $sp, -4
var_offset = 80
  sw $t0, -80($fp)
ASSIGN
opd->char_val = s4