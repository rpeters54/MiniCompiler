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
.global calcPower
calcPower:
calcPower_prologue:
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
mov r4, r1
mov r9, 1
bne calcPower_lab0
b calcPower_returnLabel

inter_calcPower_lab0:
mov r3, r6
mov r4, r7
b calcPower_lab0

calcPower_lab0:
mul r6, r3, r0
mov r14, 1
sub r7, r4, r14
cmp r7, 0
cset r8, gt
cmp r8, 0
mov r9, r6
bne calcPower_lab0
b calcPower_returnLabel

calcPower_returnLabel:
mov x0, r9
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

mov x0, 16
bl malloc
mov r0, x0
mov r1, r0
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r2, x0
ldr r3, =read_scratch
ldr r3, [r3]
mov r33, 0
mov r34, 8
mul r32, r33, r34
add r4, r1, r32
str r3, [r4]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r5, x0
ldr r6, =read_scratch
ldr r6, [r6]
cmp r6, 0
cset r7, lt
cmp r7, 0
mov r28, -1
bne main_returnLabel
b main_lab2

main_lab2:
mov r39, 1
mov r40, 8
mul r38, r39, r40
add r10, r1, r38
str r6, [r10]
mov r42, 1
cmp r42, 0
mov r14, 0
mov r23, 0
bne main_lab3
b main_lab4

inter_main_lab3:
mov r14, r16
b main_lab3

main_lab3:
mov r44, 1
add r16, r14, r44
mov r49, 0
mov r50, 8
mul r48, r49, r50
add r17, r1, r48
ldr r18, [r17]
mov r55, 1
mov r56, 8
mul r54, r55, r56
add r19, r1, r54
ldr r20, [r19]
mov x0, r18
mov x1, r20
bl calcPower
mov r21, x0
cmp r16, 1000000
cset r22, lt
cmp r22, 0
mov r23, r21
bne main_lab3
b main_lab4

main_lab4:
ldr x0, =println
mov x1, r23
bl printf
mov r27, x0
mov r28, 0
b main_returnLabel

main_returnLabel:
mov x0, r28
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

