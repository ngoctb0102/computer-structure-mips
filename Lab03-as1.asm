.data
i: .word 3
j: .word 4
.text 
#Laboratory Exercise 3, Sample Code 1 
la $t4, i
la $t5, j
lw $s2, 0($t5)
lw $s1, 0($t4)
li $s3, 1  #m = 1
li $s4, 2  #n = 2
add $t6,$t4,$t5 #t6 = i+j
add $s5,$s3,$s4 #s5 = m+n
start: 
  slt  $t0,$s5,$t6   # m+n < i+j ?
  bne  $t0,1,else  # …   
  addi  $t1,$t1,1    # …   
  addi  $t3,$zero,1   # … 
  j  endif     # … 
else: addi  $t2,$t2,-1    # … 
  add  $t3,$t3,$t3   # … 
endif:
