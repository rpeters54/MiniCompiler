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
stp x29, x30, [sp, -120]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
add r13, x13, 96
add r14, x13, 104
add r15, x13, 112
str r0, [r14]
str r1, [r15]
ldr r5, [r14]
ldr r6, [r14]
ldr r7, [r15]
sdiv r8, r6, r7
ldr r9, [r15]
mul r10, r8, r9
sub r11, r5, r10
str r11, [r13]
b mod_returnLabel

mod_returnLabel:
ldr r12, [r13]
mov x0, r12
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 120
ret

.global hailstone
hailstone:
hailstone_prologue:
stp x29, x30, [sp, -104]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r26, x13, 96
str r0, [r26]
mov r17, 1
cmp r17, 0
bne hailstone_lab0
b hailstone_lab7

hailstone_lab0:
ldr r2, [r26]
ldr x0, =print
mov x1, r2
bl printf
mov r3, x0
ldr r4, [r26]
mov x0, r4
mov x1, 2
bl mod
mov r5, x0
cmp r5, 1
cset r6, eq
cmp r6, 0
bne hailstone_lab1
b hailstone_lab2

hailstone_lab1:
ldr r7, [r26]
mov r19, 3
mul r8, r19, r7
mov r21, 1
add r9, r8, r21
str r9, [r26]
b hailstone_lab3

hailstone_lab2:
ldr r10, [r26]
mov r23, 2
sdiv r11, r10, r23
str r11, [r26]
b hailstone_lab3

hailstone_lab3:
ldr r12, [r26]
cmp r12, 1
cset r13, le
cmp r13, 0
bne hailstone_lab4
b hailstone_lab5

hailstone_lab4:
ldr r14, [r26]
ldr x0, =println
mov x1, r14
bl printf
mov r15, x0
b hailstone_returnLabel

hailstone_lab5:
b hailstone_lab6

hailstone_lab6:
mov r25, 1
cmp r25, 0
bne hailstone_lab0
b hailstone_lab7

hailstone_lab7:
b hailstone_returnLabel

hailstone_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 104
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

add r6, x13, 96
add r7, x13, 104
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r2, x0
ldr r3, =read_scratch
ldr r3, [r3]
str r3, [r7]
ldr r4, [r7]
mov x0, r4
bl hailstone
str 0, [r6]
b main_returnLabel

main_returnLabel:
ldr r5, [r6]
mov x0, r5
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 112
ret

