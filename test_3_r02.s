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
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal read
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  move $t0, $v0
  addi $sp, $sp, -4
  sw $t0, -16($fp)
  lw $t1, -16($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -20($fp)
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -24($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -28($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -32($fp)
  li $t0, 100
  addi $sp, $sp, -4
  sw $t0, -36($fp)
  lw $t1, -32($fp)
  lw $t2, -36($fp)
  div $t1, $t2
  mflo $t0
  addi $sp, $sp, -4
  sw $t0, -40($fp)
  li $t0, 100
  addi $sp, $sp, -4
  sw $t0, -44($fp)
  lw $t1, -40($fp)
  lw $t2, -44($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -48($fp)
  lw $t0, -28($fp)
  lw $t1, -48($fp)
  beq $t0, $t1, label0
  j label1
label0:
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -52($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -56($fp)
  li $t0, 400
  addi $sp, $sp, -4
  sw $t0, -60($fp)
  lw $t1, -56($fp)
  lw $t2, -60($fp)
  div $t1, $t2
  mflo $t0
  addi $sp, $sp, -4
  sw $t0, -64($fp)
  li $t0, 400
  addi $sp, $sp, -4
  sw $t0, -68($fp)
  lw $t1, -64($fp)
  lw $t2, -68($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -72($fp)
  lw $t0, -52($fp)
  lw $t1, -72($fp)
  beq $t0, $t1, label3
  j label4
label3:
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -76($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -80($fp)
  lw $t0, -76($fp)
  lw $t1, -80($fp)
  beq $t0, $t1, label6
  j label7
label6:
  li $t0, 29
  addi $sp, $sp, -4
  sw $t0, -84($fp)
  lw $t0, -84($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label8
label7:
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -88($fp)
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -92($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -96($fp)
  lw $t1, -92($fp)
  lw $t2, -96($fp)
  div $t1, $t2
  mflo $t0
  addi $sp, $sp, -4
  sw $t0, -100($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -104($fp)
  lw $t1, -100($fp)
  lw $t2, -104($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -108($fp)
  lw $t0, -88($fp)
  lw $t1, -108($fp)
  beq $t0, $t1, label9
  j label10
label9:
  li $t0, 30
  addi $sp, $sp, -4
  sw $t0, -112($fp)
  lw $t0, -112($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label11
label10:
  li $t0, 31
  addi $sp, $sp, -4
  sw $t0, -116($fp)
  lw $t0, -116($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
label11:
label8:
  j label5
label4:
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -120($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -124($fp)
  lw $t0, -120($fp)
  lw $t1, -124($fp)
  beq $t0, $t1, label12
  j label13
label12:
  li $t0, 28
  addi $sp, $sp, -4
  sw $t0, -128($fp)
  lw $t0, -128($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label14
label13:
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -132($fp)
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -136($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -140($fp)
  lw $t1, -136($fp)
  lw $t2, -140($fp)
  div $t1, $t2
  mflo $t0
  addi $sp, $sp, -4
  sw $t0, -144($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -148($fp)
  lw $t1, -144($fp)
  lw $t2, -148($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -152($fp)
  lw $t0, -132($fp)
  lw $t1, -152($fp)
  beq $t0, $t1, label15
  j label16
label15:
  li $t0, 30
  addi $sp, $sp, -4
  sw $t0, -156($fp)
  lw $t0, -156($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label17
label16:
  li $t0, 31
  addi $sp, $sp, -4
  sw $t0, -160($fp)
  lw $t0, -160($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
label17:
label14:
label5:
  j label2
label1:
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -164($fp)
  lw $t1, -8($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -168($fp)
  li $t0, 4
  addi $sp, $sp, -4
  sw $t0, -172($fp)
  lw $t1, -168($fp)
  lw $t2, -172($fp)
  div $t1, $t2
  mflo $t0
  addi $sp, $sp, -4
  sw $t0, -176($fp)
  li $t0, 4
  addi $sp, $sp, -4
  sw $t0, -180($fp)
  lw $t1, -176($fp)
  lw $t2, -180($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -184($fp)
  lw $t0, -164($fp)
  lw $t1, -184($fp)
  beq $t0, $t1, label18
  j label19
label18:
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -188($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -192($fp)
  lw $t0, -188($fp)
  lw $t1, -192($fp)
  beq $t0, $t1, label21
  j label22
label21:
  li $t0, 29
  addi $sp, $sp, -4
  sw $t0, -196($fp)
  lw $t0, -196($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label23
label22:
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -200($fp)
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -204($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -208($fp)
  lw $t1, -204($fp)
  lw $t2, -208($fp)
  div $t1, $t2
  mflo $t0
  addi $sp, $sp, -4
  sw $t0, -212($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -216($fp)
  lw $t1, -212($fp)
  lw $t2, -216($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -220($fp)
  lw $t0, -200($fp)
  lw $t1, -220($fp)
  beq $t0, $t1, label24
  j label25
label24:
  li $t0, 30
  addi $sp, $sp, -4
  sw $t0, -224($fp)
  lw $t0, -224($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label26
label25:
  li $t0, 31
  addi $sp, $sp, -4
  sw $t0, -228($fp)
  lw $t0, -228($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
label26:
label23:
  j label20
label19:
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -232($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -236($fp)
  lw $t0, -232($fp)
  lw $t1, -236($fp)
  beq $t0, $t1, label27
  j label28
label27:
  li $t0, 28
  addi $sp, $sp, -4
  sw $t0, -240($fp)
  lw $t0, -240($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label29
label28:
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -244($fp)
  lw $t1, -20($fp)
  move $t0, $t1
  addi $sp, $sp, -4
  sw $t0, -248($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -252($fp)
  lw $t1, -248($fp)
  lw $t2, -252($fp)
  div $t1, $t2
  mflo $t0
  addi $sp, $sp, -4
  sw $t0, -256($fp)
  li $t0, 2
  addi $sp, $sp, -4
  sw $t0, -260($fp)
  lw $t1, -256($fp)
  lw $t2, -260($fp)
  mul $t0, $t1, $t2
  addi $sp, $sp, -4
  sw $t0, -264($fp)
  lw $t0, -244($fp)
  lw $t1, -264($fp)
  beq $t0, $t1, label30
  j label31
label30:
  li $t0, 30
  addi $sp, $sp, -4
  sw $t0, -268($fp)
  lw $t0, -268($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  j label32
label31:
  li $t0, 31
  addi $sp, $sp, -4
  sw $t0, -272($fp)
  lw $t0, -272($fp)
  move $a0, $t0
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  jal write
  lw $ra, 0($sp)
  addi $sp, $sp, 4
label32:
label29:
label20:
label2:
  li $t0, 0
  addi $sp, $sp, -4
  sw $t0, -276($fp)
  lw $t0, -276($fp)
  move $sp, $fp
  lw $ra, 4($fp)
  lw $fp, 0($fp)
  move $v0, $t0
  addi $sp, $sp, 8
  jr $ra
