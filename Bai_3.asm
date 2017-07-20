# Bai_3.asm
# Convert an integer from decimal to binary
# Created by Du Duong on 12/7/2017
# All rights reserved.

.data
	inputAStr : .asciiz "n = "
	list: .word 250 # using as array of integers
.text
		
main:

	##############initArray##############

	li $t0, 0     #initialize a loop counter to $t0
	la $t1, list  #the address of array
	
	##############initArray##############
	
	#store number 2 to $t5 register
	li $t5, 2
	
	# Print n = text
	la $a0, inputAStr
	addi $v0, $zero, 4
	syscall
	
	#read n from keyboard
	addi $v0, $zero, 5
	syscall
	
	#store n to $t2 register
	add $t2, $v0, $zero
	
	#if input n = 0
	beqz $t2, zeroCase
	
	#finish Loop flag
	addi $t6, $zero, 0
	
	j Loop
	
zeroCase:
	addi $a0, $zero, 0
	addi $v0, $zero, 1
	syscall
	
	j Exit
	
Loop:
	#check if n == 0
	beqz $t2, setFinishFlag
	
	#get n % 2. store in $t3.
	div $t3, $t2, $t5
	mul $t3, $t3, $t5
	sub $t3, $t2, $t3
	
	#store value to array
	sw $t3, 0($t1)
	
	#increase array index
	addi $t1, $t1, 4
	addi $t0, $t0, 1 #array size
	
	#update n = n / 2
	div $t2, $t2, $t5
	
	#check finish Flag
	beqz $t6, Loop
	j printResult
	
setFinishFlag:
	addi $t6, $zero, 1
	
printResult:

	addi $t0, $t0, -1
	addi $t1, $t1, -4

	lw $t2, 0($t1)
	addi $a0, $t2, 0
	addi $v0, $zero, 1
	syscall
	
	#if $t0 > 1
	slti $t2, $t0, 1
	beq $t2, 1, Exit
	j printResult
	
Exit:
	addi $v0, $zero, 10
	syscall
	
