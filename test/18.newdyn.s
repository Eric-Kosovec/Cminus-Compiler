.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	addi $t0, $gp, 3844
	li $t1, 30
	sw $t1, 0($t0)
	addi $t1, $gp, 3840
	li $t2, 30
	sw $t2, 0($t1)
	addi $t2, $gp, 3848
	li $t3, 0
	sw $t3, 0($t2)
__whlbgn0:
	addi $t3, $gp, 3848
	lw $t3, 0($t3)
	addi $t4, $gp, 3844
	lw $t4, 0($t4)
	slt $t3, $t3, $t4
	beq $t3, $zero, __whlend0
	addi $t4, $gp, 3848
	lw $t4, 0($t4)
	addi $t5, $gp, 3844
	lw $t5, 0($t5)
	mul $t4, $t4, $t5
	sll $t4, $t4, 2
	add $t4, $t4, $gp
	addi $t4, $t4, 240
	addi $t5, $gp, 3848
	lw $t5, 0($t5)
	sw $t5, 0($t4)
	addi $t5, $gp, 3848
	lw $t5, 0($t5)
	sll $t5, $t5, 2
	add $t5, $t5, $gp
	addi $t6, $gp, 3848
	lw $t6, 0($t6)
	li $t7, 1
	add $t6, $t6, $t7
	sw $t6, 0($t5)
	addi $t7, $gp, 3848
	addi $s0, $gp, 3848
	lw $s0, 0($s0)
	li $s1, 1
	add $s0, $s0, $s1
	sw $s0, 0($t7)
	j __whlbgn0
__whlend0:
	addi $s1, $gp, 3852
	li $s2, 0
	sw $s2, 0($s1)
__whlbgn1:
	addi $s2, $gp, 3852
	lw $s2, 0($s2)
	addi $s3, $gp, 3840
	lw $s3, 0($s3)
	slt $s2, $s2, $s3
	beq $s2, $zero, __whlend1
	addi $s3, $gp, 3852
	lw $s3, 0($s3)
	sll $s3, $s3, 2
	add $s3, $s3, $gp
	addi $s3, $s3, 240
	addi $s4, $gp, 3852
	lw $s4, 0($s4)
	sw $s4, 0($s3)
	addi $s4, $gp, 3852
	lw $s4, 0($s4)
	sll $s4, $s4, 2
	add $s4, $s4, $gp
	addi $s4, $s4, 120
	li $s5, 2
	addi $s6, $gp, 3852
	lw $s6, 0($s6)
	li $s7, 1
	add $s6, $s6, $s7
	mul $s5, $s5, $s6
	sw $s5, 0($s4)
	addi $s7, $gp, 3852
	addi $t8, $gp, 3852
	lw $t8, 0($t8)
	li $t9, 1
	add $t8, $t8, $t9
	sw $t8, 0($s7)
	j __whlbgn1
__whlend1:
	addi $t9, $gp, 3848
	li $t0, 1
	sw $t0, 0($t9)
__whlbgn2:
	addi $t0, $gp, 3848
	lw $t0, 0($t0)
	addi $t1, $gp, 3844
	lw $t1, 0($t1)
	slt $t0, $t0, $t1
	beq $t0, $zero, __whlend2
	addi $t1, $gp, 3852
	li $t2, 1
	sw $t2, 0($t1)
__whlbgn3:
	addi $t2, $gp, 3852
	lw $t2, 0($t2)
	addi $t3, $gp, 3840
	lw $t3, 0($t3)
	slt $t2, $t2, $t3
	beq $t2, $zero, __whlend3
	addi $t3, $gp, 3848
	lw $t3, 0($t3)
	addi $t4, $gp, 3844
	lw $t4, 0($t4)
	mul $t3, $t3, $t4
	addi $t4, $gp, 3852
	lw $t4, 0($t4)
	add $t3, $t3, $t4
	sll $t3, $t3, 2
	add $t3, $t3, $gp
	addi $t3, $t3, 240
	addi $t4, $gp, 3848
	lw $t4, 0($t4)
	li $t5, 1
	sub $t4, $t4, $t5
	addi $t5, $gp, 3844
	lw $t5, 0($t5)
	mul $t4, $t4, $t5
	addi $t5, $gp, 3852
	lw $t5, 0($t5)
	add $t4, $t4, $t5
	li $t5, 1
	sub $t4, $t4, $t5
	sll $t4, $t4, 2
	add $t4, $t4, $gp
	addi $t4, $t4, 240
	lw $t4, 0($t4)
	sw $t4, 0($t3)
	addi $t5, $gp, 3848
	lw $t5, 0($t5)
	sll $t5, $t5, 2
	add $t5, $t5, $gp
	addi $t5, $t5, 120
	lw $t5, 0($t5)
	addi $t6, $gp, 3852
	lw $t6, 0($t6)
	sll $t6, $t6, 2
	add $t6, $t6, $gp
	lw $t6, 0($t6)
	sne $t5, $t5, $t6
	beq $t5, $zero, __ifend0
	addi $t6, $gp, 3848
	lw $t6, 0($t6)
	addi $t7, $gp, 3844
	lw $t7, 0($t7)
	mul $t6, $t6, $t7
	addi $t7, $gp, 3852
	lw $t7, 0($t7)
	add $t6, $t6, $t7
	sll $t6, $t6, 2
	add $t6, $t6, $gp
	addi $t6, $t6, 240
	addi $t7, $gp, 3848
	lw $t7, 0($t7)
	addi $s0, $gp, 3844
	lw $s0, 0($s0)
	mul $t7, $t7, $s0
	addi $s0, $gp, 3852
	lw $s0, 0($s0)
	add $t7, $t7, $s0
	sll $t7, $t7, 2
	add $t7, $t7, $gp
	addi $t7, $t7, 240
	lw $t7, 0($t7)
	li $s0, 1
	add $t7, $t7, $s0
	sw $t7, 0($t6)
__ifend0:
	addi $s0, $gp, 3848
	lw $s0, 0($s0)
	li $s1, 1
	sub $s0, $s0, $s1
	addi $s1, $gp, 3844
	lw $s1, 0($s1)
	mul $s0, $s0, $s1
	addi $s1, $gp, 3852
	lw $s1, 0($s1)
	add $s0, $s0, $s1
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	addi $s0, $s0, 240
	lw $s0, 0($s0)
	addi $s1, $gp, 3848
	lw $s1, 0($s1)
	addi $s2, $gp, 3844
	lw $s2, 0($s2)
	mul $s1, $s1, $s2
	addi $s2, $gp, 3852
	lw $s2, 0($s2)
	add $s1, $s1, $s2
	sll $s1, $s1, 2
	add $s1, $s1, $gp
	addi $s1, $s1, 240
	lw $s1, 0($s1)
	slt $s0, $s0, $s1
	beq $s0, $zero, __ifend1
	addi $s2, $gp, 3848
	lw $s2, 0($s2)
	addi $s3, $gp, 3844
	lw $s3, 0($s3)
	mul $s2, $s2, $s3
	addi $s3, $gp, 3852
	lw $s3, 0($s3)
	add $s2, $s2, $s3
	sll $s2, $s2, 2
	add $s2, $s2, $gp
	addi $s2, $s2, 240
	addi $s3, $gp, 3848
	lw $s3, 0($s3)
	li $s4, 1
	sub $s3, $s3, $s4
	addi $s4, $gp, 3844
	lw $s4, 0($s4)
	mul $s3, $s3, $s4
	addi $s4, $gp, 3852
	lw $s4, 0($s4)
	add $s3, $s3, $s4
	sll $s3, $s3, 2
	add $s3, $s3, $gp
	addi $s3, $s3, 240
	lw $s3, 0($s3)
	li $s4, 1
	add $s3, $s3, $s4
	sw $s3, 0($s2)
__ifend1:
	addi $s4, $gp, 3848
	lw $s4, 0($s4)
	addi $s5, $gp, 3844
	lw $s5, 0($s5)
	mul $s4, $s4, $s5
	addi $s5, $gp, 3852
	lw $s5, 0($s5)
	add $s4, $s4, $s5
	li $s5, 1
	sub $s4, $s4, $s5
	sll $s4, $s4, 2
	add $s4, $s4, $gp
	addi $s4, $s4, 240
	lw $s4, 0($s4)
	addi $s5, $gp, 3848
	lw $s5, 0($s5)
	addi $s6, $gp, 3844
	lw $s6, 0($s6)
	mul $s5, $s5, $s6
	addi $s6, $gp, 3852
	lw $s6, 0($s6)
	add $s5, $s5, $s6
	sll $s5, $s5, 2
	add $s5, $s5, $gp
	addi $s5, $s5, 240
	lw $s5, 0($s5)
	slt $s4, $s4, $s5
	beq $s4, $zero, __ifend2
	addi $s6, $gp, 3848
	lw $s6, 0($s6)
	addi $s7, $gp, 3844
	lw $s7, 0($s7)
	mul $s6, $s6, $s7
	addi $s7, $gp, 3852
	lw $s7, 0($s7)
	add $s6, $s6, $s7
	sll $s6, $s6, 2
	add $s6, $s6, $gp
	addi $s6, $s6, 240
	addi $s7, $gp, 3848
	lw $s7, 0($s7)
	addi $t8, $gp, 3844
	lw $t8, 0($t8)
	mul $s7, $s7, $t8
	addi $t8, $gp, 3852
	lw $t8, 0($t8)
	add $s7, $s7, $t8
	li $t8, 1
	sub $s7, $s7, $t8
	sll $s7, $s7, 2
	add $s7, $s7, $gp
	addi $s7, $s7, 240
	lw $s7, 0($s7)
	li $t8, 1
	add $s7, $s7, $t8
	sw $s7, 0($s6)
__ifend2:
	addi $t8, $gp, 3852
	addi $t9, $gp, 3852
	lw $t9, 0($t9)
	li $t0, 1
	add $t9, $t9, $t0
	sw $t9, 0($t8)
	j __whlbgn3
__whlend3:
	addi $t0, $gp, 3848
	addi $t1, $gp, 3848
	lw $t1, 0($t1)
	li $t2, 1
	add $t1, $t1, $t2
	sw $t1, 0($t0)
	j __whlbgn2
__whlend2:
	li $t2, 899
	sll $t2, $t2, 2
	add $t2, $t2, $gp
	addi $t2, $t2, 240
	lw $t2, 0($t2)
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
