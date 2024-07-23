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
.global sum
sum:
sum_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
mov x24, x1
add x9, sp, 96
add x6, sp, 104
add x11, sp, 112
str x4, [x6]
str x24, [x11]
ldr x4, [x6]
ldr x11, [x11]
add x11, x4, x11
str x11, [x9]
b sum_returnLabel

sum_returnLabel:
ldr x11, [x9]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global fact
fact:
fact_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
add x24, sp, 96
add x11, sp, 104
add x22, sp, 112
str x4, [x11]
ldr x4, [x11]
cmp x4, 1
cset x6, eq
ldr x4, [x11]
cmp x4, 0
cset x4, eq
orr x4, x6, x4
cmp x4, 0
bne fact_lab0
b fact_lab1

fact_lab0:
mov x11, 1
str x11, [x24]
b fact_returnLabel

fact_lab1:
b fact_lab2

fact_lab2:
ldr x4, [x11]
cmp x4, 1
cset x4, le
cmp x4, 0
bne fact_lab3
b fact_lab4

fact_lab3:
mov x6, 0
mov x4, 1
sub x4, x6, x4
ldr x11, [x11]
mul x11, x4, x11
mov x0, x11
bl fact
mov x11, x0
str x11, [x24]
b fact_returnLabel

fact_lab4:
b fact_lab5

fact_lab5:
ldr x25, [x11]
ldr x11, [x11]
mov x4, 1
sub x11, x11, x4
mov x0, x11
bl fact
mov x11, x0
mul x11, x25, x11
str x11, [x22]
ldr x11, [x22]
str x11, [x24]
b fact_returnLabel

fact_returnLabel:
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
add x27, sp, 104
add x25, sp, 112
add x24, sp, 120
mov x11, 0
str x11, [x24]
ldr x11, [x24]
mov x6, 0
mov x4, 1
sub x4, x6, x4
cmp x11, x4
cset x11, ne
cmp x11, 0
bne main_lab0
b main_lab1

main_lab0:
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
ldr x11, [x27]
mov x0, x11
bl fact
mov x11, x0
str x11, [x27]
ldr x11, [x25]
mov x0, x11
bl fact
mov x11, x0
str x11, [x25]
ldr x4, [x27]
ldr x11, [x25]
mov x0, x4
mov x1, x11
bl sum
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x24]
ldr x24, [x24]
mov x11, 0
mov x4, 1
sub x11, x11, x4
cmp x24, x11
cset x11, ne
cmp x11, 0
bne main_lab0
b main_lab1

main_lab1:
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

