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
	li $t2, 2
	sw $t2, 0($t1)
	addi $t2, $gp, 8
	li $t3, 3
	sw $t3, 0($t2)
	addi $t3, $gp, 12
	li $t4, 4
	sw $t4, 0($t3)
	move $t4, $gp
	lw $t4, 0($t4)
	addi $t5, $gp, 4
	lw $t5, 0($t5)
	add $t4, $t4, $t5
	addi $t5, $gp, 8
	lw $t5, 0($t5)
	addi $t6, $gp, 12
	lw $t6, 0($t6)
	mul $t5, $t5, $t6
	add $t4, $t4, $t5
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t6, $gp
	lw $t6, 0($t6)
	addi $t7, $gp, 12
	lw $t7, 0($t7)
	move $s0, $gp
	lw $s0, 0($s0)
	sub $t7, $t7, $s0
	addi $s0, $gp, 8
	lw $s0, 0($s0)
	div $t7, $t7, $s0
	add $t6, $t6, $t7
	addi $s0, $gp, 4
	lw $s0, 0($s0)
	add $t6, $t6, $s0
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
