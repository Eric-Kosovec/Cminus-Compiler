.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	addi $t0, $gp, 200
	li $t1, 0
	sw $t1, 0($t0)
__whlbgn0:
	addi $t1, $gp, 200
	lw $t1, 0($t1)
	li $t2, 50
	slt $t1, $t1, $t2
	beq $t1, $zero, __whlend0
	addi $t2, $gp, 200
	lw $t2, 0($t2)
	sll $t2, $t2, 2
	add $t2, $t2, $gp
	li $t3, 0
	sw $t3, 0($t2)
	addi $t3, $gp, 200
	addi $t4, $gp, 200
	lw $t4, 0($t4)
	li $t5, 1
	add $t4, $t4, $t5
	sw $t4, 0($t3)
	j __whlbgn0
__whlend0:
	addi $t5, $gp, 204
	li $t6, 0
	sw $t6, 0($t5)
__whlbgn1:
	addi $t6, $gp, 204
	lw $t6, 0($t6)
	li $t7, 50
	slt $t6, $t6, $t7
	beq $t6, $zero, __whlend1
	addi $t7, $gp, 204
	lw $t7, 0($t7)
	sll $t7, $t7, 2
	add $t7, $t7, $gp
	addi $t7, $t7, 212
	addi $s0, $gp, 204
	lw $s0, 0($s0)
	li $s1, 50
	add $s0, $s0, $s1
	sw $s0, 0($t7)
	addi $s1, $gp, 204
	addi $s2, $gp, 204
	lw $s2, 0($s2)
	li $s3, 1
	add $s2, $s2, $s3
	sw $s2, 0($s1)
	j __whlbgn1
__whlend1:
	addi $s3, $gp, 200
	li $s4, 0
	sw $s4, 0($s3)
	addi $s4, $gp, 208
	li $s5, 0
	sw $s5, 0($s4)
__whlbgn2:
	addi $s5, $gp, 200
	lw $s5, 0($s5)
	li $s6, 100
	slt $s5, $s5, $s6
	beq $s5, $zero, __whlend2
	addi $s6, $gp, 200
	lw $s6, 0($s6)
	li $s7, 50
	slt $s6, $s6, $s7
	beq $s6, $zero, __ifend0
	addi $s7, $gp, 208
	addi $t8, $gp, 208
	lw $t8, 0($t8)
	addi $t9, $gp, 200
	lw $t9, 0($t9)
	sll $t9, $t9, 2
	add $t9, $t9, $gp
	lw $t9, 0($t9)
	add $t8, $t8, $t9
	sw $t8, 0($s7)
	j __aftr_else0
__ifend0:
	addi $t9, $gp, 208
	addi $t0, $gp, 208
	lw $t0, 0($t0)
	addi $t1, $gp, 200
	lw $t1, 0($t1)
	li $t2, 50
	sub $t1, $t1, $t2
	sll $t1, $t1, 2
	add $t1, $t1, $gp
	addi $t1, $t1, 212
	lw $t1, 0($t1)
	add $t0, $t0, $t1
	sw $t0, 0($t9)
__aftr_else0:
	addi $t2, $gp, 200
	addi $t3, $gp, 200
	lw $t3, 0($t3)
	li $t4, 1
	add $t3, $t3, $t4
	sw $t3, 0($t2)
	j __whlbgn2
__whlend2:
	addi $t4, $gp, 208
	lw $t4, 0($t4)
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t4, 5
	sll $t4, $t4, 2
	add $t4, $t4, $gp
	lw $t4, 0($t4)
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t4, 10
	sll $t4, $t4, 2
	add $t4, $t4, $gp
	addi $t4, $t4, 212
	lw $t4, 0($t4)
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
