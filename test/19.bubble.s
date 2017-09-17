.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	li $t0, 0
	sll $t0, $t0, 2
	add $t0, $t0, $gp
	li $t1, 32
	sw $t1, 0($t0)
	li $t1, 1
	sll $t1, $t1, 2
	add $t1, $t1, $gp
	li $t2, 11
	sw $t2, 0($t1)
	li $t2, 2
	sll $t2, $t2, 2
	add $t2, $t2, $gp
	li $t3, 111
	sw $t3, 0($t2)
	li $t3, 3
	sll $t3, $t3, 2
	add $t3, $t3, $gp
	li $t4, 88
	sw $t4, 0($t3)
	li $t4, 4
	sll $t4, $t4, 2
	add $t4, $t4, $gp
	li $t5, 11
	sw $t5, 0($t4)
	li $t5, 5
	sll $t5, $t5, 2
	add $t5, $t5, $gp
	li $t6, 44
	sw $t6, 0($t5)
	li $t6, 6
	sll $t6, $t6, 2
	add $t6, $t6, $gp
	li $t7, 33
	sw $t7, 0($t6)
	li $t7, 7
	sll $t7, $t7, 2
	add $t7, $t7, $gp
	li $s0, 33
	sw $s0, 0($t7)
	li $s0, 8
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	li $s1, 22
	sw $s1, 0($s0)
	li $s1, 9
	sll $s1, $s1, 2
	add $s1, $s1, $gp
	li $s2, 77
	sw $s2, 0($s1)
	li $s2, 10
	sll $s2, $s2, 2
	add $s2, $s2, $gp
	li $s3, 45
	sw $s3, 0($s2)
	li $s3, 11
	sll $s3, $s3, 2
	add $s3, $s3, $gp
	li $s4, 65
	sw $s4, 0($s3)
	li $s4, 12
	sll $s4, $s4, 2
	add $s4, $s4, $gp
	li $s5, 76
	sw $s5, 0($s4)
	li $s5, 13
	sll $s5, $s5, 2
	add $s5, $s5, $gp
	li $s6, 87
	sw $s6, 0($s5)
	li $s6, 14
	sll $s6, $s6, 2
	add $s6, $s6, $gp
	li $s7, 34
	sw $s7, 0($s6)
	addi $s7, $gp, 60
	li $t8, 0
	sw $t8, 0($s7)
__whlbgn0:
	addi $t8, $gp, 60
	lw $t8, 0($t8)
	li $t9, 14
	slt $t8, $t8, $t9
	beq $t8, $zero, __whlend0
	addi $t9, $gp, 72
	addi $t0, $gp, 60
	lw $t0, 0($t0)
	sw $t0, 0($t9)
	addi $t0, $gp, 64
	addi $t1, $gp, 60
	lw $t1, 0($t1)
	li $t2, 1
	add $t1, $t1, $t2
	sw $t1, 0($t0)
__whlbgn1:
	addi $t2, $gp, 64
	lw $t2, 0($t2)
	li $t3, 15
	slt $t2, $t2, $t3
	beq $t2, $zero, __whlend1
	addi $t3, $gp, 64
	lw $t3, 0($t3)
	sll $t3, $t3, 2
	add $t3, $t3, $gp
	lw $t3, 0($t3)
	addi $t4, $gp, 72
	lw $t4, 0($t4)
	sll $t4, $t4, 2
	add $t4, $t4, $gp
	lw $t4, 0($t4)
	slt $t3, $t3, $t4
	beq $t3, $zero, __ifend0
	addi $t4, $gp, 72
	addi $t5, $gp, 64
	lw $t5, 0($t5)
	sw $t5, 0($t4)
__ifend0:
	addi $t5, $gp, 64
	addi $t6, $gp, 64
	lw $t6, 0($t6)
	li $t7, 1
	add $t6, $t6, $t7
	sw $t6, 0($t5)
	j __whlbgn1
__whlend1:
	addi $t7, $gp, 68
	addi $s0, $gp, 60
	lw $s0, 0($s0)
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	lw $s0, 0($s0)
	sw $s0, 0($t7)
	addi $s0, $gp, 60
	lw $s0, 0($s0)
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	addi $s1, $gp, 72
	lw $s1, 0($s1)
	sll $s1, $s1, 2
	add $s1, $s1, $gp
	lw $s1, 0($s1)
	sw $s1, 0($s0)
	addi $s1, $gp, 72
	lw $s1, 0($s1)
	sll $s1, $s1, 2
	add $s1, $s1, $gp
	addi $s2, $gp, 68
	lw $s2, 0($s2)
	sw $s2, 0($s1)
	addi $s2, $gp, 60
	addi $s3, $gp, 60
	lw $s3, 0($s3)
	li $s4, 1
	add $s3, $s3, $s4
	sw $s3, 0($s2)
	j __whlbgn0
__whlend0:
	addi $s4, $gp, 60
	li $s5, 0
	sw $s5, 0($s4)
__whlbgn2:
	addi $s5, $gp, 60
	lw $s5, 0($s5)
	li $s6, 15
	slt $s5, $s5, $s6
	beq $s5, $zero, __whlend2
	addi $s6, $gp, 60
	lw $s6, 0($s6)
	sll $s6, $s6, 2
	add $s6, $s6, $gp
	lw $s6, 0($s6)
	move $a0, $s6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s6, $gp, 60
	addi $s7, $gp, 60
	lw $s7, 0($s7)
	li $t8, 1
	add $s7, $s7, $t8
	sw $s7, 0($s6)
	j __whlbgn2
__whlend2:
	li $v0, 17
	move $a0, $zero
	syscall
