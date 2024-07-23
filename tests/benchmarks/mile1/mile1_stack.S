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
.global calcPower
calcPower:
calcPower_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x9, x0
mov x11, x1
add x4, sp, 96
add x24, sp, 104
add x22, sp, 112
add x6, sp, 120
str x9, [x24]
str x11, [x22]
mov x11, 1
str x11, [x6]
ldr x11, [x22]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne calcPower_lab0
b calcPower_lab1

calcPower_lab0:
ldr x11, [x6]
ldr x24, [x24]
mul x11, x11, x24
str x11, [x6]
ldr x11, [x22]
mov x24, 1
sub x11, x11, x24
str x11, [x22]
ldr x11, [x22]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne calcPower_lab0
b calcPower_lab1

calcPower_lab1:
ldr x11, [x6]
str x11, [x4]
b calcPower_returnLabel

calcPower_returnLabel:
ldr x11, [x4]
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

add x24, sp, 96
add x22, sp, 104
add x23, sp, 112
add x25, sp, 120
add x11, sp, 128
add x27, sp, 136
mov x11, 0
str x11, [x25]
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x22]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x23]
ldr x4, [x22]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x4, x4, x11
ldr x11, [x23]
str x11, [x4]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x23]
ldr x11, [x23]
cmp x11, 0
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab0:
mov x4, 0
mov x11, 1
sub x11, x4, x11
str x11, [x24]
b main_returnLabel

main_lab1:
b main_lab2

main_lab2:
ldr x6, [x22]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x4, [x23]
str x4, [x11]
mov x11, 0
str x11, [x27]
ldr x11, [x27]
cmp x11, 1000000
cset x11, lt
cmp x11, 0
bne main_lab3
b main_lab4

main_lab3:
ldr x4, [x27]
mov x11, 1
add x11, x4, x11
str x11, [x27]
ldr x6, [x22]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x9, [x11]
ldr x4, [x22]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
mov x0, x9
mov x1, x11
bl calcPower
mov x11, x0
str x11, [x25]
ldr x11, [x27]
cmp x11, 1000000
cset x11, lt
cmp x11, 0
bne main_lab3
b main_lab4

main_lab4:
ldr x11, [x25]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
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
ldp x29, x30, [sp], 144
ret

