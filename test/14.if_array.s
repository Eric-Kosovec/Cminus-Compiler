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
	addi $t0, $gp, 400
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	addi $t0, $gp, 400
	lw $t0, 0($t0)
	li $t1, 0
	slt $t0, $t0, $t1
	addi $t1, $gp, 400
	lw $t1, 0($t1)
	li $t2, 100
	sge $t1, $t1, $t2
	or $t0, $t0, $t1
	beq $t0, $zero, __ifend0
	la $a0, __str1
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j __aftr_else0
__ifend0:
	addi $t2, $gp, 400
	lw $t2, 0($t2)
	sll $t2, $t2, 2
	add $t2, $t2, $gp
	addi $t3, $gp, 400
	lw $t3, 0($t3)
	li $t4, 2
	mul $t3, $t3, $t4
	sw $t3, 0($t2)
	li $t4, 5
	sll $t4, $t4, 2
	add $t4, $t4, $gp
	li $t5, 5
	sw $t5, 0($t4)
	addi $t5, $gp, 400
	lw $t5, 0($t5)
	sll $t5, $t5, 2
	add $t5, $t5, $gp
	lw $t5, 0($t5)
	move $a0, $t5
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
__aftr_else0:
	li $v0, 17
	move $a0, $zero
	syscall
.data
__str0: .asciiz "enter i ="
__str1: .asciiz "out of bound!"
