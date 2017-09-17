.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	move $t0, $gp
	li $t1, 0
	sw $t1, 0($t0)
__whlbgn0:
	move $t1, $gp
	lw $t1, 0($t1)
	li $t2, 10
	slt $t1, $t1, $t2
	beq $t1, $zero, __whlend0
	move $t2, $gp
	lw $t2, 0($t2)
	sll $t2, $t2, 2
	add $t2, $t2, $gp
	addi $t2, $t2, 4
	move $t3, $gp
	lw $t3, 0($t3)
	sw $t3, 0($t2)
	move $t3, $gp
	move $t4, $gp
	lw $t4, 0($t4)
	li $t5, 1
	add $t4, $t4, $t5
	sw $t4, 0($t3)
	j __whlbgn0
__whlend0:
	move $t5, $gp
	li $t6, 0
	sw $t6, 0($t5)
__whlbgn1:
	move $t6, $gp
	lw $t6, 0($t6)
	li $t7, 10
	slt $t6, $t6, $t7
	beq $t6, $zero, __whlend1
	move $t7, $gp
	lw $t7, 0($t7)
	li $s0, 5
	slt $t7, $t7, $s0
	beq $t7, $zero, __ifend0
	move $s0, $gp
	lw $s0, 0($s0)
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	addi $s0, $s0, 4
	lw $s0, 0($s0)
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	j __aftr_else0
__ifend0:
	li $s0, 0
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
__aftr_else0:
	move $s0, $gp
	move $s1, $gp
	lw $s1, 0($s1)
	li $s2, 1
	add $s1, $s1, $s2
	sw $s1, 0($s0)
	j __whlbgn1
__whlend1:
	li $v0, 17
	move $a0, $zero
	syscall
