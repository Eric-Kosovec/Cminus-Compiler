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
	li $t6, 7
	add $t5, $t5, $t6
	sw $t5, 0($t4)
	addi $t6, $gp, 16
	lw $t6, 0($t6)
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t6, $gp, 20
	addi $t7, $gp, 12
	lw $t7, 0($t7)
	li $s0, 5
	sub $t7, $t7, $s0
	sw $t7, 0($t6)
	addi $s0, $gp, 20
	lw $s0, 0($s0)
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s0, $gp, 4
	lw $s0, 0($s0)
	addi $s1, $gp, 8
	lw $s1, 0($s1)
	mul $s0, $s0, $s1
	addi $s1, $gp, 12
	lw $s1, 0($s1)
	mul $s0, $s0, $s1
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s1, $gp, 4
	lw $s1, 0($s1)
	addi $s2, $gp, 8
	lw $s2, 0($s2)
	mul $s1, $s1, $s2
	addi $s2, $gp, 12
	lw $s2, 0($s2)
	sub $s1, $s1, $s2
	move $a0, $s1
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $s2, $gp
	lw $s2, 0($s2)
	addi $s3, $gp, 4
	lw $s3, 0($s3)
	add $s2, $s2, $s3
	addi $s3, $gp, 8
	lw $s3, 0($s3)
	addi $s4, $gp, 12
	lw $s4, 0($s4)
	mul $s3, $s3, $s4
	add $s2, $s2, $s3
	move $a0, $s2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s4, $gp, 8
	lw $s4, 0($s4)
	addi $s5, $gp, 12
	lw $s5, 0($s5)
	mul $s4, $s4, $s5
	addi $s5, $gp, 4
	lw $s5, 0($s5)
	div $s4, $s4, $s5
	move $s5, $gp
	lw $s5, 0($s5)
	sub $s4, $s4, $s5
	move $a0, $s4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $s5, $gp
	lw $s5, 0($s5)
	addi $s6, $gp, 4
	lw $s6, 0($s6)
	add $s5, $s5, $s6
	addi $s6, $gp, 8
	lw $s6, 0($s6)
	move $s7, $gp
	lw $s7, 0($s7)
	addi $t8, $gp, 16
	lw $t8, 0($t8)
	mul $s7, $s7, $t8
	add $s6, $s6, $s7
	mul $s5, $s5, $s6
	addi $t8, $gp, 20
	lw $t8, 0($t8)
	div $s5, $s5, $t8
	move $a0, $s5
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
