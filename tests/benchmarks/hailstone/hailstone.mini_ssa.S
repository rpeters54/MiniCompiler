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

mov r0, x0
mov r1, x1
sdiv r2, r0, r1
mul r3, r2, r1
sub r4, r0, r3
mov x0, r4
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
mov r16, 1
cmp r16, 0
mov r1, r0
bne hailstone_lab0
b hailstone_returnLabel

inter_hailstone_lab0:
mov r1, r10
b hailstone_lab0

hailstone_lab0:
ldr x0, =print
mov x1, r1
bl printf
mov r2, x0
mov x0, r1
mov x1, 2
bl mod
mov r3, x0
cmp r3, 1
cset r4, eq
cmp r4, 0
bne hailstone_lab1
b hailstone_lab2

hailstone_lab1:
mov r18, 3
mul r6, r18, r1
mov r20, 1
add r7, r6, r20
mov r10, r7
b hailstone_lab3

hailstone_lab2:
mov r22, 2
sdiv r9, r1, r22
mov r10, r9
b hailstone_lab3

hailstone_lab3:
cmp r10, 1
cset r11, le
cmp r11, 0
bne hailstone_lab4
b hailstone_lab6

hailstone_lab4:
ldr x0, =println
mov x1, r10
bl printf
mov r13, x0
b hailstone_returnLabel

hailstone_lab6:
mov r24, 1
cmp r24, 0
bne hailstone_lab0
b hailstone_returnLabel

hailstone_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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
mov r0, x0
ldr r1, =read_scratch
ldr r1, [r1]
mov x0, r1
bl hailstone
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

