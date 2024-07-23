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
.global computeFib
computeFib:
computeFib_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
cmp r0, 0
cset r1, eq
cmp r1, 0
mov r10, 0
bne computeFib_returnLabel
b computeFib_lab1

computeFib_lab1:
cmp r0, 2
cset r3, le
cmp r3, 0
mov r10, 1
bne computeFib_returnLabel
b computeFib_lab3

computeFib_lab3:
mov r12, 1
sub r5, r0, r12
mov x0, r5
bl computeFib
mov r6, x0
mov r14, 2
sub r7, r0, r14
mov x0, r7
bl computeFib
mov r8, x0
add r9, r6, r8
mov r10, r9
b computeFib_returnLabel

computeFib_returnLabel:
mov x0, r10
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
bl computeFib
mov r2, x0
ldr x0, =println
mov x1, r2
bl printf
mov r3, x0
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

