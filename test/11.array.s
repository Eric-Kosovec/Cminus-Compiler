.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	li $t0, 3
	sll $t0, $t0, 2
	add $t0, $t0, $gp
	li $t1, 4
	sw $t1, 0($t0)
	li $t1, 3
	sll $t1, $t1, 2
	add $t1, $t1, $gp
	lw $t1, 0($t1)
	move $a0, $t1
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
