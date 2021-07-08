.data
a : .word 23, 55, 4, 55, 51, 53, 11, 20, 70, 39, 76, 79, 22, 18, 2, 51, 34, 95, 75, 41
d : .asciiz "  "
.text
la $a3,d
la $a0, a #a0 = A
li $t0, 20 #n = 20
li $t1, 1 #i = 1
loop:
slt $s0,$t0,$t1 # n < i ?
beq $s0,1,endloop
add $t2,$t1,0 #d = i
while:
slt $s0,$zero,$t2 #0 < d ?
beq $s0,0,loop_con
add $t3, $t2, $t2
add $t3, $t3, $t3
add $t4, $t3, $a0
lw $t5,0($t4) #A[d]
addi $t6, $t2, -1
add $t7,$t6,$t6
add $t7,$t7,$t7
add $t8, $t7, $a0
lw $t9,0($t8) #A[d-1]
slt $s0,$t5,$t9 # A[d] < A[d-1] -> swap
beq $s0,0,while_con
swap: 
sw $t9,0($t4)
sw $t5,0($t8)
while_con:
addi $t2,$t2,-1
j while
loop_con:
addi $t1,$t1,1 #i = i+1
j loop
endloop: 

print_array:
la $a1, a #a1 = A
li $t0, 20 #n = 20
li $t1, 0 #i = 0
loop_a:
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
beq $t2,1,loop_a
endloop_a:
end: 



