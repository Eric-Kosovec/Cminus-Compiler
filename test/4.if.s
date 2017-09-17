.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	move $t0, $gp
	li $t1, 0
	sw $t1, 0($t0)
	addi $t1, $gp, 4
	move $t2, $gp
	lw $t2, 0($t2)
	li $t3, 2
	sub $t2, $t2, $t3
	sw $t2, 0($t1)
	move $t3, $gp
	lw $t3, 0($t3)
	beq $t3, $zero, __ifend0
	li $t3, 1
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j __aftr_else0
__ifend0:
	li $t3, 0
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
__aftr_else0:
	addi $t3, $gp, 4
	lw $t3, 0($t3)
	beq $t3, $zero, __ifend1
	move $t3, $gp
	lw $t3, 0($t3)
	beq $t3, $zero, __ifend2
	li $t3, 0
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j __aftr_else2
__ifend2:
	li $t3, 1
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
__aftr_else2:
	j __aftr_else1
__ifend1:
	li $t3, 0
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
__aftr_else1:
	li $v0, 17
	move $a0, $zero
	syscall
