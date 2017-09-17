.data
.newline: .asciiz "\n"
.text
.globl main
	j main
t:
	addi $sp, $sp, 8
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, 36
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	addi $sp, $sp, -4
	sw $s3, 0($sp)
	addi $sp, $sp, -4
	sw $s4, 0($sp)
	addi $sp, $sp, -4
	sw $s5, 0($sp)
	addi $sp, $sp, -4
	sw $s6, 0($sp)
	addi $sp, $sp, -4
	sw $s7, 0($sp)
	move $sp, $fp
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	addi $sp, $sp, -40
	addi $t0, $fp, -4
	li $t1, 0
	sw $t1, 0($t0)
__whlbgn0:
	addi $t1, $fp, -4
	lw $t1, 0($t1)
	li $t2, 10
	slt $t1, $t1, $t2
	beq $t1, $zero, __whlend0
	addi $t2, $fp, -4
	lw $t2, 0($t2)
	sll $t2, $t2, 2
	addi $t2, $t2, 12
	sub $t2, $fp, $t2
	addi $t3, $fp, -4
	lw $t3, 0($t3)
	li $t4, 1
	add $t3, $t3, $t4
	sll $t3, $t3, 2
	add $t3, $t3, $gp
	addi $t3, $t3, 4
	lw $t3, 0($t3)
	sw $t3, 0($t2)
	addi $t4, $fp, -4
	addi $t5, $fp, -4
	lw $t5, 0($t5)
	li $t6, 1
	add $t5, $t5, $t6
	sw $t5, 0($t4)
	j __whlbgn0
__whlend0:
	li $t6, 3
	sll $t6, $t6, 2
	addi $t6, $t6, 12
	sub $t6, $fp, $t6
	lw $t6, 0($t6)
	move $v0, $t6
	move $sp, $fp
	lw $fp, 0($sp)
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $s7, 0($sp)
	addi $sp, $sp, 4
	lw $s6, 0($sp)
	addi $sp, $sp, 4
	lw $s5, 0($sp)
	addi $sp, $sp, 4
	lw $s4, 0($sp)
	addi $sp, $sp, 4
	lw $s3, 0($sp)
	addi $sp, $sp, 4
	lw $s2, 0($sp)
	addi $sp, $sp, 4
	lw $s1, 0($sp)
	addi $sp, $sp, 4
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	jr $ra
main:
	move $t6, $gp
	li $t7, 1
	sw $t7, 0($t6)
__whlbgn1:
	move $t7, $gp
	lw $t7, 0($t7)
	li $s0, 11
	slt $t7, $t7, $s0
	beq $t7, $zero, __whlend1
	move $s0, $gp
	lw $s0, 0($s0)
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	addi $s0, $s0, 4
	move $s1, $gp
	lw $s1, 0($s1)
	sw $s1, 0($s0)
	move $s1, $gp
	move $s2, $gp
	lw $s2, 0($s2)
	li $s3, 1
	add $s2, $s2, $s3
	sw $s2, 0($s1)
	j __whlbgn1
__whlend1:
	move $s3, $gp
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal t
	sw $v0, 0($s3)
	move $s3, $gp
	lw $s3, 0($s3)
	move $a0, $s3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
