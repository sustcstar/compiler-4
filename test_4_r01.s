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
hanoi:
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
  lw $t1, -4($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -20($fp)
  li $t0, 1
  addi $sp, $sp, -4
  sw $t0, -24($fp)
  lw $t0, -20($fp)
  lw $t1, -24($fp)
  beq $t0, $t1, label0
  j label1
label0:
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -28($fp)
  li $t0, 10000
  addi $sp, $sp, -4
  sw $t0, -32($fp)
  lw $t1, -28($fp)
  lw $t2, -32($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -36($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -40($fp)
  lw $t1, -36($fp)
  lw $t2, -40($fp)
  add $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -44($fp)
  lw $t0, -44($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label2
label1:
  lw $t1, -4($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -48($fp)
  li $t0, 1
  addi $sp, $sp, -4
  sw $t0, -52($fp)
  lw $t1, -48($fp)
  lw $t2, -52($fp)
  sub $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -56($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -60($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -64($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -68($fp)
  lw $t0, -68($fp)
  move $a3, $t0
  lw $t0, -64($fp)
  move $a2, $t0
  lw $t0, -60($fp)
  move $a1, $t0
  lw $t0, -56($fp)
  move $a0, $t0
  jal hanoi
  move $t0, $v0
  addi $sp, $sp, 0
  addi $sp, $sp, -4
  sw $t0, -72($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -76($fp)
  li $t0, 10000
  addi $sp, $sp, -4
  sw $t0, -80($fp)
  lw $t1, -76($fp)
  lw $t2, -80($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -84($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -88($fp)
  lw $t1, -84($fp)
  lw $t2, -88($fp)
  add $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -92($fp)
  lw $t0, -92($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -4($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -96($fp)
  li $t0, 1
  addi $sp, $sp, -4
  sw $t0, -100($fp)
  lw $t1, -96($fp)
  lw $t2, -100($fp)
  sub $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -104($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -108($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -112($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -116($fp)
  lw $t0, -116($fp)
  move $a3, $t0
  lw $t0, -112($fp)
  move $a2, $t0
  lw $t0, -108($fp)
  move $a1, $t0
  lw $t0, -104($fp)
  move $a0, $t0
  jal hanoi
  move $t0, $v0
  addi $sp, $sp, 0
  addi $sp, $sp, -4
  sw $t0, -120($fp)
label2:
  li $t0, 0
  addi $sp, $sp, -4
  sw $t0, -124($fp)
  lw $t0, -124($fp)
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
  li $t0, 3
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
  li $t0, 1
  addi $sp, $sp, -4
  sw $t0, -16($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -20($fp)
  li $t0, 3
  addi $sp, $sp, -4
  sw $t0, -24($fp)
  lw $t0, -24($fp)
  move $a3, $t0
  lw $t0, -20($fp)
  move $a2, $t0
  lw $t0, -16($fp)
  move $a1, $t0
  lw $t0, -12($fp)
  move $a0, $t0
  jal hanoi
  move $t0, $v0
  addi $sp, $sp, 0
  addi $sp, $sp, -4
  sw $t0, -28($fp)
  li $t0, 0
  addi $sp, $sp, -4
  sw $t0, -32($fp)
  lw $t0, -32($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
