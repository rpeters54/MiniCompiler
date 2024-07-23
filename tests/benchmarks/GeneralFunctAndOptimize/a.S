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
.global interval
interval:
    .xword 0x0
.global end
end:
    .xword 0x0

.text
.global multBy4xTimes
multBy4xTimes:
multBy4xTimes_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
cmp r1, 0
cset r2, le
cmp r2, 0
bne multBy4xTimes_lab0
b multBy4xTimes_lab2

multBy4xTimes_lab0:
mov r21, 0
mov r22, 8
mul r20, r21, r22
add r4, r0, r20
ldr r5, [r4]
mov r16, r5
b multBy4xTimes_returnLabel

multBy4xTimes_lab2:
mov r27, 0
mov r28, 8
mul r26, r27, r28
add r7, r0, r26
mov r33, 0
mov r34, 8
mul r32, r33, r34
add r8, r0, r32
ldr r9, [r8]
mov r36, 4
mul r10, r36, r9
str r10, [r7]
mov r38, 1
sub r12, r1, r38
mov x0, r0
mov x1, r12
bl multBy4xTimes
mov r13, x0
mov r43, 0
mov r44, 8
mul r42, r43, r44
add r14, r0, r42
ldr r15, [r14]
mov r16, r15
b multBy4xTimes_returnLabel

multBy4xTimes_returnLabel:
mov x0, r16
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global divideBy8
divideBy8:
divideBy8_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r17, 0
mov r18, 8
mul r16, r17, r18
add r1, r0, r16
mov r23, 0
mov r24, 8
mul r22, r23, r24
add r2, r0, r22
ldr r3, [r2]
mov r26, 2
sdiv r4, r3, r26
str r4, [r1]
mov r31, 0
mov r32, 8
mul r30, r31, r32
add r5, r0, r30
mov r37, 0
mov r38, 8
mul r36, r37, r38
add r6, r0, r36
ldr r7, [r6]
mov r40, 2
sdiv r8, r7, r40
str r8, [r5]
mov r45, 0
mov r46, 8
mul r44, r45, r46
add r9, r0, r44
mov r51, 0
mov r52, 8
mul r50, r51, r52
add r10, r0, r50
ldr r11, [r10]
mov r54, 2
sdiv r12, r11, r54
str r12, [r9]
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

mov x0, 8
bl malloc
mov r0, x0
mov r1, r0
ldr r64, =end
str 1000000, [r64]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r2, x0
ldr r3, =read_scratch
ldr r3, [r3]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r4, x0
ldr r5, =read_scratch
ldr r5, [r5]
ldr r66, =interval
str r5, [r66]
ldr x0, =println
mov x1, r3
bl printf
mov r6, x0
ldr r7, =interval
ldr r7, [r7]
ldr x0, =println
mov x1, r7
bl printf
mov r8, x0
mov r68, 1
cmp r68, 0
mov r10, 0
mov r12, r1
mov r14, 0
mov r56, 0
mov r59, 0
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov r10, r53
mov r12, r49
mov r14, r51
b main_lab0

main_lab0:
ldr r15, =end
ldr r15, [r15]
mov r70, 0
cmp r70, r15
cset r16, le
cmp r16, 0
mov r18, 0
mov r46, r10
mov r48, 0
mov r49, r12
mov r51, r14
bne main_lab1
b main_lab5

inter_main_lab1:
mov r18, r43
b main_lab1

main_lab1:
mov r72, 1
add r32, r18, r72
mov r77, 0
mov r78, 8
mul r76, r77, r78
add r33, r12, r76
str r32, [r33]
mov r83, 0
mov r84, 8
mul r82, r83, r84
add r34, r12, r82
ldr r35, [r34]
mov x0, r12
mov x1, 2
bl multBy4xTimes
mov r36, x0
mov x0, r12
bl divideBy8
ldr r37, =interval
ldr r37, [r37]
mov r86, 1
sub r38, r37, r86
cmp r38, 0
cset r40, le
cmp r40, 0
mov r41, 1
mov r42, r32
bne main_lab4
b main_lab3

main_lab3:
mov r41, r38
mov r42, r32
b main_lab4

main_lab4:
add r43, r42, r41
ldr r44, =end
ldr r44, [r44]
cmp r43, r44
cset r45, le
cmp r45, 0
mov r46, r10
mov r48, r43
mov r49, r12
mov r51, 39916800
bne main_lab1
b main_lab5

main_lab5:
mov r88, 1
add r53, r46, r88
cmp r53, 50
cset r54, lt
cmp r54, 0
mov r56, r48
mov r59, r51
bne main_lab0
b main_returnLabel

main_returnLabel:
ldr x0, =println
mov x1, r56
bl printf
mov r60, x0
ldr x0, =println
mov x1, r59
bl printf
mov r61, x0
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

