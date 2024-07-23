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
wait_returnLabel:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global power
power:
power_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
cmp r1, 0
cset r2, gt
cmp r2, 0
mov r3, 1
mov r5, r1
mov r9, 1
bne power_lab0
b power_returnLabel

inter_power_lab0:
mov r3, r6
mov r5, r7
b power_lab0

power_lab0:
mul r6, r3, r0
mov r14, 1
sub r7, r5, r14
cmp r7, 0
cset r8, gt
cmp r8, 0
mov r9, r6
bne power_lab0
b power_returnLabel

power_returnLabel:
mov x0, r9
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global recursiveDecimalSum
recursiveDecimalSum:
recursiveDecimalSum_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
mov r2, x2
cmp r0, 0
cset r3, gt
cmp r3, 0
mov r22, r1
bne recursiveDecimalSum_lab0
b recursiveDecimalSum_returnLabel

recursiveDecimalSum_lab0:
mov r24, 10
sdiv r5, r0, r24
mov r26, 10
mul r6, r5, r26
sub r7, r0, r6
cmp r7, 1
cset r8, eq
cmp r8, 0
mov r14, r2
mov r15, r1
mov r17, r0
bne recursiveDecimalSum_lab1
b recursiveDecimalSum_lab3

recursiveDecimalSum_lab1:
mov x0, 2
mov x1, r2
bl power
mov r12, x0
add r13, r1, r12
mov r14, r2
mov r15, r13
mov r17, r0
b recursiveDecimalSum_lab3

recursiveDecimalSum_lab3:
mov r28, 10
sdiv r18, r17, r28
mov r30, 1
add r19, r14, r30
mov x0, r18
mov x1, r15
mov x2, r19
bl recursiveDecimalSum
mov r20, x0
mov r22, r20
b recursiveDecimalSum_returnLabel

recursiveDecimalSum_returnLabel:
mov x0, r22
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global convertToDecimal
convertToDecimal:
convertToDecimal_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov x0, r0
mov x1, 0
mov x2, 0
bl recursiveDecimalSum
mov r1, x0
mov x0, r1
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
bl convertToDecimal
mov r2, x0
mul r3, r2, r2
cmp r3, 0
cset r4, gt
cmp r4, 0
mov r6, r3
mov r10, r2
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov r6, r8
b main_lab0

main_lab0:
mov x0, r6
bl wait
mov r7, x0
mov r15, 1
sub r8, r6, r15
cmp r8, 0
cset r9, gt
cmp r9, 0
mov r10, r2
bne main_lab0
b main_returnLabel

main_returnLabel:
ldr x0, =println
mov x1, r10
bl printf
mov r12, x0
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

