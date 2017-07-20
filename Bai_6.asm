# Bai_6.asm
# Calculate 1.3.5...(2n + 1)
# Created by Du Duong on 19/7/2017
# All rights reserved.

.data
	inputAStr : .asciiz "n = "
.text
		
main:
	#Print n = text
	la $a0, inputAStr
	addi $v0, $zero, 4
	syscall

	#read n from keyboard and store to $t1
	addi $v0, $zero, 5
	syscall
	add $t1, $v0, $zero
	
	#result = 1 store in $t0
	addi $t0, $zero, 1
	
	#k = 1 store in $t2
	addi $t2, $zero, 1
	
	#max = 2n + 1 store in $t5
	mul $t5, $t1, 2
	addi $t5, $t5, 1
	
Loop:
	#result *= k
	mul $t0, $t0, $t2
	
	#k += 2
	addi $t2, $t2, 2
	
	#if k > 2n + 1
	slt $t3, $t5, $t2
	beqz, $t3, Loop #if k <= 2n + 1
	
PrintResult:
	#print result
	addi $a0, $t0, 0
	addi $v0, $zero, 1
	syscall

Exit:
	addi $v0, $zero, 10
	syscall
	
