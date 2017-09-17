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
	addi $t4, $gp, 16
	move $t5, $gp
	lw $t5, 0($t5)
	addi $t6, $gp, 4
	lw $t6, 0($t6)
	slt $t5, $t5, $t6
	sw $t5, 0($t4)
	addi $t6, $gp, 16
	lw $t6, 0($t6)
	li $t7, 1
	and $t6, $t6, $t7
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t7, $gp, 12
	lw $t7, 0($t7)
	addi $s0, $gp, 8
	lw $s0, 0($s0)
	sgt $t7, $t7, $s0
	move $a0, $t7
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s0, $gp, 12
	lw $s0, 0($s0)
	addi $s1, $gp, 8
	lw $s1, 0($s1)
	sgt $s0, $s0, $s1
	seq $s0, $s0, $zero
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $s1, 0
	move $s2, $gp
	lw $s2, 0($s2)
	addi $s3, $gp, 4
	lw $s3, 0($s3)
	slt $s2, $s2, $s3
	addi $s3, $gp, 8
	lw $s3, 0($s3)
	addi $s4, $gp, 12
	lw $s4, 0($s4)
	sne $s3, $s3, $s4
	and $s2, $s2, $s3
	or $s1, $s1, $s2
	move $a0, $s1
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
