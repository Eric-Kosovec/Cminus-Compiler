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
	seq $t4, $t4, $t5
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t5, $gp
	lw $t5, 0($t5)
	move $t6, $gp
	lw $t6, 0($t6)
	sne $t5, $t5, $t6
	move $a0, $t5
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t6, $gp, 8
	lw $t6, 0($t6)
	addi $t7, $gp, 8
	lw $t7, 0($t7)
	seq $t6, $t6, $t7
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t7, $gp, 8
	lw $t7, 0($t7)
	addi $s0, $gp, 12
	lw $s0, 0($s0)
	sne $t7, $t7, $s0
	move $a0, $t7
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
