# Bai_1.asm
# Swap all the nunber of an integer
# Created by Du Duong on 12/7/2017
# All rights reserved.

.data
	inputAStr : .asciiz "n = "
.text

main:	
	#store number 10 to register $t0
	li $t0, 10
	
	# Print n = text
	la $a0, inputAStr
	addi $v0, $zero, 4
	syscall
	
	#read n from keyboard
	addi $v0, $zero, 5
	syscall

	#store n to $t1 register
	add $t1, $v0, $zero

Loop:	
	#get n / 10
	div $t2, $t1, $t0
	
	#get n / 10 * 10
	mul $t2, $t2, $t0
	
	#store n % 10
	sub $t2, $t1, $t2 
	
	#print number
	add $a0, $zero, $t2
	addi $v0, $zero, 1
	syscall
	
	#update n value
	div $t1, $t1, 10
	
	#check if n == 0 -> Exit
	beqz $t1, Exit
	
	#check finish
	slti $t2, $t1, 10
	bnez $t2, PrintSingle
	j Loop
	
PrintSingle:
	#print number
	add $a0, $zero, $t1
	addi $v0, $zero, 1
	syscall

Exit:
	addi $v0, $zero, 10
	syscall
