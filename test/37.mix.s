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
	la $a0, __str1
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t0, $gp, 4
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	la $a0, __str2
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t0, $gp, 8
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	la $a0, __str3
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t0, $gp, 12
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	la $a0, __str4
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t0, $gp, 16
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	addi $t0, $gp, 20
	addi $t1, $gp, 8
	lw $t1, 0($t1)
	addi $t2, $gp, 4
	lw $t2, 0($t2)
	addi $t3, $gp, 12
	lw $t3, 0($t3)
	add $t2, $t2, $t3
	slt $t1, $t1, $t2
	move $t3, $gp
	lw $t3, 0($t3)
	addi $t4, $gp, 8
	lw $t4, 0($t4)
	sne $t3, $t3, $t4
	seq $t3, $t3, $zero
	and $t1, $t1, $t3
	sw $t1, 0($t0)
	addi $t4, $gp, 20
	lw $t4, 0($t4)
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t4, $gp
	lw $t4, 0($t4)
	addi $t5, $gp, 12
	lw $t5, 0($t5)
	mul $t4, $t4, $t5
	addi $t5, $gp, 4
	lw $t5, 0($t5)
	addi $t6, $gp, 8
	lw $t6, 0($t6)
	mul $t5, $t5, $t6
	sgt $t4, $t4, $t5
	li $t6, 1
	addi $t7, $gp, 16
	lw $t7, 0($t7)
	sle $t6, $t6, $t7
	or $t4, $t4, $t6
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t7, $gp, 8
	lw $t7, 0($t7)
	addi $s0, $gp, 12
	lw $s0, 0($s0)
	mul $t7, $t7, $s0
	addi $s0, $gp, 4
	lw $s0, 0($s0)
	addi $s1, $gp, 8
	lw $s1, 0($s1)
	add $s0, $s0, $s1
	addi $s1, $gp, 12
	lw $s1, 0($s1)
	add $s0, $s0, $s1
	sgt $t7, $t7, $s0
	move $s1, $gp
	lw $s1, 0($s1)
	addi $s2, $gp, 4
	lw $s2, 0($s2)
	sne $s1, $s1, $s2
	and $t7, $t7, $s1
	addi $s2, $gp, 12
	lw $s2, 0($s2)
	addi $s3, $gp, 20
	lw $s3, 0($s3)
	sgt $s2, $s2, $s3
	or $t7, $t7, $s2
	move $a0, $t7
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s3, $gp, 12
	lw $s3, 0($s3)
	addi $s4, $gp, 4
	lw $s4, 0($s4)
	div $s3, $s3, $s4
	move $s4, $gp
	lw $s4, 0($s4)
	sub $s3, $s3, $s4
	addi $s4, $gp, 16
	lw $s4, 0($s4)
	sgt $s3, $s3, $s4
	addi $s4, $gp, 8
	lw $s4, 0($s4)
	addi $s5, $gp, 12
	lw $s5, 0($s5)
	addi $s6, $gp, 20
	lw $s6, 0($s6)
	mul $s5, $s5, $s6
	add $s4, $s4, $s5
	addi $s6, $gp, 12
	lw $s6, 0($s6)
	addi $s7, $gp, 8
	lw $s7, 0($s7)
	addi $t8, $gp, 20
	lw $t8, 0($t8)
	mul $s7, $s7, $t8
	add $s6, $s6, $s7
	sne $s4, $s4, $s6
	and $s3, $s3, $s4
	move $a0, $s3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
.data
__str0: .asciiz "i = "
__str1: .asciiz "j = "
__str2: .asciiz "k = "
__str3: .asciiz "l = "
__str4: .asciiz "m = "
