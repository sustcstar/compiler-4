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
fact:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  move $fp, $sp
  move $t0, $a0
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  lw $t0, -4($fp)
  li $t1, 1
  beq $t0, $t1, label1
  j label2
label1:
  lw $t0, -4($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
label2:
  lw $t1, -4($fp)
  addi $t0, $t1, -1
  addi $sp, $sp, -4
  sw $t0, -8($fp)
  lw $t0, -8($fp)
  move $a0, $t0
  jal fact
  move $t0, $v0
  addi $sp, $sp, 0
  addi $sp, $sp, -4
  sw $t0, -12($fp)
  lw $t1, -4($fp)
  lw $t2, -12($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -16($fp)
  lw $t0, -16($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
main:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  move $fp, $sp
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  move $t0, $v0
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -8($fp)
  lw $t0, -8($fp)
  li $t1, 1
  bgt $t0, $t1, label3
  j label4
label3:
  lw $t0, -8($fp)
  move $a0, $t0
  jal fact
  move $t0, $v0
  addi $sp, $sp, 0
  addi $sp, $sp, -4
  sw $t0, -12($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -16($fp)
  j label5
label4:
  li $t0, 1
  addi $sp, $sp, -4
  sw $t0, -16($fp)
label5:
  lw $t0, -16($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t0, 0
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
