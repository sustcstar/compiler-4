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
  li $t0, 0
  addi $sp, $sp, -4
  sw $t0, -4($fp)
  lw $t1, -4($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -8($fp)
  li $t0, 5
  addi $sp, $sp, -4
  sw $t0, -12($fp)
  lw $t1, -12($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -16($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -20($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -24($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -28($fp)
  lw $t1, -24($fp)
  lw $t2, -28($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -32($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -36($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -40($fp)
  lw $t1, -36($fp)
  lw $t2, -40($fp)
  add $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -44($fp)
  lw $t1, -32($fp)
  lw $t2, -44($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -48($fp)
  lw $t1, -48($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -52($fp)
  lw $t1, -52($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -56($fp)
  lw $t1, -52($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -60($fp)
  lw $t0, -60($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -52($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -64($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -68($fp)
  lw $t1, -64($fp)
  lw $t2, -68($fp)
  div $t1, $t2
  mflo $t0
  addi $sp, $sp, -4
  sw $t0, -72($fp)
  li $t0, 1
  addi $sp, $sp, -4
  sw $t0, -76($fp)
  lw $t1, -72($fp)
  lw $t2, -76($fp)
  add $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -80($fp)
  lw $t1, -80($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -84($fp)
  lw $t1, -84($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -88($fp)
  lw $t1, -84($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -92($fp)
  lw $t0, -92($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $t1, -16($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -96($fp)
  lw $t1, -52($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -100($fp)
  lw $t1, -96($fp)
  lw $t2, -100($fp)
  add $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -104($fp)
  lw $t1, -84($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -108($fp)
  li $t0, 3
  addi $sp, $sp, -4
  sw $t0, -112($fp)
  lw $t1, -108($fp)
  lw $t2, -112($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -116($fp)
  lw $t1, -104($fp)
  lw $t2, -116($fp)
  sub $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -120($fp)
  lw $t1, -52($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -124($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -128($fp)
  lw $t1, -124($fp)
  lw $t2, -128($fp)
  div $t1, $t2
  mflo $t0
  addi $sp, $sp, -4
  sw $t0, -132($fp)
  li $t0, 4
  addi $sp, $sp, -4
  sw $t0, -136($fp)
  lw $t1, -132($fp)
  lw $t2, -136($fp)
  sub $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -140($fp)
  lw $t1, -120($fp)
  lw $t2, -140($fp)
  add $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -144($fp)
  lw $t1, -144($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -8($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -148($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -152($fp)
  lw $t0, -152($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  li $t0, 0
  addi $sp, $sp, -4
  sw $t0, -156($fp)
  lw $t0, -156($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
