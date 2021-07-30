#Leonardo Numbers by Logan with help from geeksforgeeks and stackoverflow

.data

leoNumber: .asciiz "Please give a non-negative integer:  "
userError: .asciiz " your input was negative and it caused an Error, Try again"
comma:	 .asciiz	", "

	.text

main: 
	li	$v0, 4			# helping printing a string
	la	$a0, leoNumber		# declaring we are printing leoNumber
	syscall				# printing the string leoNumber
	
	li	$v0, 5			# helping to read an integer from the user
	syscall				# taking user input of integer 	
		
	move	$s0, $v0		# storing that integer into $s0
	
	slti	$t6, $s0, 0		# checks if the user input is less than -1
	bne	$t6, 0, inputError	# checking if $t6 is not 0 
	li	$t7, 2			# storing 2 into $t7 for our loop
	li	$v0, 1			# helping prepare to print an integer 
	la	$a0, 1			# declaring what we are about to print
	syscall				# prints 1 
	
	slti	$t8, $s0, 1		# if user input is less than 1 set $t8 to 1
	beq	$t8, 1, endLeo		# exiting to endLeo if 0 cause we printed results
	li	$v0, 4			# preparing to pring a string
	la	$a0, comma		# declaring we are printing a comma space
	syscall				# printing
	
	li	$v0, 1			# preparing to print 
	la	$a0, 1			# delcaring we are printing 1
	syscall				# prints $v0 which is one
	
	li	$t0, 1			# putting 1 into $t0
	li	$t1, 1			# putting 1 into $t1
	bgt	$s0, 0, leoLoop		# enter loop if greater than zero
	
inputError:
	li	$v0, 4			# helping printing a string
	la	$a0, userError		# declaring we are printing inputError
	syscall				# printing
	
leoLoop:
	slt	$t2, $s0, $t7		# checking to see if $s0 is less than $t7 to check if need to exit
	beq	$t2, 1, endLeo		# if $t2 is equal to 1 move to the endLeo
	add	$t3, $t0, $t1		# adding $t0, $t1 and storing into $t3
	addi	$t3, $t3, 1		# add 1 to complete the leonardo number
	li	$v0, 4			# preparing to pring a string
	la	$a0, comma		# declaring we are printing a comma space
	syscall				# printing
	
	li	$v0, 1			# preparing to pring an integer
	move	$a0, $t3		# declaring we are printing a comma space
	syscall				# printing
	
	move	$t0, $t1		# move t1 into t0 so we can repeat
	move	$t1, $t3		# move t3 into t1 so we can repeat
	
	addi	$t7, $t7, 1		# increment by one to $t1 
	
	j	leoLoop			# jumping to loop
	
endLeo:
	li $v0, 10			# preparing to end
	syscall				# ending

