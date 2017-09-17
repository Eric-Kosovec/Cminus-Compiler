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
	addi $t0, $gp, 4
	lw $t0, 0($t0)
	move $t1, $gp
	lw $t1, 0($t1)
	sgt $t0, $t0, $t1
	beq $t0, $zero, __ifend0
	move $t1, $gp
	lw $t1, 0($t1)
	li $t2, 0
	sgt $t1, $t1, $t2
	beq $t1, $zero, __ifend1
	la $a0, __str2
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t2, $gp
	lw $t2, 0($t2)
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j __aftr_else1
__ifend1:
	la $a0, __str3
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t2, $gp, 4
	lw $t2, 0($t2)
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
__aftr_else1:
	j __aftr_else0
__ifend0:
	move $t2, $gp
	lw $t2, 0($t2)
	li $t3, 0
	slt $t2, $t2, $t3
	beq $t2, $zero, __ifend2
	la $a0, __str4
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t3, $gp
	lw $t3, 0($t3)
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j __aftr_else2
__ifend2:
	la $a0, __str5
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t3, $gp, 4
	lw $t3, 0($t3)
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
__aftr_else2:
__aftr_else0:
	li $v0, 17
	move $a0, $zero
	syscall
.data
__str0: .asciiz "enter a:"
__str1: .asciiz "enter b:"
__str2: .asciiz "a = "
__str3: .asciiz "b = "
__str4: .asciiz "a = "
__str5: .asciiz "b = "
