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
.global swapped
swapped:
    .xword 0x0

.text
.global compare
compare:
compare_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
mov r12, 0
mov r13, 8
mul r11, r12, r13
add r2, r0, r11
ldr r3, [r2]
mov r18, 0
mov r19, 8
mul r17, r18, r19
add r4, r1, r17
ldr r5, [r4]
sub r6, r3, r5
mov x0, r6
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global deathSort
deathSort:
deathSort_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r40, 1
cmp r40, 0
mov r2, r0
bne deathSort_lab0
b deathSort_returnLabel

inter_deathSort_lab0:
mov r2, r33
b deathSort_lab0

deathSort_lab0:
mov r45, 2
mov r46, 8
mul r44, r45, r46
add r4, r2, r44
ldr r5, [r4]
cmp r5, r2
cset r6, ne
cmp r6, 0
mov r8, 0
mov r9, r2
mov r33, r2
mov r34, 0
bne deathSort_lab1
b deathSort_lab5

inter_deathSort_lab1:
mov r8, r25
mov r9, r28
b deathSort_lab1

deathSort_lab1:
mov r51, 2
mov r52, 8
mul r50, r51, r52
add r10, r9, r50
ldr r11, [r10]
mov x0, r9
mov x1, r11
bl compare
mov r12, x0
cmp r12, 0
cset r13, gt
cmp r13, 0
mov r25, r8
mov r26, r9
mov r31, r2
bne deathSort_lab2
b deathSort_lab4

deathSort_lab2:
mov r57, 0
mov r58, 8
mul r56, r57, r58
add r15, r9, r56
ldr r16, [r15]
mov r63, 0
mov r64, 8
mul r62, r63, r64
add r17, r9, r62
mov r69, 2
mov r70, 8
mul r68, r69, r70
add r18, r9, r68
ldr r19, [r18]
mov r75, 0
mov r76, 8
mul r74, r75, r76
add r20, r19, r74
ldr r21, [r20]
str r21, [r17]
mov r81, 2
mov r82, 8
mul r80, r81, r82
add r22, r9, r80
ldr r23, [r22]
mov r87, 0
mov r88, 8
mul r86, r87, r88
add r24, r23, r86
str r16, [r24]
mov r25, 1
mov r26, r9
mov r31, r2
b deathSort_lab4

deathSort_lab4:
mov r93, 2
mov r94, 8
mul r92, r93, r94
add r27, r26, r92
ldr r28, [r27]
mov r99, 2
mov r100, 8
mul r98, r99, r100
add r29, r28, r98
ldr r30, [r29]
cmp r30, r31
cset r32, ne
cmp r32, 0
mov r33, r31
mov r34, r25
bne deathSort_lab1
b deathSort_lab5

deathSort_lab5:
cmp r34, 1
cset r36, eq
cmp r36, 0
bne deathSort_lab0
b deathSort_returnLabel

deathSort_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global printEVILList
printEVILList:
printEVILList_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r23, 2
mov r24, 8
mul r22, r23, r24
add r1, r0, r22
ldr r2, [r1]
mov r29, 0
mov r30, 8
mul r28, r29, r30
add r3, r0, r28
ldr r4, [r3]
ldr x0, =println
mov x1, r4
bl printf
mov r5, x0
cmp r2, r0
cset r7, ne
cmp r7, 0
mov r9, r2
bne printEVILList_lab0
b printEVILList_returnLabel

inter_printEVILList_lab0:
mov r9, r14
b printEVILList_lab0

printEVILList_lab0:
mov r35, 0
mov r36, 8
mul r34, r35, r36
add r10, r9, r34
ldr r11, [r10]
ldr x0, =println
mov x1, r11
bl printf
mov r12, x0
mov r41, 2
mov r42, 8
mul r40, r41, r42
add r13, r9, r40
ldr r14, [r13]
cmp r14, r0
cset r16, ne
cmp r16, 0
bne printEVILList_lab0
b printEVILList_returnLabel

printEVILList_returnLabel:
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

ldr r33, =swapped
str 666, [r33]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r0, x0
ldr r1, =read_scratch
ldr r1, [r1]
cmp r1, 0
cset r2, le
cmp r2, 0
bne main_lab0
b main_lab2

main_lab0:
ldr x0, =println
mov x1, -1
bl printf
mov r4, x0
mov r31, -1
b main_returnLabel

main_lab2:
mov r35, 1000
mul r7, r1, r35
mov x0, 24
bl malloc
mov r8, x0
mov r9, r8
mov r40, 0
mov r41, 8
mul r39, r40, r41
add r10, r9, r39
str r7, [r10]
mov r46, 1
mov r47, 8
mul r45, r46, r47
add r11, r9, r45
str r9, [r11]
mov r52, 2
mov r53, 8
mul r51, r52, r53
add r12, r9, r51
str r9, [r12]
mov r55, 1
sub r13, r7, r55
cmp r13, 0
cset r14, gt
cmp r14, 0
mov r17, r9
mov r18, r13
mov r27, r9
bne main_lab3
b main_lab4

inter_main_lab3:
mov r17, r20
mov r18, r25
b main_lab3

main_lab3:
mov x0, 24
bl malloc
mov r19, x0
mov r20, r19
mov r60, 0
mov r61, 8
mul r59, r60, r61
add r21, r20, r59
str r18, [r21]
mov r66, 1
mov r67, 8
mul r65, r66, r67
add r22, r20, r65
str r17, [r22]
mov r72, 2
mov r73, 8
mul r71, r72, r73
add r23, r20, r71
str r9, [r23]
mov r78, 2
mov r79, 8
mul r77, r78, r79
add r24, r17, r77
str r20, [r24]
mov r81, 1
sub r25, r18, r81
cmp r25, 0
cset r26, gt
cmp r26, 0
mov r27, r9
bne main_lab3
b main_lab4

main_lab4:
mov x0, r27
bl deathSort
mov x0, r27
bl printEVILList
mov r31, 0
b main_returnLabel

main_returnLabel:
mov x0, r31
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

