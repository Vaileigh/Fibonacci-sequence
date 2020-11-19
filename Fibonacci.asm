################################################################################

File        : Fibonacci.asm

Date        : Thursday 19th November 2020

Author      : VaileyXO

Description : A loop that generates the Fibonacci sequence to up to ten values.

################################################################################


.data # this .data section is where you can simulate stored data in random access memory 

	num1: .word 0	# The fibonacci begin with 0
	num2: .word 1	# The second number be 1
	
	# Label the number is Fibonacci in output
	string: .asciiz  "The Fibonacci numbers are:\n"
	# Give space between the number in output
	space : .asciiz  " ,"
	
.text #this section is where you write your main script
	
	main:
		# declare all the variables
		addi $t0, $zero, 10	# Define there is 10 values used in Fibonacci sequence
		lw $t1, num1   		# Define the Fibonacci sequence start with 0 as 1st value
		lw $t2, num2 		# Define the Fibonacci sequence start with 1 as 2nd value
		li $t3, 0 		# Define an empty variable to store every next number
		add $t4, $zero, $zero	# Define $t4 as counter with value of 0
		
		# Print the Header (Not necessary but neatly)
		la $a0, string		# Assign the string to $a0
 		li $v0, 4		# Load the address to print string by using '4' as specific print service
		syscall			# Print the string "The Fibonacci numbers are:"
		
		# Print the 1st value declared in beginning
 		addi $a0, $t1, 0	# Add the num1 into $a0 ( 0 + 0 = 0)
 		li $v0, 1		# Load the address to print integer by using '1'
		syscall			# Print the 1st value = 0
		la $a0, space		# Assign the space to $a0
		li $v0, 4		# Load the address to print string by using '4' as specific print service
		syscall			# Print the string " ,"
		addi $t4, $t4, 1	# Add 1 to the counter ( $t4+1 ; $t = 1)
		
		# 2nd value
 		addi $a0, $t2, 0	# Add the num2 into $a0 ( 1 + 0 = 0)
 		li $v0, 1		# Load the address to print integer by using '1'
		syscall			# Print the 2nd value = 1
		addi $t4, $t4, 1	# Add 1 to the counter ( $t4= 1+1 ; $t4 = 2)
		
		# For loop for other values
		# $t0 = 10; $t1 = 0; $t2 = 1; $t3 = 0; $t4 = 2
	for:	beq $t4, $t0, done	# Conditional branch to check if $t4 == $t0, if not continue the loop; else break;
		la $a0, space		# Assign the space to $a0 
		li $v0, 4		# Load the address to print string by using '4' as specific print service
		syscall			# Print the string " ,"
		add $t3, $t1, $t2	# Get the next number by add $t1 and $t2 into $t3 Eg:(First loop) $t3 = 0 + 1 = 1
		addi $a0, $t3, 0	# Add the next number ($t3) into $a0
 		li $v0, 1		# Load the address to print integer by using '1'
		syscall			# Print the next value  Eg: (First loop) print : 1
		add $t1, $zero, $t2	# Assign the previous number into $t1 Eg: (First loop) $t1 = 1
		add $t2, $zero, $t3	# Assign the previous next number into $t2 Eg: (First loop) $t2 = 1
		addi $t4, $t4, 1	# Add 1 to the counter ( $t4++)
		j for			#  Unconditional branch jump to beginning of the for
	done:
		
		
		#terminate program 
		li $v0 10     #### THIS IS A GOOD WAY TO END THE PROGRAM BY PUTTING THE VALUE 10 INTO $v0 AND USING SYSCALL
		syscall
