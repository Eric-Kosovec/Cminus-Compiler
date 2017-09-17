.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	move $t0, $gp
	li $t1, 1
	sw $t1, 0($t0)
	addi $t1, $gp, 4
	li $t2, 0
	sw $t2, 0($t1)
__whlbgn0:
	move $t2, $gp
	lw $t2, 0($t2)
	li $t3, 10
	sle $t2, $t2, $t3
	beq $t2, $zero, __whlend0
	move $t3, $gp
	lw $t3, 0($t3)
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t3, $gp, 4
	addi $t4, $gp, 4
	lw $t4, 0($t4)
	move $t5, $gp
	lw $t5, 0($t5)
	add $t4, $t4, $t5
	sw $t4, 0($t3)
	move $t5, $gp
	move $t6, $gp
	lw $t6, 0($t6)
	li $t7, 1
	add $t6, $t6, $t7
	sw $t6, 0($t5)
	j __whlbgn0
__whlend0:
	addi $t7, $gp, 4
	lw $t7, 0($t7)
	move $a0, $t7
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
