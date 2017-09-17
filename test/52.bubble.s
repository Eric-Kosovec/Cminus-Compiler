.data
.newline: .asciiz "\n"
.text
.globl main
	j main
sort:
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
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	addi $sp, $sp, -4
	addi $t0, $fp, -4
	addi $t1, $gp, 84
	lw $t1, 0($t1)
	sw $t1, 0($t0)
__whlbgn0:
	addi $t1, $fp, -4
	lw $t1, 0($t1)
	addi $t2, $gp, 88
	lw $t2, 0($t2)
	slt $t1, $t1, $t2
	beq $t1, $zero, __whlend0
	addi $t2, $fp, -16
	addi $t3, $fp, -4
	lw $t3, 0($t3)
	sw $t3, 0($t2)
	addi $t3, $fp, -8
	addi $t4, $fp, -4
	lw $t4, 0($t4)
	li $t5, 1
	add $t4, $t4, $t5
	sw $t4, 0($t3)
__whlbgn1:
	addi $t5, $fp, -8
	lw $t5, 0($t5)
	addi $t6, $gp, 88
	lw $t6, 0($t6)
	slt $t5, $t5, $t6
	beq $t5, $zero, __whlend1
	addi $t6, $fp, -8
	lw $t6, 0($t6)
	sll $t6, $t6, 2
	add $t6, $t6, $gp
	lw $t6, 0($t6)
	addi $t7, $fp, -16
	lw $t7, 0($t7)
	sll $t7, $t7, 2
	add $t7, $t7, $gp
	lw $t7, 0($t7)
	slt $t6, $t6, $t7
	beq $t6, $zero, __ifend0
	addi $t7, $fp, -16
	addi $s0, $fp, -8
	lw $s0, 0($s0)
	sw $s0, 0($t7)
__ifend0:
	addi $s0, $fp, -8
	addi $s1, $fp, -8
	lw $s1, 0($s1)
	li $s2, 1
	add $s1, $s1, $s2
	sw $s1, 0($s0)
	j __whlbgn1
__whlend1:
	addi $s2, $fp, -12
	addi $s3, $fp, -4
	lw $s3, 0($s3)
	sll $s3, $s3, 2
	add $s3, $s3, $gp
	lw $s3, 0($s3)
	sw $s3, 0($s2)
	addi $s3, $fp, -4
	lw $s3, 0($s3)
	sll $s3, $s3, 2
	add $s3, $s3, $gp
	addi $s4, $fp, -16
	lw $s4, 0($s4)
	sll $s4, $s4, 2
	add $s4, $s4, $gp
	lw $s4, 0($s4)
	sw $s4, 0($s3)
	addi $s4, $fp, -16
	lw $s4, 0($s4)
	sll $s4, $s4, 2
	add $s4, $s4, $gp
	addi $s5, $fp, -12
	lw $s5, 0($s5)
	sw $s5, 0($s4)
	addi $s5, $fp, -4
	addi $s6, $fp, -4
	lw $s6, 0($s6)
	li $s7, 1
	add $s6, $s6, $s7
	sw $s6, 0($s5)
	j __whlbgn0
__whlend0:
	li $s7, 1
	move $v0, $s7
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
output:
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
	addi $s7, $fp, -4
	li $t8, 0
	sw $t8, 0($s7)
__whlbgn2:
	addi $t8, $fp, -4
	lw $t8, 0($t8)
	li $t9, 20
	slt $t8, $t8, $t9
	beq $t8, $zero, __whlend2
	addi $t9, $fp, -4
	lw $t9, 0($t9)
	sll $t9, $t9, 2
	add $t9, $t9, $gp
	lw $t9, 0($t9)
	move $a0, $t9
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t9, $fp, -4
	addi $t0, $fp, -4
	lw $t0, 0($t0)
	li $t1, 1
	add $t0, $t0, $t1
	sw $t0, 0($t9)
	j __whlbgn2
__whlend2:
	addi $t1, $fp, -4
	lw $t1, 0($t1)
	move $v0, $t1
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
input:
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
	addi $t1, $gp, 84
	li $t2, 3
	sw $t2, 0($t1)
	addi $t2, $gp, 88
	li $t3, 7
	sw $t3, 0($t2)
	addi $t3, $gp, 92
	addi $t4, $gp, 84
	lw $t4, 0($t4)
	sw $t4, 0($t3)
	la $a0, __str0
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
__whlbgn3:
	addi $t4, $gp, 92
	lw $t4, 0($t4)
	addi $t5, $gp, 88
	lw $t5, 0($t5)
	sle $t4, $t4, $t5
	beq $t4, $zero, __whlend3
	addi $t5, $gp, 92
	lw $t5, 0($t5)
	sll $t5, $t5, 2
	add $t5, $t5, $gp
	li $v0, 5
	syscall
	sw $v0, 0($t5)
	addi $t5, $gp, 92
	addi $t6, $gp, 92
	lw $t6, 0($t6)
	li $t7, 1
	add $t6, $t6, $t7
	sw $t6, 0($t5)
	j __whlbgn3
__whlend3:
	addi $t7, $gp, 92
	lw $t7, 0($t7)
	move $v0, $t7
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
initialize:
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
	addi $t7, $fp, -4
	li $s0, 0
	sw $s0, 0($t7)
__whlbgn4:
	addi $s0, $fp, -4
	lw $s0, 0($s0)
	li $s1, 20
	slt $s0, $s0, $s1
	beq $s0, $zero, __whlend4
	addi $s1, $fp, -4
	lw $s1, 0($s1)
	sll $s1, $s1, 2
	add $s1, $s1, $gp
	li $s2, 0
	sw $s2, 0($s1)
	addi $s2, $fp, -4
	addi $s3, $fp, -4
	lw $s3, 0($s3)
	li $s4, 1
	add $s3, $s3, $s4
	sw $s3, 0($s2)
	j __whlbgn4
__whlend4:
	li $s4, 1
	move $v0, $s4
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
	addi $s4, $gp, 80
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal initialize
	sw $v0, 0($s4)
	la $a0, __str1
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s4, $gp, 80
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal output
	sw $v0, 0($s4)
	addi $s4, $gp, 80
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal input
	sw $v0, 0($s4)
	la $a0, __str2
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s4, $gp, 80
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal output
	sw $v0, 0($s4)
	addi $s4, $gp, 84
	li $s5, 0
	sw $s5, 0($s4)
	addi $s5, $gp, 88
	li $s6, 20
	sw $s6, 0($s5)
	addi $s6, $gp, 80
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal sort
	sw $v0, 0($s6)
	la $a0, __str3
	li $v0, 4
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $s6, $gp, 80
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal output
	sw $v0, 0($s6)
	li $v0, 17
	move $a0, $zero
	syscall
.data
__str0: .asciiz "Enter a[3:7]"
__str1: .asciiz "After initialization"
__str2: .asciiz "After input"
__str3: .asciiz "After sorting"
