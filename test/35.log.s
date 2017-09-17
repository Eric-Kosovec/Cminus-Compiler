.data
.newline: .asciiz "\n"
.text
.globl main
	j main
main:
	move $t0, $gp
	li $t1, 1
	sw $t1, 0($t0)
	addi $t1, $gp, 4
	li $t2, 2
	sw $t2, 0($t1)
	addi $t2, $gp, 8
	li $t3, 3
	sw $t3, 0($t2)
	addi $t3, $gp, 12
	li $t4, 4
	sw $t4, 0($t3)
	addi $t4, $gp, 16
	move $t5, $gp
	lw $t5, 0($t5)
	addi $t6, $gp, 4
	lw $t6, 0($t6)
	slt $t5, $t5, $t6
	sw $t5, 0($t4)
	addi $t6, $gp, 16
	lw $t6, 0($t6)
	seq $t6, $t6, $zero
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t6, $gp
	lw $t6, 0($t6)
	addi $t7, $gp, 4
	lw $t7, 0($t7)
	seq $t6, $t6, $t7
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t7, $gp
	lw $t7, 0($t7)
	move $s0, $gp
	lw $s0, 0($s0)
	seq $t7, $t7, $s0
	move $a0, $t7
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s0, $gp, 12
	lw $s0, 0($s0)
	addi $s1, $gp, 8
	lw $s1, 0($s1)
	sgt $s0, $s0, $s1
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s1, $gp, 4
	lw $s1, 0($s1)
	addi $s2, $gp, 4
	lw $s2, 0($s2)
	sge $s1, $s1, $s2
	move $a0, $s1
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s2, $gp, 8
	lw $s2, 0($s2)
	move $s3, $gp
	lw $s3, 0($s3)
	sle $s2, $s2, $s3
	move $a0, $s2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $s3, $gp
	lw $s3, 0($s3)
	addi $s4, $gp, 4
	lw $s4, 0($s4)
	sne $s3, $s3, $s4
	move $a0, $s3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s4, $gp, 12
	lw $s4, 0($s4)
	addi $s5, $gp, 8
	lw $s5, 0($s5)
	sgt $s4, $s4, $s5
	seq $s4, $s4, $zero
	move $a0, $s4
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $s5, $gp
	lw $s5, 0($s5)
	addi $s6, $gp, 4
	lw $s6, 0($s6)
	sgt $s5, $s5, $s6
	addi $s6, $gp, 12
	lw $s6, 0($s6)
	addi $s7, $gp, 8
	lw $s7, 0($s7)
	sgt $s6, $s6, $s7
	or $s5, $s5, $s6
	move $a0, $s5
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s7, $gp, 4
	lw $s7, 0($s7)
	move $t8, $gp
	lw $t8, 0($t8)
	sgt $s7, $s7, $t8
	addi $t8, $gp, 12
	lw $t8, 0($t8)
	addi $t9, $gp, 8
	lw $t9, 0($t9)
	sgt $t8, $t8, $t9
	and $s7, $s7, $t8
	move $a0, $s7
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	move $t9, $gp
	lw $t9, 0($t9)
	addi $t0, $gp, 4
	lw $t0, 0($t0)
	seq $t9, $t9, $t0
	move $t0, $gp
	lw $t0, 0($t0)
	addi $t1, $gp, 4
	lw $t1, 0($t1)
	slt $t0, $t0, $t1
	or $t9, $t9, $t0
	addi $t1, $gp, 8
	lw $t1, 0($t1)
	addi $t2, $gp, 12
	lw $t2, 0($t2)
	sne $t1, $t1, $t2
	and $t9, $t9, $t1
	move $a0, $t9
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
