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
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -12($fp)
  li $t0, 0
  addi $sp, $sp, -4
  sw $t0, -16($fp)
  lw $t0, -12($fp)
  lw $t1, -16($fp)
  bgt $t0, $t1, label0
  j label1
label0:
  li $t0, 1
  addi $sp, $sp, -4
  sw $t0, -20($fp)
  lw $t0, -20($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label2
label1:
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -24($fp)
  li $t0, 0
  addi $sp, $sp, -4
  sw $t0, -28($fp)
  lw $t0, -24($fp)
  lw $t1, -28($fp)
  blt $t0, $t1, label3
  j label4
label3:
  li $t0, 1
  addi $sp, $sp, -4
  sw $t0, -32($fp)
  lw $t1, -32($fp)
  neg $t1, $t1
  addi $t0, $t1, 0
  addi $sp, $sp, -4
  sw $t0, -36($fp)
  lw $t0, -36($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label5
label4:
  li $t0, 0
  addi $sp, $sp, -4
  sw $t0, -40($fp)
  lw $t0, -40($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
label5:
label2:
  li $t0, 0
  addi $sp, $sp, -4
  sw $t0, -44($fp)
  lw $t0, -44($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
