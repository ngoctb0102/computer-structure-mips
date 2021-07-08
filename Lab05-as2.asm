.data
mes1: .asciiz "The sum of "
mes2: .asciiz  " and "
mes3: .asciiz  " is "
.text
 li $s0, 3
 li $s1, 4
 add $s2,$s0,$s1 
 li $v0, 4
 la $a0, mes1
 syscall
 li $v0, 1
 la $a0, ($s0)
 syscall
 li $v0, 4
 la $a0, mes2
 syscall
 li $v0, 1
 la $a0, ($s1)
 syscall
 li $v0, 4
 la $a0, mes3
 syscall
 li $v0, 1
 la $a0,($s2)
 syscall