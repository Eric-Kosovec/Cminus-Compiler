.data
.newline: .asciiz "\n"
.text
.globl main
	j main
f1:
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
	addi $t0, $fp, -4
	li $t1, 9
	sw $t1, 0($t0)
__whlbgn0:
	addi $t1, $fp, -4
	lw $t1, 0($t1)
	li $t2, 0
	sge $t1, $t1, $t2
	beq $t1, $zero, __whlend0
	addi $t2, $fp, -4
	lw $t2, 0($t2)
	sll $t2, $t2, 2
	add $t2, $t2, $gp
	addi $t2, $t2, 4
	addi $t3, $fp, -4
	lw $t3, 0($t3)
	sll $t3, $t3, 2
	add $t3, $t3, $gp
	addi $t3, $t3, 4
	lw $t3, 0($t3)
	li $t4, 1
	sub $t3, $t3, $t4
	sw $t3, 0($t2)
	addi $t4, $fp, -4
	addi $t5, $fp, -4
	lw $t5, 0($t5)
	li $t6, 1
	sub $t5, $t5, $t6
	sw $t5, 0($t4)
	j __whlbgn0
__whlend0:
	li $t6, 5
	sll $t6, $t6, 2
	add $t6, $t6, $gp
	addi $t6, $t6, 4
	lw $t6, 0($t6)
	move $v0, $t6
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
f2:
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
	addi $sp, $sp, -40
	addi $t6, $fp, -4
	li $t7, 0
	sw $t7, 0($t6)
__whlbgn1:
	addi $t7, $fp, -4
	lw $t7, 0($t7)
	li $s0, 10
	slt $t7, $t7, $s0
	beq $t7, $zero, __whlend1
	addi $s0, $fp, -4
	lw $s0, 0($s0)
	li $s1, 5
	slt $s0, $s0, $s1
	beq $s0, $zero, __ifend0
	addi $s1, $fp, -4
	lw $s1, 0($s1)
	sll $s1, $s1, 2
	addi $s1, $s1, 8
	sub $s1, $fp, $s1
	li $s2, 0
	sw $s2, 0($s1)
	j __aftr_else0
__ifend0:
	addi $s2, $fp, -4
	lw $s2, 0($s2)
	sll $s2, $s2, 2
	addi $s2, $s2, 8
	sub $s2, $fp, $s2
	li $s3, 1
	sw $s3, 0($s2)
__aftr_else0:
	addi $s3, $fp, -4
	addi $s4, $fp, -4
	lw $s4, 0($s4)
	li $s5, 1
	add $s4, $s4, $s5
	sw $s4, 0($s3)
	j __whlbgn1
__whlend1:
	li $s5, 9
	sll $s5, $s5, 2
	addi $s5, $s5, 8
	sub $s5, $fp, $s5
	lw $s5, 0($s5)
	move $v0, $s5
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
main:
	move $s5, $gp
	li $s6, 0
	sw $s6, 0($s5)
__whlbgn2:
	move $s6, $gp
	lw $s6, 0($s6)
	li $s7, 10
	slt $s6, $s6, $s7
	beq $s6, $zero, __whlend2
	move $s7, $gp
	lw $s7, 0($s7)
	sll $s7, $s7, 2
	add $s7, $s7, $gp
	addi $s7, $s7, 4
	move $t8, $gp
	lw $t8, 0($t8)
	move $t9, $gp
	lw $t9, 0($t9)
	mul $t8, $t8, $t9
	sw $t8, 0($s7)
	move $t9, $gp
	move $t0, $gp
	lw $t0, 0($t0)
	li $t1, 1
	add $t0, $t0, $t1
	sw $t0, 0($t9)
	j __whlbgn2
__whlend2:
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal f1
	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t1, $gp
	lw $t1, 0($t1)
	move $a0, $t1
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal f2
	move $a0, $v0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t1, $gp
	lw $t1, 0($t1)
	move $a0, $t1
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t1, 9
	sll $t1, $t1, 2
	add $t1, $t1, $gp
	addi $t1, $t1, 4
	lw $t1, 0($t1)
	move $a0, $t1
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
