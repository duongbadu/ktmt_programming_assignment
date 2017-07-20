# Bai_4.asm
# Calculate the greatest common factor of two integer a and b
# Created by Du Duong on 17/7/2017
# All rights reserved.

.data
	inputAStr : .asciiz "a = "
	inputBStr : .asciiz "b = "
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
	
	#Print b = text
	la $a0, inputBStr
	addi $v0, $zero, 4
	syscall
	
	#read b from keyboard and store to $t2
	addi $v0, $zero, 5
	syscall
	add $t2, $v0, $zero
	
Loop:
	#if a != b
	sne $t3, $t1, $t2
	beqz $t3, PrintResult #if a == b
	
	slt $t3, $t2, $t1 #if b < a
	beqz, $t3, SwapAB #if a < b then swap a and b value => a >= b in all case
	
	#a = a - b
	sub $t1, $t1, $t2
	
	j Loop
	
SwapAB:
	add $t5, $t1, $zero #temp = a
	add $t1, $t2, $zero #a = b
	add $t2, $t5, $zero #b = temp
	
	#a = a - b
	sub $t1, $t1, $t2
	
	#continue
	j Loop
	
PrintResult:
	#print a
	addi $a0, $t1, 0
	addi $v0, $zero, 1
	syscall

Exit:
	addi $v0, $zero, 10
	syscall
	
