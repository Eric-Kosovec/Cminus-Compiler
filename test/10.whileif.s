.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	la $a0, __str0
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t0, $gp, 8
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	addi $t0, $gp, 8
	lw $t0, 0($t0)
	li $t1, 2
	div $t0, $t0, $t1
	li $t1, 2
	mul $t0, $t0, $t1
	addi $t1, $gp, 8
	lw $t1, 0($t1)
	seq $t0, $t0, $t1
	beq $t0, $zero, __ifend0
	addi $t1, $gp, 4
	li $t2, 1
	sw $t2, 0($t1)
	move $t2, $gp
	li $t3, 0
	sw $t3, 0($t2)
__whlbgn0:
	addi $t3, $gp, 4
	lw $t3, 0($t3)
	addi $t4, $gp, 8
	lw $t4, 0($t4)
	sle $t3, $t3, $t4
	beq $t3, $zero, __whlend0
	move $t4, $gp
	move $t5, $gp
	lw $t5, 0($t5)
	addi $t6, $gp, 4
	lw $t6, 0($t6)
	add $t5, $t5, $t6
	sw $t5, 0($t4)
	addi $t6, $gp, 4
	addi $t7, $gp, 4
	lw $t7, 0($t7)
	li $s0, 1
	add $t7, $t7, $s0
	sw $t7, 0($t6)
	j __whlbgn0
__whlend0:
	j __aftr_else0
__ifend0:
	addi $s0, $gp, 4
	li $s1, 1
	sw $s1, 0($s0)
	move $s1, $gp
	li $s2, 1
	sw $s2, 0($s1)
__whlbgn1:
	addi $s2, $gp, 4
	lw $s2, 0($s2)
	addi $s3, $gp, 8
	lw $s3, 0($s3)
	sle $s2, $s2, $s3
	beq $s2, $zero, __whlend1
	move $s3, $gp
	move $s4, $gp
	lw $s4, 0($s4)
	addi $s5, $gp, 4
	lw $s5, 0($s5)
	mul $s4, $s4, $s5
	sw $s4, 0($s3)
	addi $s5, $gp, 4
	addi $s6, $gp, 4
	lw $s6, 0($s6)
	li $s7, 1
	add $s6, $s6, $s7
	sw $s6, 0($s5)
	j __whlbgn1
__whlend1:
__aftr_else0:
	move $s7, $gp
	lw $s7, 0($s7)
	move $a0, $s7
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
.data
__str0: .asciiz "Enter a:"
