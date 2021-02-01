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
chengfa:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  move $fp, $sp
  move $t0, $a0
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  move $t0, $a1
  addi $sp, $sp, -4
  sw $t0, -8($fp)
  move $t0, $a2
  addi $sp, $sp, -4
  sw $t0, -12($fp)
  lw $t1, -4($fp)
  lw $t2, -8($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  lw $t2, -12($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  lw $t0, -4($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
sum:
  subu $sp, $sp, 8
  sw $ra, 4($sp)
  sw $fp, 0($sp)
  move $fp, $sp
  move $t0, $a0
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  move $t0, $a1
  addi $sp, $sp, -4
  sw $t0, -8($fp)
  move $t0, $a2
  addi $sp, $sp, -4
  sw $t0, -12($fp)
  move $t0, $a3
  addi $sp, $sp, -4
  sw $t0, -16($fp)
  lw $t0, 8($fp)
  addi $sp, $sp, -4
  sw $t0, -20($fp)
  lw $t0, 12($fp)
  addi $sp, $sp, -4
  sw $t0, -24($fp)
  lw $t0, 16($fp)
  addi $sp, $sp, -4
  sw $t0, -28($fp)
  lw $t1, -4($fp)
  lw $t2, -8($fp)
  add $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  lw $t2, -12($fp)
  add $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  lw $t2, -16($fp)
  add $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  lw $t2, -20($fp)
  add $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  lw $t2, -24($fp)
  sub $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  lw $t2, -28($fp)
  add $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  lw $t0, -4($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t0, -12($fp)
  move $a2, $t0
  lw $t0, -8($fp)
  move $a1, $t0
  lw $t0, -4($fp)
  move $a0, $t0
  jal chengfa
  move $t0, $v0
  addi $sp, $sp, 0
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  lw $t0, -4($fp)
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
  li $t0, 1
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -8($fp)
  li $t0, 3
  addi $sp, $sp, -4
  sw $t0, -12($fp)
  li $t0, 4
  addi $sp, $sp, -4
  sw $t0, -16($fp)
  li $t0, 5
  addi $sp, $sp, -4
  sw $t0, -20($fp)
  li $t0, 6
  addi $sp, $sp, -4
  sw $t0, -24($fp)
  li $t0, 7
  addi $sp, $sp, -4
  sw $t0, -28($fp)
  lw $t0, -28($fp)
  addi $sp, $sp, -4
  sw $t0, 0($sp)
  lw $t0, -24($fp)
  addi $sp, $sp, -4
  sw $t0, 0($sp)
  lw $t0, -20($fp)
  addi $sp, $sp, -4
  sw $t0, 0($sp)
  lw $t0, -16($fp)
  move $a3, $t0
  lw $t0, -12($fp)
  move $a2, $t0
  lw $t0, -8($fp)
  move $a1, $t0
  lw $t0, -4($fp)
  move $a0, $t0
  jal sum
  move $t0, $v0
  addi $sp, $sp, 12
  addi $sp, $sp, -4
  sw $t0, -28($fp)
  lw $t0, -28($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t0, 0
  addi $sp, $sp, -4
  sw $t0, -32($fp)
  li $t0, 1
  addi $sp, $sp, -4
  sw $t0, -36($fp)
  lw $t0, -32($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
