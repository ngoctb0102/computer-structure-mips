.data
A: .word 4,1,5,2,6,3,8,9,7,10
.text
la $t0, A #store address A to t0
li $s1, 0 #i = 0
li $s2, 10 #n = 10 - arraysize
lw $t6, 0($t0) # t6 = A[0]
loop:
add $s1,$s1,1 #i = i+1
add $t1,$s1,$s1 
add $t1,$t1,$t1
add $t1,$t1,$t0
lw $t2,0($t1) #t2 = A[i]
slt $t3,$t6,$t2 # t6 < t2 
beq $t3,1,do
j enddo
do: add $t6,$0,$t2
enddo:
bne $s1,$s2,loop
