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
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
mov x11, x1
cmp x11, 0
cset x4, gt
cmp x4, 0
mov x4, 1
mov x6, x11
mov x11, 1
bne calcPower_lab0
b calcPower_returnLabel

inter_calcPower_lab0:
mov x4, x4
mov x6, x6
b calcPower_lab0

calcPower_lab0:
mul x4, x4, x24
mov x11, 1
sub x6, x6, x11
cmp x6, 0
cset x11, gt
cmp x11, 0
mov x11, x4
bne inter_calcPower_lab0
b calcPower_returnLabel

calcPower_returnLabel:
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

mov x0, 16
bl malloc
mov x11, x0
mov x24, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x4, =read_scratch
ldr x4, [x4]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x24, x11
str x4, [x11]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x4, =read_scratch
ldr x4, [x4]
cmp x4, 0
cset x11, lt
cmp x11, 0
mov x11, -1
bne main_returnLabel
b main_lab2

main_lab2:
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x11, x24, x11
str x4, [x11]
mov x11, 1
cmp x11, 0
mov x4, 0
mov x11, 0
bne main_lab3
b main_lab4

inter_main_lab3:
mov x4, x22
b main_lab3

main_lab3:
mov x11, 1
add x22, x4, x11
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x6, [x11]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x0, x6
mov x1, x11
bl calcPower
mov x11, x0
cmp x22, 1000000
cset x4, lt
cmp x4, 0
mov x11, x11
bne inter_main_lab3
b main_lab4

main_lab4:
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 0
b main_returnLabel

main_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

