.data
.newline: .asciiz "\n"
.text
.globl main
	j main
a1:
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
	li $t0, 1
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t0, 0
	move $v0, $t0
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
a2:
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
	addi $t0, $gp, 4
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal a1
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	sw $v0, 0($t0)
	li $t0, 2
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t0, 0
	move $v0, $t0
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
a3:
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
	move $t0, $gp
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal a1
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	sw $v0, 0($t0)
	addi $t0, $gp, 4
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal a2
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	sw $v0, 0($t0)
	li $t0, 3
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t0, 0
	move $v0, $t0
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
a4:
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
	move $t0, $gp
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal a1
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	sw $v0, 0($t0)
	addi $t0, $gp, 4
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal a2
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	sw $v0, 0($t0)
	addi $t0, $gp, 8
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal a3
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	sw $v0, 0($t0)
	li $t0, 4
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, .newline
	li $v0, 4
	syscall
	li $t0, 0
	move $v0, $t0
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
	move $t0, $gp
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal a1
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	sw $v0, 0($t0)
	addi $t0, $gp, 4
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal a2
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	sw $v0, 0($t0)
	addi $t0, $gp, 8
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal a3
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	sw $v0, 0($t0)
	addi $t0, $gp, 12
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -36
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	move $fp, $sp
	jal a4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	sw $v0, 0($t0)
	li $v0, 17
	move $a0, $zero
	syscall
