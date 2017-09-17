.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	li $t0, 51
	li $t1, 17
	div $t0, $t0, $t1
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t1, $gp
	li $t2, 100
	sw $t2, 0($t1)
	addi $t2, $gp, 8
	li $t3, 2
	sw $t3, 0($t2)
	addi $t3, $gp, 12
	li $t4, 5
	sw $t4, 0($t3)
	addi $t4, $gp, 4
	move $t5, $gp
	lw $t5, 0($t5)
	addi $t6, $gp, 8
	lw $t6, 0($t6)
	div $t5, $t5, $t6
	addi $t6, $gp, 12
	lw $t6, 0($t6)
	div $t5, $t5, $t6
	sw $t5, 0($t4)
	addi $t6, $gp, 4
	lw $t6, 0($t6)
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
