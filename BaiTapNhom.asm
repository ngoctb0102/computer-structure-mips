# $f1 = y1; $f2 = y2; $f3 = xi; $f4 = xj; $f5 = xn = b;
# $f6 = b/n;
# $f10 = dien tich hinh dang tinh; $f11 dien tich can tinh; 
.data
Message1: .asciiz "nhap gia tri b: "
Message2: .asciiz "nhap gia tri n: "
Message3: .asciiz "Area = "
.text
# nhap b
li $v0, 52
la $a0, Message1
syscall #gia tri float nhap luu trong $f0
mov.s $f5, $f0 # b = f5 
# nhap n
la $a0, Message2
syscall #gia tri float nhap luu trong $f0
div.s $f6, $f5, $f0 # f6 = b/n ( do 0<=x<=b )

add.s $f4, $f4, $f6 # khoi tao xj = b/n ; con xi = 0.0
Loop1: 
#tinh y1
mul.s $f1, $f3, $f3 # y1 = xi^2
li $t1, 0x3f800000 # mang gia tri float = 1.0
mtc1 $t1, $f7 # f7 = 1.0
add.s $f1, $f1, $f7 # y1 = xi^2 + 1
li $t1, 0x40800000 # mang gia tri float 4.0
mtc1 $t1, $f7 # f7 = 4.0
div.s $f1, $f7, $f1 # y1 = 4/(xi^2 + 1)

#tinh y2
mul.s $f2, $f4, $f4 # y2 = xj^2
li $t1, 0x3f800000 # mang gia tri float = 1.0
mtc1 $t1, $f7 # f7 = 1.0
add.s $f2, $f2, $f7 # y2 = xj^2 + 1
li $t1, 0x40800000 # mang gia tri float 4.0
mtc1 $t1, $f7 # f7 = 4.0
div.s $f2, $f7, $f2 # y2 = 4/(xj^2 + 1)

#tinh dien tich hinh thang nho
add.s $f10, $f1, $f2 # s = y1+y2
mul.s $f10, $f10, $f6 # s = (y1+y2)*(b/n)
li $t1, 0x40000000 # mang gia tri float = 2.0
mtc1 $t1, $f7 # f7 = 2.0
div.s $f10, $f10, $f7 # s = (y1+y2)*(b/n)/2 dien tich hinh thang
add.s $f11, $f11, $f10 # S = S + s trong do S la tong dien tich
#tang gia tri xi, xj
add.s $f3, $f3, $f6 # xi = xi + b/n
add.s $f4, $f4, $f6 # xj = xj + b/n
#kiem tra gia tri xi, xj
c.le.s $f4, $f5 # if f4<=f5 (xj <= xn) -> code = 1 else code = 0
bc1t Loop1 # if code = 1 -> jump to Loop
c.lt.s $f3, $f5 # if f3<f5 ( xi < xn ) -> code = 1 else code = 0
bc1f exit
mov.s $f4, $f5 # gia tri cuoi xj = xn
j Loop1
# in ket qua
exit:
li $v0, 57
la $a0, Message3
mov.s $f12, $f11
syscall
