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
.global globalfoo
globalfoo:
    .xword 0x0

.text
.global tailrecursive
tailrecursive:
tailrecursive_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x4, sp, 96
str x11, [x4]
ldr x11, [x4]
cmp x11, 0
cset x11, le
cmp x11, 0
bne tailrecursive_lab0
b tailrecursive_lab1

tailrecursive_lab0:
b tailrecursive_returnLabel

tailrecursive_lab1:
b tailrecursive_lab2

tailrecursive_lab2:
ldr x11, [x4]
mov x4, 1
sub x11, x11, x4
mov x0, x11
bl tailrecursive
b tailrecursive_returnLabel

tailrecursive_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global add
add:
add_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
mov x4, x1
add x6, sp, 96
add x11, sp, 104
add x9, sp, 112
str x24, [x11]
str x4, [x9]
ldr x11, [x11]
ldr x4, [x9]
add x11, x11, x4
str x11, [x6]
b add_returnLabel

add_returnLabel:
ldr x11, [x6]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global domath
domath:
domath_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x22, sp, 96
add x25, sp, 104
add x24, sp, 112
add x27, sp, 120
str x11, [x22]
mov x0, 17
bl malloc
mov x11, x0
mov x11, x11
str x11, [x25]
ldr x4, [x25]
mov x11, 2
mov x6, 8
mul x11, x11, x6
add x23, x4, x11
mov x0, 8
bl malloc
mov x11, x0
mov x11, x11
str x11, [x23]
mov x0, 17
bl malloc
mov x11, x0
mov x11, x11
str x11, [x24]
ldr x11, [x24]
mov x6, 2
mov x4, 8
mul x4, x6, x4
add x23, x11, x4
mov x0, 8
bl malloc
mov x11, x0
mov x11, x11
str x11, [x23]
ldr x4, [x25]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x4, [x22]
str x4, [x11]
ldr x6, [x24]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
mov x4, 3
str x4, [x11]
ldr x6, [x25]
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x4, [x11]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x4, x4, x11
ldr x6, [x25]
mov x9, 0
mov x11, 8
mul x11, x9, x11
add x11, x6, x11
ldr x11, [x11]
str x11, [x4]
ldr x4, [x24]
mov x11, 2
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x6, [x11]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x6, x6, x11
ldr x4, [x24]
mov x11, 0
mov x9, 8
mul x11, x11, x9
add x11, x4, x11
ldr x11, [x11]
str x11, [x6]
ldr x11, [x22]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne domath_lab0
b domath_lab1

domath_lab0:
ldr x4, [x25]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x9, [x11]
ldr x4, [x24]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
mul x11, x9, x11
str x11, [x27]
ldr x11, [x27]
ldr x4, [x25]
mov x6, 2
mov x9, 8
mul x6, x6, x9
add x4, x4, x6
ldr x6, [x4]
mov x4, 0
mov x9, 8
mul x4, x4, x9
add x4, x6, x4
ldr x4, [x4]
mul x4, x11, x4
ldr x9, [x24]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x9, x11
ldr x11, [x11]
sdiv x11, x4, x11
str x11, [x27]
ldr x11, [x24]
mov x6, 2
mov x4, 8
mul x4, x6, x4
add x11, x11, x4
ldr x6, [x11]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x4, [x11]
ldr x6, [x25]
mov x9, 0
mov x11, 8
mul x11, x9, x11
add x11, x6, x11
ldr x11, [x11]
mov x0, x4
mov x1, x11
bl add
mov x11, x0
str x11, [x27]
ldr x4, [x24]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x9, [x11]
ldr x6, [x25]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x11, [x11]
sub x11, x9, x11
str x11, [x27]
ldr x11, [x22]
mov x4, 1
sub x11, x11, x4
str x11, [x22]
ldr x11, [x22]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne domath_lab0
b domath_lab1

domath_lab1:
ldr x4, [x25]
mov x6, 2
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
mov x11, x11
mov x0, x11
bl free
ldr x4, [x24]
mov x6, 2
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
mov x11, x11
mov x0, x11
bl free
ldr x11, [x25]
mov x11, x11
mov x0, x11
bl free
ldr x11, [x24]
mov x11, x11
mov x0, x11
bl free
b domath_returnLabel

domath_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global objinstantiation
objinstantiation:
objinstantiation_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x22, sp, 96
add x24, sp, 104
str x11, [x22]
ldr x11, [x22]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne objinstantiation_lab0
b objinstantiation_lab1

objinstantiation_lab0:
mov x0, 17
bl malloc
mov x11, x0
mov x11, x11
str x11, [x24]
ldr x11, [x24]
mov x11, x11
mov x0, x11
bl free
ldr x4, [x22]
mov x11, 1
sub x11, x4, x11
str x11, [x22]
ldr x11, [x22]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne objinstantiation_lab0
b objinstantiation_lab1

objinstantiation_lab1:
b objinstantiation_returnLabel

objinstantiation_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global ackermann
ackermann:
ackermann_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
mov x4, x1
add x22, sp, 96
add x11, sp, 104
add x6, sp, 112
str x24, [x11]
str x4, [x6]
ldr x4, [x11]
cmp x4, 0
cset x4, eq
cmp x4, 0
bne ackermann_lab0
b ackermann_lab1

ackermann_lab0:
ldr x11, [x6]
mov x4, 1
add x11, x11, x4
str x11, [x22]
b ackermann_returnLabel

ackermann_lab1:
b ackermann_lab2

ackermann_lab2:
ldr x4, [x6]
cmp x4, 0
cset x4, eq
cmp x4, 0
bne ackermann_lab3
b ackermann_lab4

ackermann_lab3:
ldr x11, [x11]
mov x4, 1
sub x11, x11, x4
mov x0, x11
mov x1, 1
bl ackermann
mov x11, x0
str x11, [x22]
b ackermann_returnLabel

ackermann_lab4:
ldr x24, [x11]
mov x4, 1
sub x25, x24, x4
ldr x24, [x11]
ldr x11, [x6]
mov x4, 1
sub x11, x11, x4
mov x0, x24
mov x1, x11
bl ackermann
mov x11, x0
mov x0, x25
mov x1, x11
bl ackermann
mov x11, x0
str x11, [x22]
b ackermann_returnLabel

ackermann_returnLabel:
ldr x11, [x22]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global main
main:
main_prologue:
stp x29, x30, [sp, -144]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x22, sp, 96
add x27, sp, 104
add x25, sp, 112
add x23, sp, 120
add x24, sp, 128
add x21, sp, 136
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x27]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x25]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x23]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x24]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x21]
ldr x11, [x27]
mov x0, x11
bl tailrecursive
ldr x11, [x27]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x25]
mov x0, x11
bl domath
ldr x11, [x25]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x23]
mov x0, x11
bl objinstantiation
ldr x11, [x23]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
ldr x4, [x21]
mov x0, x11
mov x1, x4
bl ackermann
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 0
str x11, [x22]
b main_returnLabel

main_returnLabel:
ldr x11, [x22]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 144
ret

