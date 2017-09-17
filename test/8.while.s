.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	addi $t0, $gp, 4
	li $t1, 1
	sw $t1, 0($t0)
__whlbgn0:
	addi $t1, $gp, 4
	lw $t1, 0($t1)
	li $t2, 10
	sle $t1, $t1, $t2
	beq $t1, $zero, __whlend0
	move $t2, $gp
	li $t3, 1
	sw $t3, 0($t2)
__whlbgn1:
	move $t3, $gp
	lw $t3, 0($t3)
	li $t4, 10
	sle $t3, $t3, $t4
	beq $t3, $zero, __whlend1
	move $t4, $gp
	lw $t4, 0($t4)
	addi $t5, $gp, 4
	lw $t5, 0($t5)
	mul $t4, $t4, $t5
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t5, $gp
	move $t6, $gp
	lw $t6, 0($t6)
	li $t7, 1
	add $t6, $t6, $t7
	sw $t6, 0($t5)
	j __whlbgn1
__whlend1:
	addi $t7, $gp, 4
	addi $s0, $gp, 4
	lw $s0, 0($s0)
	li $s1, 1
	add $s0, $s0, $s1
	sw $s0, 0($t7)
	j __whlbgn0
__whlend0:
	li $v0, 17
	move $a0, $zero
	syscall
