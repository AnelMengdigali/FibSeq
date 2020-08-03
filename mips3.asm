.data

Arr: .word 21 20 51 83 20 20
x: .word 20
y: .word 5
length: .word 6
index: .word 0

msgl: .asciiz "Arr = "
space: .asciiz " "
nl: .asciiz "\n"

.text

main:

	la $a0, Arr
	lw $a1, length
	lw $a2, x
	lw $a3, y
	
	jal funcPrintArrInt 
	move $a0, $t0
	jal funcReplace 
	move $a0, $s0
	jal funcPrintArrInt 
	move $a0, $t0

	li $v0, 10
	syscall 
	
	funcReplace:
	
		move $s0, $a0
		move $t1, $a1
		move $t2, $a2
		move $t3, $a3
		add $t4, $zero, $zero
		
		addi $sp, $sp, -4 
		sw $s0, 0($sp) 
		
		Loop1:
		          
		        slt $t5, $t4, $t1
			bne $t5, 1, Exit1
			lw $t6, 0($s0)
			beq $t6, $t2, If
				
			addi $t4, $t4, 1			
			addi $s0, $s0, 4
			
			j Loop1 
		
		If:
			sw $t3, 0($s0)

			addi $t4, $t4, 1
			addi $s0, $s0, 4
			
			j Loop1
			
		Exit1: 
			lw $s0, 0($sp)
			addi $sp, $sp, 4
			jr $ra
	
	funcPrintArrInt:
	
	move $t0, $a0
	move $t1, $a1
	add $t4, $zero, $zero
	
	li $v0, 4
	la $a0, msgl
	syscall
	
		Loop2:
	
			slt $t2, $t4, $t1
			bne $t2, 1, Exit2

			lw $t3, 0($t0)
		
			li $v0, 1
			move $a0, $t3
			syscall
		
			li $v0, 4
			la $a0, space
			syscall 
		
			addi $t4, $t4, 1
			addi $t0, $t0, 4
		
			j Loop2
		
		Exit2: 
			mul $t7, $t4, 4
			sub $t0, $t0, $t7
			
			li $v0, 4
			la $a0, nl
			syscall
			
			jr $ra
			
		
			
			
			
					
	
	
	
	