.data
 Arr: .word 21 5 51 83 5 5
 x: .word 5
 y: .word 20
 length: .word 6
 index: .word 0
 
 msgl: .asciiz "Arr = "
 space: .asciiz " "
 
 .text
 
 main:
 
 	la $s0, Arr
 	lw $s1, x
 	lw $s2, y
 	lw $s3, index
 	lw $s4, length
 
        li $v0, 4
 	la $a0, msgl
 	syscall
 		
 	Loop:
 		slt $t3, $s3, $s4
 		bne $t3, 1, Exit
 		sll $t0, $s3, 2
 		add $t0, $t0, $s0
 		lw $t1, 0($t0)
 		beq $t1, $s1, If
 		
 		li $v0, 1
 		move $a0, $t1
 		syscall
 		
 		li $v0, 4
 		la $a0, space
 		syscall
 		
 		addi $s3, $s3, 1
 		j Loop
 		
 	If:
 		sw $s2, 0($t0)
 		lw $t1, 0($t0)

 		li $v0, 1
 		move $a0, $t1
 		syscall
 		
 		li $v0, 4
 		la $a0, space
 		syscall
 		
 		addi $s3, $s3, 1
 		j Loop
 		
 	Exit:
 	        li $v0, 10
 		
 		
    
 
 
