.data
.global println
println:
    .asciz "%ld\n"
.global print
print:
    .asciz "%ld"
.global read
read:
    .asciz "%d"
.global read_scratch
read_scratch:
    .xword 0x0
.global peg1
peg1:
    .xword 0x0
.global peg2
peg2:
    .xword 0x0
.global peg3
peg3:
    .xword 0x0
.global numMoves
numMoves:
    .xword 0x0

.text
.global move
move:
move_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
mov x11, x1
add x6, sp, 96
add x9, sp, 104
add x24, sp, 112
str x4, [x6]
str x11, [x9]
ldr x11, [x6]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne move_lab0
b move_lab1

move_lab0:
ldr x11, =peg1
ldr x11, [x11]
str x11, [x24]
ldr x11, =peg1
ldr x11, [x11]
mov x4, 1
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x4, [x11]
ldr x11, =peg1
str x4, [x11]
b move_lab5

move_lab1:
ldr x11, [x6]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne move_lab2
b move_lab3

move_lab2:
ldr x11, =peg2
ldr x11, [x11]
str x11, [x24]
ldr x11, =peg2
ldr x11, [x11]
mov x4, 1
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x11, [x11]
ldr x4, =peg2
str x11, [x4]
b move_lab4

move_lab3:
ldr x11, =peg3
ldr x11, [x11]
str x11, [x24]
ldr x6, =peg3
ldr x6, [x6]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x4, [x11]
ldr x11, =peg3
str x4, [x11]
b move_lab4

move_lab4:
b move_lab5

move_lab5:
ldr x11, [x9]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne move_lab6
b move_lab7

move_lab6:
ldr x6, [x24]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x4, =peg1
ldr x4, [x4]
str x4, [x11]
ldr x4, [x24]
ldr x11, =peg1
str x4, [x11]
b move_lab11

move_lab7:
ldr x11, [x9]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne move_lab8
b move_lab9

move_lab8:
ldr x11, [x24]
mov x4, 1
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x4, =peg2
ldr x4, [x4]
str x4, [x11]
ldr x4, [x24]
ldr x11, =peg2
str x4, [x11]
b move_lab10

move_lab9:
ldr x4, [x24]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x4, x4, x11
ldr x11, =peg3
ldr x11, [x11]
str x11, [x4]
ldr x11, [x24]
ldr x4, =peg3
str x11, [x4]
b move_lab10

move_lab10:
b move_lab11

move_lab11:
ldr x4, =numMoves
ldr x4, [x4]
mov x11, 1
add x4, x4, x11
ldr x11, =numMoves
str x4, [x11]
b move_returnLabel

move_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global hanoi
hanoi:
hanoi_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
mov x11, x1
mov x9, x2
mov x6, x3
add x25, sp, 96
add x24, sp, 104
add x22, sp, 112
add x27, sp, 120
str x4, [x25]
str x11, [x24]
str x9, [x22]
str x6, [x27]
ldr x11, [x25]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne hanoi_lab0
b hanoi_lab1

hanoi_lab0:
ldr x11, [x24]
ldr x4, [x22]
mov x0, x11
mov x1, x4
bl move
b hanoi_lab2

hanoi_lab1:
ldr x4, [x25]
mov x11, 1
sub x11, x4, x11
ldr x4, [x24]
ldr x6, [x27]
ldr x9, [x22]
mov x0, x11
mov x1, x4
mov x2, x6
mov x3, x9
bl hanoi
ldr x11, [x24]
ldr x4, [x22]
mov x0, x11
mov x1, x4
bl move
ldr x4, [x25]
mov x11, 1
sub x6, x4, x11
ldr x11, [x27]
ldr x4, [x22]
ldr x24, [x24]
mov x0, x6
mov x1, x11
mov x2, x4
mov x3, x24
bl hanoi
b hanoi_lab2

hanoi_lab2:
b hanoi_returnLabel

hanoi_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global printPeg
printPeg:
printPeg_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
add x11, sp, 96
add x24, sp, 104
str x4, [x11]
ldr x11, [x11]
str x11, [x24]
ldr x11, [x24]
cmp x11, null
cset x11, ne
cmp x11, 0
bne printPeg_lab0
b printPeg_lab1

printPeg_lab0:
ldr x4, [x24]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x6, 1
mov x4, 8
mul x4, x6, x4
add x11, x11, x4
ldr x11, [x11]
str x11, [x24]
ldr x11, [x24]
cmp x11, null
cset x11, ne
cmp x11, 0
bne printPeg_lab0
b printPeg_lab1

printPeg_lab1:
b printPeg_returnLabel

printPeg_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global main
main:
main_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x24, sp, 96
add x27, sp, 104
add x25, sp, 112
add x22, sp, 120
mov x4, null
ldr x11, =peg1
str x4, [x11]
mov x11, null
ldr x4, =peg2
str x11, [x4]
mov x4, null
ldr x11, =peg3
str x4, [x11]
mov x11, 0
ldr x4, =numMoves
str x11, [x4]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x25]
ldr x11, [x25]
cmp x11, 1
cset x11, ge
cmp x11, 0
bne main_lab0
b main_lab5

main_lab0:
ldr x11, [x25]
str x11, [x27]
ldr x11, [x27]
cmp x11, 0
cset x11, ne
cmp x11, 0
bne main_lab1
b main_lab2

main_lab1:
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x22]
ldr x11, [x22]
mov x6, 0
mov x4, 8
mul x4, x6, x4
add x4, x11, x4
ldr x11, [x27]
str x11, [x4]
ldr x6, [x22]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x4, x6, x11
ldr x11, =peg1
ldr x11, [x11]
str x11, [x4]
ldr x11, [x22]
ldr x4, =peg1
str x11, [x4]
ldr x11, [x27]
mov x4, 1
sub x11, x11, x4
str x11, [x27]
ldr x11, [x27]
cmp x11, 0
cset x11, ne
cmp x11, 0
bne main_lab1
b main_lab2

main_lab2:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
ldr x11, =peg1
ldr x11, [x11]
mov x0, x11
bl printPeg
ldr x0, =println
mov x1, 2
bl printf
mov x11, x0
ldr x11, =peg2
ldr x11, [x11]
mov x0, x11
bl printPeg
ldr x0, =println
mov x1, 3
bl printf
mov x11, x0
ldr x11, =peg3
ldr x11, [x11]
mov x0, x11
bl printPeg
ldr x11, [x25]
mov x0, x11
mov x1, 1
mov x2, 3
mov x3, 2
bl hanoi
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
ldr x11, =peg1
ldr x11, [x11]
mov x0, x11
bl printPeg
ldr x0, =println
mov x1, 2
bl printf
mov x11, x0
ldr x11, =peg2
ldr x11, [x11]
mov x0, x11
bl printPeg
ldr x0, =println
mov x1, 3
bl printf
mov x11, x0
ldr x11, =peg3
ldr x11, [x11]
mov x0, x11
bl printPeg
ldr x11, =numMoves
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, =peg3
ldr x11, [x11]
cmp x11, null
cset x11, ne
cmp x11, 0
bne main_lab3
b main_lab4

main_lab3:
ldr x11, =peg3
ldr x11, [x11]
str x11, [x22]
ldr x4, =peg3
ldr x4, [x4]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x4, [x11]
ldr x11, =peg3
str x4, [x11]
ldr x11, [x22]
mov x11, x11
mov x0, x11
bl free
ldr x11, =peg3
ldr x11, [x11]
cmp x11, null
cset x11, ne
cmp x11, 0
bne main_lab3
b main_lab4

main_lab4:
b main_lab6

main_lab5:
b main_lab6

main_lab6:
mov x11, 0
str x11, [x24]
b main_returnLabel

main_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

