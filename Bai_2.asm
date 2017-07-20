# Bai_2.asm
# Get the maximum nunber of an integer
# Created by Du Duong on 12/7/2017
# All rights reserved.

.data
	inputAStr : .asciiz "n = "
.text

main:
	#load max value to register $t0 as 0
	li $t0, 0
	
	#store number 10 to $t5
	li $t5, 10
	
	# Print n = text
	la $a0, inputAStr
	addi $v0, $zero, 4
	syscall
	
	#read n from keyboard
	addi $v0, $zero, 5
	syscall
	
	#store n to $t1 register
	add $t1, $v0, $zero
	
updateMax:
	add $t0, $t2, $zero
	j Loop
Loop:
	#check if n == 0
	beqz $t1, printResult

	#get n % 10
	div $t2, $t1, $t5
	mul $t2, $t2, $t5
	sub $t2, $t1, $t2
	
	#update n = n / 10
	div $t1, $t1, $t5
	
	#if (max < n % 10)
	slt $t3, $t0, $t2
	#if true
	bnez $t3, updateMax
	j Loop
	
printResult:
	add $a0, $t0, $zero
	addi $v0, $zero, 1
	syscall
	
Exit:
	addi $v0, $zero, 10
	syscall
	
