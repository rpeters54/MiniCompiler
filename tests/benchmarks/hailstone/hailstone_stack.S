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
.global mod
mod:
mod_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x6, x0
mov x24, x1
add x9, sp, 96
add x11, sp, 104
add x4, sp, 112
str x6, [x11]
str x24, [x4]
ldr x6, [x11]
ldr x11, [x11]
ldr x24, [x4]
sdiv x11, x11, x24
ldr x4, [x4]
mul x11, x11, x4
sub x11, x6, x11
str x11, [x9]
b mod_returnLabel

mod_returnLabel:
ldr x11, [x9]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global hailstone
hailstone:
hailstone_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
str x11, [x24]
mov x11, 1
cmp x11, 0
bne hailstone_lab0
b hailstone_lab7

hailstone_lab0:
ldr x11, [x24]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
mov x1, 2
bl mod
mov x11, x0
cmp x11, 1
cset x11, eq
cmp x11, 0
bne hailstone_lab1
b hailstone_lab2

hailstone_lab1:
ldr x11, [x24]
mov x4, 3
mul x11, x4, x11
mov x4, 1
add x11, x11, x4
str x11, [x24]
b hailstone_lab3

hailstone_lab2:
ldr x4, [x24]
mov x11, 2
sdiv x11, x4, x11
str x11, [x24]
b hailstone_lab3

hailstone_lab3:
ldr x11, [x24]
cmp x11, 1
cset x11, le
cmp x11, 0
bne hailstone_lab4
b hailstone_lab5

hailstone_lab4:
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b hailstone_returnLabel

hailstone_lab5:
b hailstone_lab6

hailstone_lab6:
mov x11, 1
cmp x11, 0
bne hailstone_lab0
b hailstone_lab7

hailstone_lab7:
b hailstone_returnLabel

hailstone_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global main
main:
main_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x22, sp, 96
add x24, sp, 104
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x24]
ldr x11, [x24]
mov x0, x11
bl hailstone
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
ldp x29, x30, [sp], 112
ret

