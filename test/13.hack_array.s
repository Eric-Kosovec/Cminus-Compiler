.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	move $t0, $gp
	li $t1, 3
	sw $t1, 0($t0)
	addi $t1, $gp, 4
	li $t2, 4
	sw $t2, 0($t1)
	addi $t2, $gp, 8
	li $t3, 5
	sw $t3, 0($t2)
	addi $t3, $gp, 52
	li $t4, 13
	sw $t4, 0($t3)
	addi $t4, $gp, 56
	li $t5, 14
	sw $t5, 0($t4)
	addi $t5, $gp, 60
	li $t6, 15
	sw $t6, 0($t5)
	addi $t6, $gp, 4
	li $t7, 0
	move $s0, $gp
	lw $s0, 0($s0)
	sub $t7, $t7, $s0
	sw $t7, 0($t6)
	addi $s0, $gp, 4
	lw $s0, 0($s0)
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	addi $s0, $s0, 12
	lw $s0, 0($s0)
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $s0, 11
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	addi $s0, $s0, 12
	lw $s0, 0($s0)
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s0, $gp, 60
	lw $s0, 0($s0)
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $s0, 12
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	addi $s0, $s0, 12
	li $s1, 100
	sw $s1, 0($s0)
	addi $s1, $gp, 60
	lw $s1, 0($s1)
	move $a0, $s1
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
