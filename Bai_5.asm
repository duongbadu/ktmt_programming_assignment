# Bai_5.asm
# Get the 1st number of an integer
# Created by Du Duong on 19/7/2017
# All rights reserved.

.data
	inputAStr : .asciiz "a = "
.text
		
main:
	#Print a = text
	la $a0, inputAStr
	addi $v0, $zero, 4
	syscall

	#read a from keyboard and store to $t1
	addi $v0, $zero, 5
	syscall
	add $t1, $v0, $zero
	
	#store constant 10 to $t0
	addi $t0, $zero, 10
	
Loop:
	#if a < 10
	slt $t2, $t1, $t0
	beq $t2, 1, PrintResult
	
	#if a >= 10
	div $t1, $t1, $t0 # a /= 10
	
	j Loop
	
PrintResult:
	#print a
	addi $a0, $t1, 0
	addi $v0, $zero, 1
	syscall

Exit:
	addi $v0, $zero, 10
	syscall
	
