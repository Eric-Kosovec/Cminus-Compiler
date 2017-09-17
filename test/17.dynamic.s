.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	li $t0, 0
	sll $t0, $t0, 2
	add $t0, $t0, $gp
	li $t1, 0
	sw $t1, 0($t0)
	li $t1, 1
	sll $t1, $t1, 2
	add $t1, $t1, $gp
	li $t2, 1
	sw $t2, 0($t1)
	li $t2, 2
	sll $t2, $t2, 2
	add $t2, $t2, $gp
	li $t3, 2
	sw $t3, 0($t2)
	li $t3, 3
	sll $t3, $t3, 2
	add $t3, $t3, $gp
	li $t4, 3
	sw $t4, 0($t3)
	li $t4, 4
	sll $t4, $t4, 2
	add $t4, $t4, $gp
	li $t5, 4
	sw $t5, 0($t4)
	li $t5, 5
	sll $t5, $t5, 2
	add $t5, $t5, $gp
	li $t6, 5
	sw $t6, 0($t5)
	li $t6, 6
	sll $t6, $t6, 2
	add $t6, $t6, $gp
	li $t7, 6
	sw $t7, 0($t6)
	li $t7, 7
	sll $t7, $t7, 2
	add $t7, $t7, $gp
	li $s0, 7
	sw $s0, 0($t7)
	li $s0, 8
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	li $s1, 8
	sw $s1, 0($s0)
	li $s1, 9
	sll $s1, $s1, 2
	add $s1, $s1, $gp
	li $s2, 9
	sw $s2, 0($s1)
	li $s2, 10
	sll $s2, $s2, 2
	add $s2, $s2, $gp
	li $s3, 8
	sw $s3, 0($s2)
	li $s3, 11
	sll $s3, $s3, 2
	add $s3, $s3, $gp
	li $s4, 7
	sw $s4, 0($s3)
	li $s4, 12
	sll $s4, $s4, 2
	add $s4, $s4, $gp
	li $s5, 6
	sw $s5, 0($s4)
	li $s5, 13
	sll $s5, $s5, 2
	add $s5, $s5, $gp
	li $s6, 5
	sw $s6, 0($s5)
	li $s6, 14
	sll $s6, $s6, 2
	add $s6, $s6, $gp
	li $s7, 4
	sw $s7, 0($s6)
	li $s7, 15
	sll $s7, $s7, 2
	add $s7, $s7, $gp
	li $t8, 3
	sw $t8, 0($s7)
	li $t8, 16
	sll $t8, $t8, 2
	add $t8, $t8, $gp
	li $t9, 2
	sw $t9, 0($t8)
	li $t9, 17
	sll $t9, $t9, 2
	add $t9, $t9, $gp
	li $t0, 1
	sw $t0, 0($t9)
	li $t0, 18
	sll $t0, $t0, 2
	add $t0, $t0, $gp
	li $t1, 0
	sw $t1, 0($t0)
	li $t1, 0
	sll $t1, $t1, 2
	add $t1, $t1, $gp
	addi $t1, $t1, 76
	li $t2, 0
	sw $t2, 0($t1)
	li $t2, 1
	sll $t2, $t2, 2
	add $t2, $t2, $gp
	addi $t2, $t2, 76
	li $t3, 1
	sw $t3, 0($t2)
	li $t3, 2
	sll $t3, $t3, 2
	add $t3, $t3, $gp
	addi $t3, $t3, 76
	li $t4, 3
	sw $t4, 0($t3)
	li $t4, 3
	sll $t4, $t4, 2
	add $t4, $t4, $gp
	addi $t4, $t4, 76
	li $t5, 5
	sw $t5, 0($t4)
	li $t5, 4
	sll $t5, $t5, 2
	add $t5, $t5, $gp
	addi $t5, $t5, 76
	li $t6, 7
	sw $t6, 0($t5)
	li $t6, 5
	sll $t6, $t6, 2
	add $t6, $t6, $gp
	addi $t6, $t6, 76
	li $t7, 9
	sw $t7, 0($t6)
	li $t7, 6
	sll $t7, $t7, 2
	add $t7, $t7, $gp
	addi $t7, $t7, 76
	li $s0, 11
	sw $s0, 0($t7)
	li $s0, 7
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	addi $s0, $s0, 76
	li $s1, 4
	sw $s1, 0($s0)
	li $s1, 8
	sll $s1, $s1, 2
	add $s1, $s1, $gp
	addi $s1, $s1, 76
	li $s2, 3
	sw $s2, 0($s1)
	li $s2, 9
	sll $s2, $s2, 2
	add $s2, $s2, $gp
	addi $s2, $s2, 76
	li $s3, 2
	sw $s3, 0($s2)
	li $s3, 10
	sll $s3, $s3, 2
	add $s3, $s3, $gp
	addi $s3, $s3, 76
	li $s4, 1
	sw $s4, 0($s3)
	li $s4, 11
	sll $s4, $s4, 2
	add $s4, $s4, $gp
	addi $s4, $s4, 76
	li $s5, 9
	sw $s5, 0($s4)
	li $s5, 12
	sll $s5, $s5, 2
	add $s5, $s5, $gp
	addi $s5, $s5, 76
	li $s6, 8
	sw $s6, 0($s5)
	li $s6, 13
	sll $s6, $s6, 2
	add $s6, $s6, $gp
	addi $s6, $s6, 76
	li $s7, 7
	sw $s7, 0($s6)
	li $s7, 14
	sll $s7, $s7, 2
	add $s7, $s7, $gp
	addi $s7, $s7, 76
	li $t8, 6
	sw $t8, 0($s7)
	li $t8, 15
	sll $t8, $t8, 2
	add $t8, $t8, $gp
	addi $t8, $t8, 76
	li $t9, 0
	sw $t9, 0($t8)
	addi $t9, $gp, 1756
	li $t0, 20
	sw $t0, 0($t9)
	addi $t0, $gp, 1740
	li $t1, 0
	sw $t1, 0($t0)
__whlbgn0:
	addi $t1, $gp, 1740
	lw $t1, 0($t1)
	li $t2, 1
	add $t1, $t1, $t2
	sll $t1, $t1, 2
	add $t1, $t1, $gp
	lw $t1, 0($t1)
	li $t2, 0
	sne $t1, $t1, $t2
	beq $t1, $zero, __whlend0
	addi $t2, $gp, 1740
	lw $t2, 0($t2)
	sll $t2, $t2, 2
	add $t2, $t2, $gp
	addi $t2, $t2, 140
	addi $t3, $gp, 1740
	lw $t3, 0($t3)
	sw $t3, 0($t2)
	addi $t3, $gp, 1740
	addi $t4, $gp, 1740
	lw $t4, 0($t4)
	li $t5, 1
	add $t4, $t4, $t5
	sw $t4, 0($t3)
	j __whlbgn0
__whlend0:
	addi $t5, $gp, 1740
	addi $t6, $gp, 1740
	lw $t6, 0($t6)
	li $t7, 1
	sub $t6, $t6, $t7
	sw $t6, 0($t5)
	addi $t7, $gp, 1744
	li $s0, 0
	sw $s0, 0($t7)
__whlbgn1:
	addi $s0, $gp, 1744
	lw $s0, 0($s0)
	li $s1, 1
	add $s0, $s0, $s1
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	addi $s0, $s0, 76
	lw $s0, 0($s0)
	li $s1, 0
	sne $s0, $s0, $s1
	beq $s0, $zero, __whlend1
	addi $s1, $gp, 1744
	lw $s1, 0($s1)
	addi $s2, $gp, 1756
	lw $s2, 0($s2)
	mul $s1, $s1, $s2
	sll $s1, $s1, 2
	add $s1, $s1, $gp
	addi $s1, $s1, 140
	addi $s2, $gp, 1744
	lw $s2, 0($s2)
	sw $s2, 0($s1)
	addi $s2, $gp, 1744
	addi $s3, $gp, 1744
	lw $s3, 0($s3)
	li $s4, 1
	add $s3, $s3, $s4
	sw $s3, 0($s2)
	j __whlbgn1
__whlend1:
	addi $s4, $gp, 1744
	addi $s5, $gp, 1744
	lw $s5, 0($s5)
	li $s6, 1
	sub $s5, $s5, $s6
	sw $s5, 0($s4)
	addi $s6, $gp, 1748
	li $s7, 1
	sw $s7, 0($s6)
__whlbgn2:
	addi $s7, $gp, 1748
	lw $s7, 0($s7)
	addi $t8, $gp, 1744
	lw $t8, 0($t8)
	sle $s7, $s7, $t8
	beq $s7, $zero, __whlend2
	addi $t8, $gp, 1752
	li $t9, 1
	sw $t9, 0($t8)
__whlbgn3:
	addi $t9, $gp, 1752
	lw $t9, 0($t9)
	addi $t0, $gp, 1740
	lw $t0, 0($t0)
	sle $t9, $t9, $t0
	beq $t9, $zero, __whlend3
	addi $t0, $gp, 1748
	lw $t0, 0($t0)
	addi $t1, $gp, 1756
	lw $t1, 0($t1)
	mul $t0, $t0, $t1
	addi $t1, $gp, 1752
	lw $t1, 0($t1)
	add $t0, $t0, $t1
	sll $t0, $t0, 2
	add $t0, $t0, $gp
	addi $t0, $t0, 140
	addi $t1, $gp, 1748
	lw $t1, 0($t1)
	li $t2, 1
	sub $t1, $t1, $t2
	addi $t2, $gp, 1756
	lw $t2, 0($t2)
	mul $t1, $t1, $t2
	addi $t2, $gp, 1752
	lw $t2, 0($t2)
	add $t1, $t1, $t2
	li $t2, 1
	sub $t1, $t1, $t2
	sll $t1, $t1, 2
	add $t1, $t1, $gp
	addi $t1, $t1, 140
	lw $t1, 0($t1)
	sw $t1, 0($t0)
	addi $t2, $gp, 1748
	lw $t2, 0($t2)
	sll $t2, $t2, 2
	add $t2, $t2, $gp
	addi $t2, $t2, 76
	lw $t2, 0($t2)
	addi $t3, $gp, 1752
	lw $t3, 0($t3)
	sll $t3, $t3, 2
	add $t3, $t3, $gp
	lw $t3, 0($t3)
	sne $t2, $t2, $t3
	beq $t2, $zero, __ifend0
	addi $t3, $gp, 1748
	lw $t3, 0($t3)
	addi $t4, $gp, 1756
	lw $t4, 0($t4)
	mul $t3, $t3, $t4
	addi $t4, $gp, 1752
	lw $t4, 0($t4)
	add $t3, $t3, $t4
	sll $t3, $t3, 2
	add $t3, $t3, $gp
	addi $t3, $t3, 140
	addi $t4, $gp, 1748
	lw $t4, 0($t4)
	addi $t5, $gp, 1756
	lw $t5, 0($t5)
	mul $t4, $t4, $t5
	addi $t5, $gp, 1752
	lw $t5, 0($t5)
	add $t4, $t4, $t5
	sll $t4, $t4, 2
	add $t4, $t4, $gp
	addi $t4, $t4, 140
	lw $t4, 0($t4)
	li $t5, 1
	add $t4, $t4, $t5
	sw $t4, 0($t3)
__ifend0:
	addi $t5, $gp, 1748
	lw $t5, 0($t5)
	li $t6, 1
	sub $t5, $t5, $t6
	addi $t6, $gp, 1756
	lw $t6, 0($t6)
	mul $t5, $t5, $t6
	addi $t6, $gp, 1752
	lw $t6, 0($t6)
	add $t5, $t5, $t6
	sll $t5, $t5, 2
	add $t5, $t5, $gp
	addi $t5, $t5, 140
	lw $t5, 0($t5)
	addi $t6, $gp, 1748
	lw $t6, 0($t6)
	addi $t7, $gp, 1756
	lw $t7, 0($t7)
	mul $t6, $t6, $t7
	addi $t7, $gp, 1752
	lw $t7, 0($t7)
	add $t6, $t6, $t7
	sll $t6, $t6, 2
	add $t6, $t6, $gp
	addi $t6, $t6, 140
	lw $t6, 0($t6)
	slt $t5, $t5, $t6
	beq $t5, $zero, __ifend1
	addi $t7, $gp, 1748
	lw $t7, 0($t7)
	addi $s0, $gp, 1756
	lw $s0, 0($s0)
	mul $t7, $t7, $s0
	addi $s0, $gp, 1752
	lw $s0, 0($s0)
	add $t7, $t7, $s0
	sll $t7, $t7, 2
	add $t7, $t7, $gp
	addi $t7, $t7, 140
	addi $s0, $gp, 1748
	lw $s0, 0($s0)
	li $s1, 1
	sub $s0, $s0, $s1
	addi $s1, $gp, 1756
	lw $s1, 0($s1)
	mul $s0, $s0, $s1
	addi $s1, $gp, 1752
	lw $s1, 0($s1)
	add $s0, $s0, $s1
	sll $s0, $s0, 2
	add $s0, $s0, $gp
	addi $s0, $s0, 140
	lw $s0, 0($s0)
	li $s1, 1
	add $s0, $s0, $s1
	sw $s0, 0($t7)
__ifend1:
	addi $s1, $gp, 1748
	lw $s1, 0($s1)
	addi $s2, $gp, 1756
	lw $s2, 0($s2)
	mul $s1, $s1, $s2
	addi $s2, $gp, 1752
	lw $s2, 0($s2)
	add $s1, $s1, $s2
	li $s2, 1
	sub $s1, $s1, $s2
	sll $s1, $s1, 2
	add $s1, $s1, $gp
	addi $s1, $s1, 140
	lw $s1, 0($s1)
	addi $s2, $gp, 1748
	lw $s2, 0($s2)
	addi $s3, $gp, 1756
	lw $s3, 0($s3)
	mul $s2, $s2, $s3
	addi $s3, $gp, 1752
	lw $s3, 0($s3)
	add $s2, $s2, $s3
	sll $s2, $s2, 2
	add $s2, $s2, $gp
	addi $s2, $s2, 140
	lw $s2, 0($s2)
	slt $s1, $s1, $s2
	beq $s1, $zero, __ifend2
	addi $s3, $gp, 1748
	lw $s3, 0($s3)
	addi $s4, $gp, 1756
	lw $s4, 0($s4)
	mul $s3, $s3, $s4
	addi $s4, $gp, 1752
	lw $s4, 0($s4)
	add $s3, $s3, $s4
	sll $s3, $s3, 2
	add $s3, $s3, $gp
	addi $s3, $s3, 140
	addi $s4, $gp, 1748
	lw $s4, 0($s4)
	addi $s5, $gp, 1756
	lw $s5, 0($s5)
	mul $s4, $s4, $s5
	addi $s5, $gp, 1752
	lw $s5, 0($s5)
	add $s4, $s4, $s5
	li $s5, 1
	sub $s4, $s4, $s5
	sll $s4, $s4, 2
	add $s4, $s4, $gp
	addi $s4, $s4, 140
	lw $s4, 0($s4)
	li $s5, 1
	add $s4, $s4, $s5
	sw $s4, 0($s3)
__ifend2:
	addi $s5, $gp, 1752
	addi $s6, $gp, 1752
	lw $s6, 0($s6)
	li $s7, 1
	add $s6, $s6, $s7
	sw $s6, 0($s5)
	j __whlbgn3
__whlend3:
	addi $s7, $gp, 1748
	addi $t8, $gp, 1748
	lw $t8, 0($t8)
	li $t9, 1
	add $t8, $t8, $t9
	sw $t8, 0($s7)
	j __whlbgn2
__whlend2:
	addi $t9, $gp, 1744
	lw $t9, 0($t9)
	move $a0, $t9
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t9, $gp, 1740
	lw $t9, 0($t9)
	move $a0, $t9
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t9, $gp, 1744
	lw $t9, 0($t9)
	addi $t0, $gp, 1756
	lw $t0, 0($t0)
	mul $t9, $t9, $t0
	addi $t0, $gp, 1740
	lw $t0, 0($t0)
	add $t9, $t9, $t0
	sll $t9, $t9, 2
	add $t9, $t9, $gp
	addi $t9, $t9, 140
	lw $t9, 0($t9)
	move $a0, $t9
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
