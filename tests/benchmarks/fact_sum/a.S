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

mov r0, x0
mov r1, x1
add r2, r0, r1
mov x0, r2
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
cmp r0, 1
cset r1, eq
cmp r0, 0
cset r2, eq
or r3, r1, r2
cmp r3, 0
mov r14, 1
bne fact_returnLabel
b fact_lab2

fact_lab2:
cmp r0, 1
cset r5, le
cmp r5, 0
bne fact_lab3
b fact_lab5

fact_lab3:
mov r16, -1
mul r8, r16, r0
mov x0, r8
bl fact
mov r9, x0
mov r14, r9
b fact_returnLabel

fact_lab5:
mov r18, 1
sub r11, r0, r18
mov x0, r11
bl fact
mov r12, x0
mul r13, r0, r12
mov r14, r13
b fact_returnLabel

fact_returnLabel:
mov x0, r14
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

mov r18, 1
cmp r18, 0
bne main_lab0
b main_returnLabel

main_lab0:
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r3, x0
ldr r4, =read_scratch
ldr r4, [r4]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r5, x0
ldr r6, =read_scratch
ldr r6, [r6]
mov x0, r4
bl fact
mov r7, x0
mov x0, r6
bl fact
mov r8, x0
mov x0, r7
mov x1, r8
bl sum
mov r9, x0
ldr x0, =println
mov x1, r9
bl printf
mov r10, x0
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r11, x0
ldr r12, =read_scratch
ldr r12, [r12]
cmp r12, -1
cset r14, ne
cmp r14, 0
bne main_lab0
b main_returnLabel

main_returnLabel:
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

