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
	addi $t0, $gp, 4
	li $t1, 5
	sw $t1, 0($t0)
	addi $t1, $fp, -4
	li $t2, 2
	sw $t2, 0($t1)
	addi $t2, $fp, -4
	lw $t2, 0($t2)
	move $a0, $t2
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	addi $t2, $fp, -4
	lw $t2, 0($t2)
	addi $t3, $gp, 4
	lw $t3, 0($t3)
	add $t2, $t2, $t3
	move $v0, $t2
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
	move $t3, $gp
	li $t4, 1
	sw $t4, 0($t3)
	addi $t4, $gp, 4
	addi $sp, $sp, -4
	sw $t4, 0($sp)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal t
	lw $t4, 0($sp)
	addi $sp, $sp, 4
	sw $v0, 0($t4)
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
	li $v0, 17
	move $a0, $zero
	syscall
