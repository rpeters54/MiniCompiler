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

.global fact
fact:
fact_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
cmp x24, 1
cset x11, eq
cmp x24, 0
cset x4, eq
orr x11, x11, x4
cmp x11, 0
mov x11, 1
bne fact_returnLabel
b fact_lab2

fact_lab2:
cmp x24, 1
cset x11, le
cmp x11, 0
bne fact_lab3
b fact_lab5

fact_lab3:
mov x11, -1
mul x11, x11, x24
mov x0, x11
bl fact
mov x11, x0
mov x11, x11
b fact_returnLabel

fact_lab5:
mov x11, 1
sub x11, x24, x11
mov x0, x11
bl fact
mov x11, x0
mul x11, x24, x11
mov x11, x11
b fact_returnLabel

fact_returnLabel:
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

mov x11, 1
cmp x11, 0
bne main_lab0
b main_returnLabel

main_lab0:
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
ldr x22, =read_scratch
ldr x22, [x22]
mov x0, x24
bl fact
mov x24, x0
mov x0, x22
bl fact
mov x11, x0
mov x0, x24
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
cmp x11, -1
cset x11, ne
cmp x11, 0
bne main_lab0
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

