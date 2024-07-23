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
stp x29, x30, [sp, -160]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x4, x1
add x23, sp, 96
add x21, sp, 104
add x27, sp, 112
add x22, sp, 120
add x25, sp, 128
add x24, sp, 136
add x26, sp, 144
str x11, [x21]
str x4, [x27]
mov x11, null
str x11, [x24]
ldr x11, [x21]
ldr x4, [x21]
mul x11, x11, x4
str x11, [x22]
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x26]
ldr x11, [x26]
mov x6, 0
mov x4, 8
mul x4, x6, x4
add x11, x11, x4
ldr x4, [x22]
str x4, [x11]
ldr x4, [x26]
mov x11, 1
mov x6, 8
mul x11, x11, x6
add x4, x4, x11
mov x11, null
str x11, [x4]
ldr x11, [x27]
mov x4, 1
sub x11, x11, x4
str x11, [x27]
ldr x11, [x22]
str x11, [x25]
ldr x11, [x27]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne getRands_lab0
b getRands_lab1

getRands_lab0:
ldr x4, [x25]
ldr x11, [x25]
mul x4, x4, x11
ldr x11, [x21]
sdiv x11, x4, x11
ldr x4, [x21]
mov x6, 2
sdiv x4, x4, x6
mul x4, x11, x4
mov x11, 1
add x11, x4, x11
str x11, [x22]
ldr x11, [x22]
ldr x6, [x22]
mov x4, 1000000000
sdiv x4, x6, x4
mov x6, 1000000000
mul x4, x4, x6
sub x11, x11, x4
str x11, [x22]
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x24]
ldr x11, [x24]
mov x4, 0
mov x6, 8
mul x4, x4, x6
add x4, x11, x4
ldr x11, [x22]
str x11, [x4]
ldr x4, [x24]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x4, x4, x11
ldr x11, [x26]
str x11, [x4]
ldr x11, [x24]
str x11, [x26]
ldr x4, [x27]
mov x11, 1
sub x11, x4, x11
str x11, [x27]
ldr x11, [x22]
str x11, [x25]
ldr x11, [x27]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne getRands_lab0
b getRands_lab1

getRands_lab1:
ldr x11, [x24]
str x11, [x23]
b getRands_returnLabel

getRands_returnLabel:
ldr x11, [x23]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 160
ret

.global calcMean
calcMean:
calcMean_prologue:
stp x29, x30, [sp, -144]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x22, sp, 96
add x4, sp, 104
add x24, sp, 112
add x9, sp, 120
add x2, sp, 128
str x11, [x4]
mov x11, 0
str x11, [x24]
mov x11, 0
str x11, [x9]
mov x11, 0
str x11, [x2]
ldr x11, [x4]
cmp x11, null
cset x11, ne
cmp x11, 0
bne calcMean_lab0
b calcMean_lab1

calcMean_lab0:
ldr x6, [x9]
mov x11, 1
add x11, x6, x11
str x11, [x9]
ldr x6, [x24]
ldr x27, [x4]
mov x11, 0
mov x25, 8
mul x11, x11, x25
add x11, x27, x11
ldr x11, [x11]
add x11, x6, x11
str x11, [x24]
ldr x25, [x4]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x11, x25, x11
ldr x11, [x11]
str x11, [x4]
ldr x11, [x4]
cmp x11, null
cset x11, ne
cmp x11, 0
bne calcMean_lab0
b calcMean_lab1

calcMean_lab1:
ldr x11, [x9]
cmp x11, 0
cset x11, ne
cmp x11, 0
bne calcMean_lab2
b calcMean_lab3

calcMean_lab2:
ldr x11, [x24]
ldr x4, [x9]
sdiv x11, x11, x4
str x11, [x2]
b calcMean_lab4

calcMean_lab3:
b calcMean_lab4

calcMean_lab4:
ldr x11, [x2]
str x11, [x22]
b calcMean_returnLabel

calcMean_returnLabel:
ldr x11, [x22]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 144
ret

.global approxSqrt
approxSqrt:
approxSqrt_prologue:
stp x29, x30, [sp, -144]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x22, sp, 96
add x2, sp, 104
add x4, sp, 112
add x6, sp, 120
add x9, sp, 128
str x11, [x2]
mov x11, 1
str x11, [x4]
ldr x11, [x4]
str x11, [x9]
mov x11, 0
str x11, [x6]
ldr x24, [x6]
ldr x11, [x2]
cmp x24, x11
cset x11, lt
cmp x11, 0
bne approxSqrt_lab0
b approxSqrt_lab1

approxSqrt_lab0:
ldr x11, [x4]
ldr x24, [x4]
mul x11, x11, x24
str x11, [x6]
ldr x11, [x4]
str x11, [x9]
ldr x11, [x4]
mov x24, 1
add x11, x11, x24
str x11, [x4]
ldr x4, [x6]
ldr x11, [x2]
cmp x4, x11
cset x11, lt
cmp x11, 0
bne approxSqrt_lab0
b approxSqrt_lab1

approxSqrt_lab1:
ldr x11, [x9]
str x11, [x22]
b approxSqrt_returnLabel

approxSqrt_returnLabel:
ldr x11, [x22]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 144
ret

.global approxSqrtAll
approxSqrtAll:
approxSqrtAll_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
str x11, [x24]
ldr x11, [x24]
cmp x11, null
cset x11, ne
cmp x11, 0
bne approxSqrtAll_lab0
b approxSqrtAll_lab1

approxSqrtAll_lab0:
ldr x11, [x24]
mov x6, 0
mov x4, 8
mul x4, x6, x4
add x11, x11, x4
ldr x11, [x11]
mov x0, x11
bl approxSqrt
mov x11, x0
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
bne approxSqrtAll_lab0
b approxSqrtAll_lab1

approxSqrtAll_lab1:
b approxSqrtAll_returnLabel

approxSqrtAll_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global range
range:
range_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x4, sp, 96
add x9, sp, 104
add x24, sp, 112
add x22, sp, 120
str x11, [x4]
mov x11, 0
str x11, [x9]
mov x11, 0
str x11, [x24]
mov x11, 1
str x11, [x22]
ldr x11, [x4]
cmp x11, null
cset x11, ne
cmp x11, 0
bne range_lab0
b range_lab10

range_lab0:
ldr x11, [x22]
cmp x11, 0
bne range_lab1
b range_lab2

range_lab1:
ldr x11, [x4]
mov x2, 0
mov x6, 8
mul x6, x2, x6
add x11, x11, x6
ldr x11, [x11]
str x11, [x9]
ldr x2, [x4]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x2, x11
ldr x11, [x11]
str x11, [x24]
mov x11, 0
str x11, [x22]
b range_lab9

range_lab2:
ldr x22, [x4]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x22, x11
ldr x6, [x11]
ldr x11, [x9]
cmp x6, x11
cset x11, lt
cmp x11, 0
bne range_lab3
b range_lab4

range_lab3:
ldr x22, [x4]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x22, x11
ldr x11, [x11]
str x11, [x9]
b range_lab8

range_lab4:
ldr x22, [x4]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x22, x11
ldr x11, [x11]
ldr x6, [x24]
cmp x11, x6
cset x11, gt
cmp x11, 0
bne range_lab5
b range_lab6

range_lab5:
ldr x22, [x4]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x22, x11
ldr x11, [x11]
str x11, [x24]
b range_lab7

range_lab6:
b range_lab7

range_lab7:
b range_lab8

range_lab8:
b range_lab9

range_lab9:
ldr x22, [x4]
mov x11, 1
mov x6, 8
mul x11, x11, x6
add x11, x22, x11
ldr x11, [x11]
str x11, [x4]
ldr x11, [x4]
cmp x11, null
cset x11, ne
cmp x11, 0
bne range_lab0
b range_lab10

range_lab10:
ldr x11, [x9]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b range_returnLabel

range_returnLabel:
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
add x23, sp, 104
add x24, sp, 112
add x27, sp, 120
add x25, sp, 128
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
ldr x4, [x23]
ldr x11, [x24]
mov x0, x4
mov x1, x11
bl getRands
mov x11, x0
str x11, [x25]
ldr x11, [x25]
mov x0, x11
bl calcMean
mov x11, x0
str x11, [x27]
ldr x11, [x27]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x25]
mov x0, x11
bl range
ldr x11, [x25]
mov x0, x11
bl approxSqrtAll
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

