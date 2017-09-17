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
	move $t0, $gp
	lw $t0, 0($t0)
	beq $t0, $zero, __ifend0
	addi $t0, $gp, 4
	li $t1, 1
	move $t2, $gp
	lw $t2, 0($t2)
	sub $t1, $t1, $t2
	sw $t1, 0($t0)
	addi $t2, $gp, 4
	lw $t2, 0($t2)
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j __aftr_else0
__ifend0:
	addi $t2, $gp, 4
	move $t3, $gp
	lw $t3, 0($t3)
	sw $t3, 0($t2)
	addi $t3, $gp, 4
	lw $t3, 0($t3)
	move $a0, $t3
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
__str0: .asciiz "Enter a:"
