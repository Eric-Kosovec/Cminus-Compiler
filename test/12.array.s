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
	addi $t1, $gp, 40
	li $t2, 3
	sw $t2, 0($t1)
	addi $t2, $gp, 40
	lw $t2, 0($t2)
	sll $t2, $t2, 2
	add $t2, $t2, $gp
	li $t3, 7
	sw $t3, 0($t2)
	addi $t3, $gp, 40
	lw $t3, 0($t3)
	sll $t3, $t3, 2
	add $t3, $t3, $gp
	lw $t3, 0($t3)
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t3, $gp, 40
	addi $t4, $gp, 40
	lw $t4, 0($t4)
	li $t5, 2
	add $t4, $t4, $t5
	sw $t4, 0($t3)
	addi $t5, $gp, 40
	lw $t5, 0($t5)
	sll $t5, $t5, 2
	add $t5, $t5, $gp
	li $t6, 22
	sw $t6, 0($t5)
	li $t6, 5
	sll $t6, $t6, 2
	add $t6, $t6, $gp
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
