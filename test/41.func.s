.data
.newline: .asciiz "\n"
.text
.globl main
	j main
t:
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
	li $t1, 2
	sw $t1, 0($t0)
	addi $t1, $fp, -4
	lw $t1, 0($t1)
	move $a0, $t1
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t1, $fp, -4
	lw $t1, 0($t1)
	li $t2, 1
	add $t1, $t1, $t2
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
main:
	move $t2, $gp
	li $t3, 1
	sw $t3, 0($t2)
	addi $t3, $gp, 4
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal t
	lw $t3, 0($sp)
	addi $sp, $sp, 4
	sw $v0, 0($t3)
	move $t3, $gp
	lw $t3, 0($t3)
	addi $t4, $gp, 4
	lw $t4, 0($t4)
	add $t3, $t3, $t4
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $v0, 17
	move $a0, $zero
	syscall
