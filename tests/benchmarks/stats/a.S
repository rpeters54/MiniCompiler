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
.global getRands
getRands:
getRands_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
mul r2, r0, r0
mov x0, 16
bl malloc
mov r3, x0
mov r4, r3
mov r40, 0
mov r41, 8
mul r39, r40, r41
add r5, r4, r39
str r2, [r5]
mov r46, 1
mov r47, 8
mul r45, r46, r47
add r6, r4, r45
str null, [r6]
mov r49, 1
sub r7, r1, r49
cmp r7, 0
cset r8, gt
cmp r8, 0
mov r10, r4
mov r12, r7
mov r13, r2
mov r34, null
bne getRands_lab0
b getRands_returnLabel

inter_getRands_lab0:
mov r10, r24
mov r12, r27
mov r13, r22
b getRands_lab0

getRands_lab0:
mul r15, r13, r13
sdiv r16, r15, r0
mov r51, 2
sdiv r17, r0, r51
mul r18, r16, r17
mov r53, 1
add r19, r18, r53
mov r55, 1000000000
sdiv r20, r19, r55
mov r57, 1000000000
mul r21, r20, r57
sub r22, r19, r21
mov x0, 16
bl malloc
mov r23, x0
mov r24, r23
mov r62, 0
mov r63, 8
mul r61, r62, r63
add r25, r24, r61
str r22, [r25]
mov r68, 1
mov r69, 8
mul r67, r68, r69
add r26, r24, r67
str r10, [r26]
mov r71, 1
sub r27, r12, r71
cmp r27, 0
cset r28, gt
cmp r28, 0
mov r34, r24
bne getRands_lab0
b getRands_returnLabel

getRands_returnLabel:
mov x0, r34
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global calcMean
calcMean:
calcMean_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
cmp r0, null
cset r1, ne
cmp r1, 0
mov r3, 0
mov r4, 0
mov r5, r0
mov r13, 0
mov r14, 0
mov r15, 0
bne calcMean_lab0
b calcMean_lab1

inter_calcMean_lab0:
mov r3, r6
mov r4, r9
mov r5, r11
b calcMean_lab0

calcMean_lab0:
mov r26, 1
add r6, r3, r26
mov r31, 0
mov r32, 8
mul r30, r31, r32
add r7, r5, r30
ldr r8, [r7]
add r9, r4, r8
mov r37, 1
mov r38, 8
mul r36, r37, r38
add r10, r5, r36
ldr r11, [r10]
cmp r11, null
cset r12, ne
cmp r12, 0
mov r13, 0
mov r14, r6
mov r15, r9
bne calcMean_lab0
b calcMean_lab1

calcMean_lab1:
cmp r14, 0
cset r17, ne
cmp r17, 0
mov r21, r13
bne calcMean_lab2
b calcMean_returnLabel

calcMean_lab2:
sdiv r20, r15, r14
mov r21, r20
b calcMean_returnLabel

calcMean_returnLabel:
mov x0, r21
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global approxSqrt
approxSqrt:
approxSqrt_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r15, 0
cmp r15, r0
cset r1, lt
cmp r1, 0
mov r3, 1
mov r12, 1
bne approxSqrt_lab0
b approxSqrt_returnLabel

inter_approxSqrt_lab0:
mov r3, r7
b approxSqrt_lab0

approxSqrt_lab0:
mul r6, r3, r3
mov r17, 1
add r7, r3, r17
cmp r6, r0
cset r8, lt
cmp r8, 0
mov r12, r3
bne approxSqrt_lab0
b approxSqrt_returnLabel

approxSqrt_returnLabel:
mov x0, r12
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global approxSqrtAll
approxSqrtAll:
approxSqrtAll_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
cmp r0, null
cset r1, ne
cmp r1, 0
mov r2, r0
bne approxSqrtAll_lab0
b approxSqrtAll_returnLabel

inter_approxSqrtAll_lab0:
mov r2, r8
b approxSqrtAll_lab0

approxSqrtAll_lab0:
mov r15, 0
mov r16, 8
mul r14, r15, r16
add r3, r2, r14
ldr r4, [r3]
mov x0, r4
bl approxSqrt
mov r5, x0
ldr x0, =println
mov x1, r5
bl printf
mov r6, x0
mov r21, 1
mov r22, 8
mul r20, r21, r22
add r7, r2, r20
ldr r8, [r7]
cmp r8, null
cset r9, ne
cmp r9, 0
bne approxSqrtAll_lab0
b approxSqrtAll_returnLabel

approxSqrtAll_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global range
range:
range_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
cmp r0, null
cset r1, ne
cmp r1, 0
mov r2, 0
mov r3, 0
mov r4, r0
mov r5, 1
mov r39, 0
mov r40, 0
bne range_lab0
b range_returnLabel

inter_range_lab0:
mov r2, r32
mov r3, r33
mov r4, r37
mov r5, r35
b range_lab0

range_lab0:
cmp r5, 0
bne range_lab1
b range_lab2

range_lab1:
mov r49, 0
mov r50, 8
mul r48, r49, r50
add r7, r4, r48
ldr r8, [r7]
mov r55, 0
mov r56, 8
mul r54, r55, r56
add r9, r4, r54
ldr r10, [r9]
mov r32, r8
mov r33, r10
mov r34, r4
mov r35, 0
b range_lab9

range_lab2:
mov r61, 0
mov r62, 8
mul r60, r61, r62
add r12, r4, r60
ldr r13, [r12]
cmp r13, r2
cset r15, lt
cmp r15, 0
bne range_lab3
b range_lab4

range_lab3:
mov r67, 0
mov r68, 8
mul r66, r67, r68
add r17, r4, r66
ldr r18, [r17]
mov r29, r18
mov r30, r3
mov r31, r4
b range_lab8

range_lab4:
mov r73, 0
mov r74, 8
mul r72, r73, r74
add r20, r4, r72
ldr r21, [r20]
cmp r21, r3
cset r23, gt
cmp r23, 0
mov r27, r3
mov r28, r4
bne range_lab5
b range_lab7

range_lab5:
mov r79, 0
mov r80, 8
mul r78, r79, r80
add r25, r4, r78
ldr r26, [r25]
mov r27, r26
mov r28, r4
b range_lab7

range_lab7:
mov r29, r2
mov r30, r27
mov r31, r28
b range_lab8

range_lab8:
mov r32, r29
mov r33, r30
mov r34, r31
mov r35, r5
b range_lab9

range_lab9:
mov r85, 1
mov r86, 8
mul r84, r85, r86
add r36, r34, r84
ldr r37, [r36]
cmp r37, null
cset r38, ne
cmp r38, 0
mov r39, r32
mov r40, r33
bne range_lab0
b range_returnLabel

range_returnLabel:
ldr x0, =println
mov x1, r39
bl printf
mov r43, x0
ldr x0, =println
mov x1, r40
bl printf
mov r44, x0
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
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r2, x0
ldr r3, =read_scratch
ldr r3, [r3]
mov x0, r1
mov x1, r3
bl getRands
mov r4, x0
mov x0, r4
bl calcMean
mov r5, x0
ldr x0, =println
mov x1, r5
bl printf
mov r6, x0
mov x0, r4
bl range
mov x0, r4
bl approxSqrtAll
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

