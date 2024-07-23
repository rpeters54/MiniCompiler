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
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x6, x1
cmp x11, 1
cset x4, eq
cmp x4, 0
bne move_lab0
b move_lab1

move_lab0:
ldr x24, =peg1
ldr x24, [x24]
ldr x9, =peg1
ldr x9, [x9]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x4, [x11]
ldr x11, =peg1
str x4, [x11]
mov x24, x24
mov x4, x6
b move_lab5

move_lab1:
cmp x11, 2
cset x11, eq
cmp x11, 0
bne move_lab2
b move_lab3

move_lab2:
ldr x9, =peg2
ldr x9, [x9]
ldr x24, =peg2
ldr x24, [x24]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x4, [x11]
ldr x11, =peg2
str x4, [x11]
mov x11, x9
b move_lab4

move_lab3:
ldr x4, =peg3
ldr x4, [x4]
ldr x24, =peg3
ldr x24, [x24]
mov x11, 1
mov x9, 8
mul x11, x11, x9
add x11, x24, x11
ldr x11, [x11]
ldr x24, =peg3
str x11, [x24]
mov x11, x4
b move_lab4

move_lab4:
mov x24, x11
mov x4, x6
b move_lab5

move_lab5:
cmp x4, 1
cset x11, eq
cmp x11, 0
bne move_lab6
b move_lab7

move_lab6:
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x4, =peg1
ldr x4, [x4]
str x4, [x11]
ldr x11, =peg1
str x24, [x11]
b move_returnLabel

move_lab7:
cmp x4, 2
cset x11, eq
cmp x11, 0
bne move_lab8
b move_lab9

move_lab8:
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x4, x24, x11
ldr x11, =peg2
ldr x11, [x11]
str x11, [x4]
ldr x11, =peg2
str x24, [x11]
b move_returnLabel

move_lab9:
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x4, x24, x11
ldr x11, =peg3
ldr x11, [x11]
str x11, [x4]
ldr x11, =peg3
str x24, [x11]
b move_returnLabel

move_returnLabel:
ldr x4, =numMoves
ldr x4, [x4]
mov x11, 1
add x11, x4, x11
ldr x4, =numMoves
str x11, [x4]
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global hanoi
hanoi:
hanoi_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x27, x0
mov x22, x1
mov x25, x2
mov x24, x3
cmp x27, 1
cset x11, eq
cmp x11, 0
bne hanoi_lab0
b hanoi_lab1

hanoi_lab0:
mov x0, x22
mov x1, x25
bl move
b hanoi_returnLabel

hanoi_lab1:
mov x11, 1
sub x11, x27, x11
mov x0, x11
mov x1, x22
mov x2, x24
mov x3, x25
bl hanoi
mov x0, x22
mov x1, x25
bl move
mov x11, 1
sub x11, x27, x11
mov x0, x11
mov x1, x24
mov x2, x25
mov x3, x22
bl hanoi
b hanoi_returnLabel

hanoi_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global printPeg
printPeg:
printPeg_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
cmp x4, null
cset x11, ne
cmp x11, 0
mov x24, x4
bne printPeg_lab0
b printPeg_returnLabel

inter_printPeg_lab0:
mov x24, x4
b printPeg_lab0

printPeg_lab0:
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x4, [x11]
cmp x4, null
cset x11, ne
cmp x11, 0
bne inter_printPeg_lab0
b printPeg_returnLabel

printPeg_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global main
main:
main_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, null
ldr x11, =peg1
str x4, [x11]
mov x4, null
ldr x11, =peg2
str x4, [x11]
mov x11, null
ldr x4, =peg3
str x11, [x4]
mov x11, 0
ldr x4, =numMoves
str x11, [x4]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x24, =read_scratch
ldr x24, [x24]
cmp x24, 1
cset x11, ge
cmp x11, 0
bne main_lab0
b main_returnLabel

main_lab0:
cmp x24, 0
cset x11, ne
cmp x11, 0
mov x22, x24
mov x25, x24
bne main_lab1
b main_lab2

inter_main_lab1:
mov x22, x4
b main_lab1

main_lab1:
mov x0, 16
bl malloc
mov x11, x0
mov x6, x11
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
str x22, [x11]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x4, x6, x11
ldr x11, =peg1
ldr x11, [x11]
str x11, [x4]
ldr x11, =peg1
str x6, [x11]
mov x11, 1
sub x4, x22, x11
cmp x4, 0
cset x11, ne
cmp x11, 0
mov x25, x24
bne inter_main_lab1
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
mov x0, x25
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
b main_returnLabel

main_lab3:
ldr x6, =peg3
ldr x6, [x6]
ldr x11, =peg3
ldr x11, [x11]
mov x24, 1
mov x4, 8
mul x4, x24, x4
add x11, x11, x4
ldr x11, [x11]
ldr x4, =peg3
str x11, [x4]
mov x11, x6
mov x0, x11
bl free
ldr x11, =peg3
ldr x11, [x11]
cmp x11, null
cset x11, ne
cmp x11, 0
bne main_lab3
b main_returnLabel

main_returnLabel:
mov x0, 0
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

