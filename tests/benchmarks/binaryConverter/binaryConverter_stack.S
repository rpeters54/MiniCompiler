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
.global wait
wait:
wait_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
add x11, sp, 96
add x24, sp, 104
str x4, [x24]
ldr x4, [x24]
cmp x4, 0
cset x4, gt
cmp x4, 0
bne wait_lab0
b wait_lab1

wait_lab0:
ldr x4, [x24]
mov x6, 1
sub x4, x4, x6
str x4, [x24]
ldr x4, [x24]
cmp x4, 0
cset x4, gt
cmp x4, 0
bne wait_lab0
b wait_lab1

wait_lab1:
mov x4, 0
str x4, [x11]
b wait_returnLabel

wait_returnLabel:
ldr x11, [x11]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global power
power:
power_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x24, x1
add x9, sp, 96
add x4, sp, 104
add x6, sp, 112
add x22, sp, 120
str x11, [x4]
str x24, [x6]
mov x11, 1
str x11, [x22]
ldr x11, [x6]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne power_lab0
b power_lab1

power_lab0:
ldr x24, [x22]
ldr x11, [x4]
mul x11, x24, x11
str x11, [x22]
ldr x4, [x6]
mov x11, 1
sub x11, x4, x11
str x11, [x6]
ldr x11, [x6]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne power_lab0
b power_lab1

power_lab1:
ldr x11, [x22]
str x11, [x9]
b power_returnLabel

power_returnLabel:
ldr x11, [x9]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global recursiveDecimalSum
recursiveDecimalSum:
recursiveDecimalSum_prologue:
stp x29, x30, [sp, -160]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x12, x0
mov x11, x1
mov x6, x2
add x22, sp, 96
add x27, sp, 104
add x25, sp, 112
add x24, sp, 120
add x9, sp, 128
add x4, sp, 136
add x2, sp, 144
str x12, [x27]
str x11, [x25]
str x6, [x24]
ldr x11, [x27]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne recursiveDecimalSum_lab0
b recursiveDecimalSum_lab4

recursiveDecimalSum_lab0:
mov x11, 2
str x11, [x4]
ldr x6, [x27]
mov x11, 10
sdiv x11, x6, x11
str x11, [x9]
ldr x6, [x9]
mov x11, 10
mul x11, x6, x11
str x11, [x9]
ldr x6, [x27]
ldr x11, [x9]
sub x11, x6, x11
str x11, [x9]
ldr x11, [x9]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne recursiveDecimalSum_lab1
b recursiveDecimalSum_lab2

recursiveDecimalSum_lab1:
ldr x23, [x25]
ldr x11, [x4]
ldr x4, [x24]
mov x0, x11
mov x1, x4
bl power
mov x11, x0
add x11, x23, x11
str x11, [x25]
b recursiveDecimalSum_lab3

recursiveDecimalSum_lab2:
b recursiveDecimalSum_lab3

recursiveDecimalSum_lab3:
ldr x11, [x27]
mov x4, 10
sdiv x9, x11, x4
ldr x6, [x25]
ldr x4, [x24]
mov x11, 1
add x11, x4, x11
mov x0, x9
mov x1, x6
mov x2, x11
bl recursiveDecimalSum
mov x11, x0
str x11, [x22]
b recursiveDecimalSum_returnLabel

recursiveDecimalSum_lab4:
b recursiveDecimalSum_lab5

recursiveDecimalSum_lab5:
ldr x11, [x25]
str x11, [x22]
b recursiveDecimalSum_returnLabel

recursiveDecimalSum_returnLabel:
ldr x11, [x22]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 160
ret

.global convertToDecimal
convertToDecimal:
convertToDecimal_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
add x4, sp, 104
add x9, sp, 112
add x6, sp, 120
str x11, [x4]
mov x11, 0
str x11, [x9]
mov x11, 0
str x11, [x6]
ldr x11, [x4]
ldr x4, [x6]
ldr x6, [x9]
mov x0, x11
mov x1, x4
mov x2, x6
bl recursiveDecimalSum
mov x11, x0
str x11, [x24]
b convertToDecimal_returnLabel

convertToDecimal_returnLabel:
ldr x11, [x24]
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
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x22, sp, 96
add x25, sp, 104
add x24, sp, 112
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x25]
ldr x11, [x25]
mov x0, x11
bl convertToDecimal
mov x11, x0
str x11, [x25]
ldr x11, [x25]
ldr x4, [x25]
mul x11, x11, x4
str x11, [x24]
ldr x11, [x24]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab0:
ldr x11, [x24]
mov x0, x11
bl wait
mov x11, x0
ldr x4, [x24]
mov x11, 1
sub x11, x4, x11
str x11, [x24]
ldr x11, [x24]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab1:
ldr x11, [x25]
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
ldp x29, x30, [sp], 128
ret

