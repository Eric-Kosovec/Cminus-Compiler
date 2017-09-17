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
	li $t2, 50
	slt $t1, $t1, $t2
	beq $t1, $zero, __whlend0
	addi $t2, $gp, 4
	li $t3, 0
	sw $t3, 0($t2)
__whlbgn1:
	addi $t3, $gp, 4
	lw $t3, 0($t3)
	li $t4, 10
	slt $t3, $t3, $t4
	beq $t3, $zero, __whlend1
	move $t4, $gp
	lw $t4, 0($t4)
	addi $t5, $gp, 4
	lw $t5, 0($t5)
	add $t4, $t4, $t5
	move $a0, $t4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t5, $gp, 4
	addi $t6, $gp, 4
	lw $t6, 0($t6)
	li $t7, 2
	add $t6, $t6, $t7
	sw $t6, 0($t5)
	j __whlbgn1
__whlend1:
	addi $t7, $gp, 8
	li $s0, 0
	addi $s1, $gp, 4
	lw $s1, 0($s1)
	sub $s0, $s0, $s1
	sw $s0, 0($t7)
__whlbgn2:
	addi $s1, $gp, 8
	lw $s1, 0($s1)
	addi $s2, $gp, 4
	lw $s2, 0($s2)
	sne $s1, $s1, $s2
	beq $s1, $zero, __whlend2
	addi $s2, $gp, 8
	lw $s2, 0($s2)
	move $a0, $s2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s2, $gp, 8
	addi $s3, $gp, 8
	lw $s3, 0($s3)
	li $s4, 1
	add $s3, $s3, $s4
	sw $s3, 0($s2)
	j __whlbgn2
__whlend2:
	move $s4, $gp
	move $s5, $gp
	lw $s5, 0($s5)
	li $s6, 10
	add $s5, $s5, $s6
	sw $s5, 0($s4)
	j __whlbgn0
__whlend0:
	li $v0, 17
	move $a0, $zero
	syscall
