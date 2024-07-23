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
.global intList
intList:
    .xword 0x0

.text
.global length
length:
length_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
cmp r0, null
cset r1, eq
cmp r1, 0
mov r7, 0
bne length_returnLabel
b length_lab2

length_lab2:
mov r12, 1
mov r13, 8
mul r11, r12, r13
add r3, r0, r11
ldr r4, [r3]
mov x0, r4
bl length
mov r5, x0
mov r15, 1
add r6, r15, r5
mov r7, r6
b length_returnLabel

length_returnLabel:
mov x0, r7
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global addToFront
addToFront:
addToFront_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
cmp r0, null
cset r2, eq
cmp r2, 0
bne addToFront_lab0
b addToFront_lab2

addToFront_lab0:
mov x0, 16
bl malloc
mov r3, x0
mov r4, r3
mov r19, 0
mov r20, 8
mul r18, r19, r20
add r5, r4, r18
str r1, [r5]
mov r25, 1
mov r26, 8
mul r24, r25, r26
add r7, r4, r24
str null, [r7]
mov r14, r4
b addToFront_returnLabel

addToFront_lab2:
mov x0, 16
bl malloc
mov r8, x0
mov r9, r8
mov r31, 0
mov r32, 8
mul r30, r31, r32
add r10, r9, r30
str r1, [r10]
mov r37, 1
mov r38, 8
mul r36, r37, r38
add r12, r9, r36
str r0, [r12]
mov r14, r9
b addToFront_returnLabel

addToFront_returnLabel:
mov x0, r14
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global deleteFirst
deleteFirst:
deleteFirst_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
cmp r0, null
cset r1, eq
cmp r1, 0
mov r6, null
bne deleteFirst_returnLabel
b deleteFirst_lab2

deleteFirst_lab2:
mov r11, 1
mov r12, 8
mul r10, r11, r12
add r3, r0, r10
ldr r4, [r3]
mov r6, r4
b deleteFirst_returnLabel

deleteFirst_returnLabel:
mov x0, r6
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
ldr r36, =intList
str r1, [r36]
ldr r2, =intList
ldr r2, [r2]
cmp r2, 0
cset r3, gt
cmp r3, 0
mov r5, null
mov r15, 0
mov r16, null
bne main_lab0
b main_lab1

inter_main_lab0:
mov r5, r7
b main_lab0

main_lab0:
ldr r6, =intList
ldr r6, [r6]
mov x0, r5
mov x1, r6
bl addToFront
mov r7, x0
mov r41, 0
mov r42, 8
mul r40, r41, r42
add r8, r7, r40
ldr r9, [r8]
ldr x0, =print
mov x1, r9
bl printf
mov r10, x0
ldr r11, =intList
ldr r11, [r11]
mov r44, 1
sub r12, r11, r44
ldr r46, =intList
str r12, [r46]
ldr r13, =intList
ldr r13, [r13]
cmp r13, 0
cset r14, gt
cmp r14, 0
mov r15, 0
mov r16, r7
bne main_lab0
b main_lab1

main_lab1:
mov x0, r16
bl length
mov r17, x0
ldr x0, =print
mov x1, r17
bl printf
mov r18, x0
mov x0, r16
bl length
mov r19, x0
cmp r19, 0
cset r20, gt
cmp r20, 0
mov r21, r15
mov r22, r16
mov r31, r15
bne main_lab2
b main_returnLabel

inter_main_lab2:
mov r21, r25
mov r22, r28
b main_lab2

main_lab2:
mov r51, 0
mov r52, 8
mul r50, r51, r52
add r23, r22, r50
ldr r24, [r23]
add r25, r21, r24
mov x0, r22
bl length
mov r26, x0
ldr x0, =print
mov x1, r26
bl printf
mov r27, x0
mov x0, r22
bl deleteFirst
mov r28, x0
mov x0, r28
bl length
mov r29, x0
cmp r29, 0
cset r30, gt
cmp r30, 0
mov r31, r25
bne main_lab2
b main_returnLabel

main_returnLabel:
ldr x0, =println
mov x1, r31
bl printf
mov r33, x0
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

