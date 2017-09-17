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
	addi $t5, $gp, 8
	lw $t5, 0($t5)
	addi $t6, $gp, 4
	lw $t6, 0($t6)
	addi $t7, $gp, 12
	lw $t7, 0($t7)
	add $t6, $t6, $t7
	slt $t5, $t5, $t6
	sw $t5, 0($t4)
	addi $t7, $gp, 16
	lw $t7, 0($t7)
	move $a0, $t7
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t7, $gp
	lw $t7, 0($t7)
	addi $s0, $gp, 12
	lw $s0, 0($s0)
	mul $t7, $t7, $s0
	addi $s0, $gp, 4
	lw $s0, 0($s0)
	addi $s1, $gp, 8
	lw $s1, 0($s1)
	mul $s0, $s0, $s1
	sgt $t7, $t7, $s0
	move $a0, $t7
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s1, $gp, 8
	lw $s1, 0($s1)
	addi $s2, $gp, 12
	lw $s2, 0($s2)
	mul $s1, $s1, $s2
	addi $s2, $gp, 4
	lw $s2, 0($s2)
	addi $s3, $gp, 8
	lw $s3, 0($s3)
	add $s2, $s2, $s3
	addi $s3, $gp, 12
	lw $s3, 0($s3)
	add $s2, $s2, $s3
	sgt $s1, $s1, $s2
	move $a0, $s1
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s3, $gp, 8
	lw $s3, 0($s3)
	addi $s4, $gp, 12
	lw $s4, 0($s4)
	addi $s5, $gp, 4
	lw $s5, 0($s5)
	sgt $s4, $s4, $s5
	mul $s3, $s3, $s4
	addi $s5, $gp, 8
	lw $s5, 0($s5)
	add $s3, $s3, $s5
	addi $s5, $gp, 12
	lw $s5, 0($s5)
	add $s3, $s3, $s5
	move $a0, $s3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
