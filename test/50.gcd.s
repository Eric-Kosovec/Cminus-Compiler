.data
.newline: .asciiz "\n"
.text
.globl main
	j main
gcd:
	addi $sp, $sp, 8
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, 36
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	addi $sp, $sp, -4
	sw $s3, 0($sp)
	addi $sp, $sp, -4
	sw $s4, 0($sp)
	addi $sp, $sp, -4
	sw $s5, 0($sp)
	addi $sp, $sp, -4
	sw $s6, 0($sp)
	addi $sp, $sp, -4
	sw $s7, 0($sp)
	move $sp, $fp
	addi $sp, $sp, -4
	addi $t0, $gp, 4
	lw $t0, 0($t0)
	li $t1, 0
	seq $t0, $t0, $t1
	beq $t0, $zero, __ifend0
	move $t1, $gp
	lw $t1, 0($t1)
	move $v0, $t1
	move $sp, $fp
	lw $fp, 0($sp)
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $s7, 0($sp)
	addi $sp, $sp, 4
	lw $s6, 0($sp)
	addi $sp, $sp, 4
	lw $s5, 0($sp)
	addi $sp, $sp, 4
	lw $s4, 0($sp)
	addi $sp, $sp, 4
	lw $s3, 0($sp)
	addi $sp, $sp, 4
	lw $s2, 0($sp)
	addi $sp, $sp, 4
	lw $s1, 0($sp)
	addi $sp, $sp, 4
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	j __aftr_else0
__ifend0:
	addi $t1, $fp, -4
	move $t2, $gp
	lw $t2, 0($t2)
	sw $t2, 0($t1)
	move $t2, $gp
	addi $t3, $gp, 4
	lw $t3, 0($t3)
	sw $t3, 0($t2)
	addi $t3, $gp, 4
	addi $t4, $fp, -4
	lw $t4, 0($t4)
	addi $t5, $gp, 4
	lw $t5, 0($t5)
	addi $t6, $fp, -4
	lw $t6, 0($t6)
	addi $t7, $gp, 4
	lw $t7, 0($t7)
	div $t6, $t6, $t7
	mul $t5, $t5, $t6
	sub $t4, $t4, $t5
	sw $t4, 0($t3)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal gcd
	move $v0, $v0
	move $sp, $fp
	lw $fp, 0($sp)
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $s7, 0($sp)
	addi $sp, $sp, 4
	lw $s6, 0($sp)
	addi $sp, $sp, 4
	lw $s5, 0($sp)
	addi $sp, $sp, 4
	lw $s4, 0($sp)
	addi $sp, $sp, 4
	lw $s3, 0($sp)
	addi $sp, $sp, 4
	lw $s2, 0($sp)
	addi $sp, $sp, 4
	lw $s1, 0($sp)
	addi $sp, $sp, 4
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	jr $ra
__aftr_else0:
main:
	la $a0, __str0
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t7, $gp
	li $v0, 5
	syscall
	sw $v0, 0($t7)
	la $a0, __str1
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t7, $gp, 4
	li $v0, 5
	syscall
	sw $v0, 0($t7)
__whlbgn0:
	move $t7, $gp
	lw $t7, 0($t7)
	li $s0, 0
	sne $t7, $t7, $s0
	addi $s0, $gp, 4
	lw $s0, 0($s0)
	li $s1, 0
	sne $s0, $s0, $s1
	or $t7, $t7, $s0
	beq $t7, $zero, __whlend0
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal gcd
	move $a0, $v0
	li $v0, 1
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
	move $s1, $gp
	li $v0, 5
	syscall
	sw $v0, 0($s1)
	la $a0, __str3
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s1, $gp, 4
	li $v0, 5
	syscall
	sw $v0, 0($s1)
	j __whlbgn0
__whlend0:
	li $v0, 17
	move $a0, $zero
	syscall
.data
__str0: .asciiz "enter x:"
__str1: .asciiz "enter y:"
__str2: .asciiz "enter x:"
__str3: .asciiz "enter y:"
