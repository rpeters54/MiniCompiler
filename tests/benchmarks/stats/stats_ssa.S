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

.text
.global getRands
getRands:
getRands_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x25, x0
mov x22, x1
mul x24, x25, x25
mov x0, 16
bl malloc
mov x11, x0
mov x6, x11
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
str x24, [x11]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
mov x4, null
str x4, [x11]
mov x11, 1
sub x4, x22, x11
cmp x4, 0
cset x11, gt
cmp x11, 0
mov x22, x6
mov x27, x4
mov x11, x24
mov x6, null
bne getRands_lab0
b getRands_returnLabel

inter_getRands_lab0:
mov x22, x4
mov x27, x24
mov x11, x23
b getRands_lab0

getRands_lab0:
mul x11, x11, x11
sdiv x11, x11, x25
mov x4, 2
sdiv x4, x25, x4
mul x11, x11, x4
mov x4, 1
add x24, x11, x4
mov x11, 1000000000
sdiv x11, x24, x11
mov x4, 1000000000
mul x11, x11, x4
sub x23, x24, x11
mov x0, 16
bl malloc
mov x11, x0
mov x4, x11
mov x24, 0
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
str x23, [x11]
mov x24, 1
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
str x22, [x11]
mov x11, 1
sub x24, x27, x11
cmp x24, 0
cset x11, gt
cmp x11, 0
mov x6, x4
bne inter_getRands_lab0
b getRands_returnLabel

getRands_returnLabel:
mov x0, x6
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global calcMean
calcMean:
calcMean_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
cmp x11, null
cset x4, ne
cmp x4, 0
mov x24, 0
mov x9, 0
mov x4, x11
mov x11, 0
mov x22, 0
mov x6, 0
bne calcMean_lab0
b calcMean_lab1

inter_calcMean_lab0:
mov x24, x24
mov x9, x9
mov x4, x4
b calcMean_lab0

calcMean_lab0:
mov x11, 1
add x24, x24, x11
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
add x9, x9, x11
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x4, [x11]
cmp x4, null
cset x11, ne
cmp x11, 0
mov x11, 0
mov x22, x24
mov x6, x9
bne inter_calcMean_lab0
b calcMean_lab1

calcMean_lab1:
cmp x22, 0
cset x4, ne
cmp x4, 0
mov x11, x11
bne calcMean_lab2
b calcMean_returnLabel

calcMean_lab2:
sdiv x11, x6, x22
mov x11, x11
b calcMean_returnLabel

calcMean_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global approxSqrt
approxSqrt:
approxSqrt_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x6, x0
mov x11, 0
cmp x11, x6
cset x11, lt
cmp x11, 0
mov x4, 1
mov x11, 1
bne approxSqrt_lab0
b approxSqrt_returnLabel

inter_approxSqrt_lab0:
mov x4, x24
b approxSqrt_lab0

approxSqrt_lab0:
mul x11, x4, x4
mov x24, 1
add x24, x4, x24
cmp x11, x6
cset x11, lt
cmp x11, 0
mov x11, x4
bne inter_approxSqrt_lab0
b approxSqrt_returnLabel

approxSqrt_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global approxSqrtAll
approxSqrtAll:
approxSqrtAll_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
cmp x11, null
cset x4, ne
cmp x4, 0
mov x24, x11
bne approxSqrtAll_lab0
b approxSqrtAll_returnLabel

inter_approxSqrtAll_lab0:
mov x24, x4
b approxSqrtAll_lab0

approxSqrtAll_lab0:
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
bl approxSqrt
mov x11, x0
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
bne inter_approxSqrtAll_lab0
b approxSqrtAll_returnLabel

approxSqrtAll_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global range
range:
range_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
cmp x11, null
cset x4, ne
cmp x4, 0
mov x24, 0
mov x6, 0
mov x4, x11
mov x22, 1
mov x11, 0
mov x25, 0
bne range_lab0
b range_returnLabel

inter_range_lab0:
mov x24, x9
mov x6, x6
mov x4, x4
mov x22, x22
b range_lab0

range_lab0:
cmp x22, 0
bne range_lab1
b range_lab2

range_lab1:
mov x24, 0
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x6, [x11]
mov x24, 0
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
mov x9, x6
mov x6, x11
mov x4, x4
mov x22, 0
b range_lab9

range_lab2:
mov x9, 0
mov x11, 8
mul x11, x9, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, x24
cset x11, lt
cmp x11, 0
bne range_lab3
b range_lab4

range_lab3:
mov x24, 0
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
mov x11, x11
mov x24, x6
mov x4, x4
b range_lab8

range_lab4:
mov x9, 0
mov x11, 8
mul x11, x9, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, x6
cset x11, gt
cmp x11, 0
mov x6, x6
mov x9, x4
bne range_lab5
b range_lab7

range_lab5:
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x11, [x11]
mov x6, x11
mov x9, x4
b range_lab7

range_lab7:
mov x11, x24
mov x24, x6
mov x4, x9
b range_lab8

range_lab8:
mov x9, x11
mov x6, x24
mov x4, x4
mov x22, x22
b range_lab9

range_lab9:
mov x24, 1
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x4, [x11]
cmp x4, null
cset x11, ne
cmp x11, 0
mov x11, x9
mov x25, x6
bne inter_range_lab0
b range_returnLabel

range_returnLabel:
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, x25
bl printf
mov x11, x0
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
ldr x11, =read_scratch
ldr x11, [x11]
mov x0, x24
mov x1, x11
bl getRands
mov x24, x0
mov x0, x24
bl calcMean
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x0, x24
bl range
mov x0, x24
bl approxSqrtAll
mov x0, 0
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

