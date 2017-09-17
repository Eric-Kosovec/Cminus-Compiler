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
	move $t0, $gp
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	addi $t0, $gp, 8
	li $t1, 0
	sw $t1, 0($t0)
	addi $t1, $gp, 4
	li $t2, 0
	sw $t2, 0($t1)
__whlbgn0:
	addi $t2, $gp, 4
	lw $t2, 0($t2)
	move $t3, $gp
	lw $t3, 0($t3)
	sle $t2, $t2, $t3
	addi $t3, $gp, 4
	lw $t3, 0($t3)
	li $t4, 100
	sle $t3, $t3, $t4
	and $t2, $t2, $t3
	beq $t2, $zero, __whlend0
	addi $t4, $gp, 8
	addi $t5, $gp, 8
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
	addi $s0, $gp, 8
	lw $s0, 0($s0)
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
.data
__str0: .asciiz "enter a:"
