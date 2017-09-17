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
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t0, 1
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t0, 1
	li $t1, 2
	add $t0, $t0, $t1
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
.data
__str0: .asciiz "input an integer:"
