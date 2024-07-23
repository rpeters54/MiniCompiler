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
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
mov x24, x1
sdiv x11, x4, x24
mul x11, x11, x24
sub x11, x4, x11
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global hailstone
hailstone:
hailstone_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x4, 1
cmp x4, 0
mov x24, x11
bne hailstone_lab0
b hailstone_returnLabel

inter_hailstone_lab0:
mov x24, x4
b hailstone_lab0

hailstone_lab0:
ldr x0, =print
mov x1, x24
bl printf
mov x11, x0
mov x0, x24
mov x1, 2
bl mod
mov x11, x0
cmp x11, 1
cset x11, eq
cmp x11, 0
bne hailstone_lab1
b hailstone_lab2

hailstone_lab1:
mov x11, 3
mul x11, x11, x24
mov x4, 1
add x11, x11, x4
mov x4, x11
b hailstone_lab3

hailstone_lab2:
mov x11, 2
sdiv x11, x24, x11
mov x4, x11
b hailstone_lab3

hailstone_lab3:
cmp x4, 1
cset x11, le
cmp x11, 0
bne hailstone_lab4
b hailstone_lab6

hailstone_lab4:
ldr x0, =println
mov x1, x4
bl printf
mov x11, x0
b hailstone_returnLabel

hailstone_lab6:
mov x11, 1
cmp x11, 0
bne inter_hailstone_lab0
b hailstone_returnLabel

hailstone_returnLabel:
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
ldr x11, =read_scratch
ldr x11, [x11]
mov x0, x11
bl hailstone
mov x0, 0
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

