# CS 2640.01
# Team: Chenrui Zhang, Aaron lo,Brian Zeng
# April 16, 2023
# Objective: Program 2 Task 2 Advanced Math: X to the power of Y
# - main label
# - looping label
# - exit label

.data
xNum: .asciiz "Enter a number for 'x': " 
yNum: .asciiz "Enter a number for 'y': "
result: .asciiz "'x' to the power 'y' is: "

.text
main:
    #Print prompt for user to enter x
    li $v0, 4
    la $a0, xNum
    syscall
	
    #Receive user number for x
    li $v0, 5
    syscall
    #store x in $t0
    move $t0, $v0
	
    #Print prompt for user to enter y
    li $v0, 4
    la $a0, yNum
    syscall
	
    #Receive user number for y
    li $v0, 5
    syscall
    #store y in $t1
    move $t1, $v0
    
	
loop:
    #initialize
    li $t2, 1
    move $t3, $t0
    
loop_mult:
    #Add looping functionality here
    #loop repeats mult and exits
    #mult x by itself y times
    mul $t3, $t3, $t0
    
    #increment ctr
    addi $t2, $t2, 1
    
    #comp ctr with y 
    bne $t2, $t1, loop_mult
    
    #print
    li $v0, 4
    la $a0, result
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall

exit:
    li $v0, 10
    syscall
