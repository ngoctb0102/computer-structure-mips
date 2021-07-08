.data
m1: .asciiz "The multiplication  of "
m2: .asciiz " base 10 and "
m3: .asciiz " base 10 is "
m4: .asciiz " base 10"
.text
li $s0, 0xab12
li $s1, 0x100c
mul $s2,$s0,$s1
li $v0, 4
la $a0,m1
syscall
li $v0, 1
la $a0, ($s0)
syscall
li $v0, 4
la $a0, m2
syscall
li $v0, 1
la $a0, ($s1)
syscall
li $v0, 4
la $a0, m3
syscall
li $v0, 1
la $a0, ($s2)
syscall
li $v0, 4
la $a0, m4
syscall