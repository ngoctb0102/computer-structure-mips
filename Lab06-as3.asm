.data
a : .word 23, 55, 4, 55, 51, 53, 11, 20, 70, 39, 76, 79, 22, 18, 2, 51, 34, 95, 75, 41, 110, 32
d : .asciiz "  "
.text
la $a3,d
la $a0, a #a0 = A
li $t0, 22 #n = 20
li $t1, 0 #i = 0
addi $t2, $t1,1 #i+1
run:
beq $t0, 0,endrun
add $t3,$t1,$t1
add $t3,$t3,$t3 #t3 = 4i
add $t4,$t2,$t2
add $t4,$t4,$t4 #t4= 4(i+1)
add $t5,$t3,$a0 #t5 address A[i]
add $t6,$t4,$a0 #t6 address A[i+1]
lw $t7,0($t5) #t7 = A[i]
lw $t8,0($t6) #t8 = A[i+1]
slt $t9,$t8,$t7 #t8 < t7 -> 1 -> swap, 0->next
beq $t9,1,swap
next: 
beq $t2,$t0,next_loop
addi $t1,$t1,1 #i = i+1
addi $t2,$t1,1 #i+1
j run
next_loop:
addi $t0,$t0,-1
li $t1,0
addi $t2,$t1,1
j run
swap: 
sw $t7,0($t6)
sw $t8,0($t5)
j next
endrun :
print_array:
la $a1, a #a1 = A
li $t0, 22 #n = 20
li $t1, 0 #i = 0
loop:
add $t3,$t1,$t1
add $t3,$t3,$t3 #t3 = 4i
add $t5,$t3,$a1 #t5 address A[i]
lw $t7,0($t5) #t7 = A[i]
li $v0,1
la $a0,($t7)
syscall
li $v0,4
la $a0,($a3)
syscall
addi $t1,$t1,1
slt $t2,$t1,$t0
beq $t2,1,loop
endloop:
end: 




