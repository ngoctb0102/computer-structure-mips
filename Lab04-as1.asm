#Laboratory Exercise 4, Sample Code 1 
.text 
  li $s1,1
  li $s2,4
start: 
  li   $t0,0     # No overflow is set as default status 
  addu  $s3,$s1,$s2       # s3 = s1 + s2 
  xor   $t1,$s1,$s2       # Check if $s1 and $s2 have the same                 
                              # sign?   
  bltz  $t1,EXIT    # If not, exit 
  slt   $t2,$s3,$s1  
  bltz  $s1,NEGATIVE  # Check if $s1 and $s2 is negative? 
  beq  $t2,$zero,EXIT  # s1 and $s2 are positive 
                        # If $s3 > $s1 then the result does not    
                        # overflow 
  j  OVERFLOW           
NEGATIVE:               
  bne  $t2,$zero,EXIT  # s1 and $s2 are negative 
                  # If $s3 < $s1 then the result  
                        # does not overflow   
OVERFLOW: 
  li  $t0,1     # The result overflows 
EXIT: 