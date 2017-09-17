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
	move $t2, $gp
	lw $t2, 0($t2)
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t2, $gp, 4
	lw $t2, 0($t2)
	seq $t2, $t2, $zero
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t2, $gp, 4
	lw $t2, 0($t2)
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t2, $gp
	lw $t2, 0($t2)
	seq $t2, $t2, $zero
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
