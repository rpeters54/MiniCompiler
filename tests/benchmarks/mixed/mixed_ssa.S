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
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
cmp x4, 0
cset x11, le
cmp x11, 0
bne tailrecursive_returnLabel
b tailrecursive_lab2

tailrecursive_lab2:
mov x11, 1
sub x11, x4, x11
mov x0, x11
bl tailrecursive
b tailrecursive_returnLabel

tailrecursive_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global add
add:
add_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x4, x1
add x11, x11, x4
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global domath
domath:
domath_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x25, x0
mov x0, 17
bl malloc
mov x11, x0
mov x22, x11
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x24, x22, x11
mov x0, 8
bl malloc
mov x11, x0
mov x11, x11
str x11, [x24]
mov x0, 17
bl malloc
mov x11, x0
mov x24, x11
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x27, x24, x11
mov x0, 8
bl malloc
mov x11, x0
mov x11, x11
str x11, [x27]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
str x25, [x11]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x4, x24, x11
mov x11, 3
str x11, [x4]
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
ldr x4, [x11]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x4, x4, x11
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x22, x11
ldr x11, [x11]
str x11, [x4]
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x4, 0
mov x6, 8
mul x4, x4, x6
add x6, x11, x4
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
str x11, [x6]
cmp x25, 0
cset x11, gt
cmp x11, 0
mov x25, x25
mov x23, x22
mov x27, x24
bne domath_lab0
b domath_returnLabel

inter_domath_lab0:
mov x25, x11
b domath_lab0

domath_lab0:
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
ldr x6, [x11]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x4, [x11]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x4, [x11]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x22, x11
ldr x11, [x11]
mov x0, x4
mov x1, x11
bl add
mov x11, x0
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
mov x11, 1
sub x11, x25, x11
cmp x11, 0
cset x4, gt
cmp x4, 0
mov x23, x22
mov x27, x24
bne inter_domath_lab0
b domath_returnLabel

domath_returnLabel:
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x23, x11
ldr x11, [x11]
mov x11, x11
mov x0, x11
bl free
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x27, x11
ldr x11, [x11]
mov x11, x11
mov x0, x11
bl free
mov x11, x23
mov x0, x11
bl free
mov x11, x27
mov x0, x11
bl free
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global objinstantiation
objinstantiation:
objinstantiation_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
cmp x11, 0
cset x4, gt
cmp x4, 0
mov x24, x11
bne objinstantiation_lab0
b objinstantiation_returnLabel

inter_objinstantiation_lab0:
mov x24, x4
b objinstantiation_lab0

objinstantiation_lab0:
mov x0, 17
bl malloc
mov x11, x0
mov x11, x11
mov x11, x11
mov x0, x11
bl free
mov x11, 1
sub x4, x24, x11
cmp x4, 0
cset x11, gt
cmp x11, 0
bne inter_objinstantiation_lab0
b objinstantiation_returnLabel

objinstantiation_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global ackermann
ackermann:
ackermann_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x6, x0
mov x4, x1
cmp x6, 0
cset x11, eq
cmp x11, 0
bne ackermann_lab0
b ackermann_lab2

ackermann_lab0:
mov x11, 1
add x11, x4, x11
mov x11, x11
b ackermann_returnLabel

ackermann_lab2:
cmp x4, 0
cset x11, eq
cmp x11, 0
bne ackermann_lab3
b ackermann_lab4

ackermann_lab3:
mov x11, 1
sub x11, x6, x11
mov x0, x11
mov x1, 1
bl ackermann
mov x11, x0
mov x11, x11
b ackermann_returnLabel

ackermann_lab4:
mov x11, 1
sub x24, x6, x11
mov x11, 1
sub x11, x4, x11
mov x0, x6
mov x1, x11
bl ackermann
mov x11, x0
mov x0, x24
mov x1, x11
bl ackermann
mov x11, x0
mov x11, x11
b ackermann_returnLabel

ackermann_returnLabel:
mov x0, x11
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

ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x24, =read_scratch
ldr x24, [x24]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x25, =read_scratch
ldr x25, [x25]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x23, =read_scratch
ldr x23, [x23]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x22, =read_scratch
ldr x22, [x22]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x27, =read_scratch
ldr x27, [x27]
mov x0, x24
bl tailrecursive
ldr x0, =println
mov x1, x24
bl printf
mov x11, x0
mov x0, x25
bl domath
ldr x0, =println
mov x1, x25
bl printf
mov x11, x0
mov x0, x23
bl objinstantiation
ldr x0, =println
mov x1, x23
bl printf
mov x11, x0
mov x0, x22
mov x1, x27
bl ackermann
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x0, 0
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

