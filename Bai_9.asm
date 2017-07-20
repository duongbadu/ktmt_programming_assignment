# Bai_9.asm
# Calculate 1^2 + 2^2 + ... + n^2
# Created by Du Duong on 19/7/2017
# All rights reserved.

.data
	inputAStr : .asciiz "n = "
.text
		
main:

	# sum = 0 store in $t0
	addi $t0, $zero, 0
	
	# current square (1^2) = 1 store in $t2
	addi $t2, $zero, 1
	
	# k = 1 store in $t4. K will loop from 1 to n
	addi $t4, $zero, 1
	
	# Print n = text
	la $a0, inputAStr
	addi $v0, $zero, 4
	syscall

	# read n from keyboard and store in $t1
	addi $v0, $zero, 5
	syscall
	add $t1, $v0, $zero
	
Loop:

	# sum += currentSquare
	add $t0, $t0, $t2
	
	# k += 1
	addi $t4, $t4, 1
	
	# if n < k
	slt $t5, $t1, $t4
	beq, $t5, 1, PrintResult
	
	# currentSquare = k^2
	mul $t2, $t4, $t4

	j Loop
	
PrintResult:

	# print result
	addi $a0, $t0, 0
	addi $v0, $zero, 1
	syscall

Exit:
	addi $v0, $zero, 10
	syscall
	
