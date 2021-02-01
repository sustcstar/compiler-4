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
  li $t0, 110
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  li $t0, 97
  addi $sp, $sp, -4
  sw $t0, -8($fp)
  li $t0, 3
  addi $sp, $sp, -4
  sw $t0, -12($fp)
  lw $t1, -4($fp)
  lw $t2, -8($fp)
  sub $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -16($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -20($fp)
  lw $t1, -12($fp)
  lw $t2, -20($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -24($fp)
  lw $t1, -16($fp)
  lw $t2, -24($fp)
  add $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -28($fp)
  lw $t1, -28($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -12($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -32($fp)
  lw $t0, -32($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t0, 0
  addi $sp, $sp, -4
  sw $t0, -36($fp)
  lw $t0, -36($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
