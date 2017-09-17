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
	la $a0, __str1
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	la $a0, __str2
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	la $a0, __str3
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
.data
__str0: .asciiz "Your grader"
__str1: .asciiz "will put"
__str2: .asciiz "a random"
__str3: .asciiz "string here"
