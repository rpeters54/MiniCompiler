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
.global getIntList
getIntList:
getIntList_prologue:
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
cmp r3, -1
cset r5, eq
cmp r5, 0
bne getIntList_lab0
b getIntList_lab1

getIntList_lab0:
mov r20, 0
mov r21, 8
mul r19, r20, r21
add r7, r1, r19
str r3, [r7]
mov r26, 1
mov r27, 8
mul r25, r26, r27
add r9, r1, r25
str null, [r9]
mov r15, r1
b getIntList_returnLabel

getIntList_lab1:
mov r32, 0
mov r33, 8
mul r31, r32, r33
add r11, r1, r31
str r3, [r11]
mov r38, 1
mov r39, 8
mul r37, r38, r39
add r13, r1, r37
bl getIntList
mov r14, x0
str r14, [r13]
mov r15, r1
b getIntList_returnLabel

getIntList_returnLabel:
mov x0, r15
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global biggest
biggest:
biggest_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
cmp r0, r1
cset r2, gt
cmp r2, 0
mov r5, r0
bne biggest_returnLabel
b biggest_lab1

biggest_lab1:
mov r5, r1
b biggest_returnLabel

biggest_returnLabel:
mov x0, r5
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global biggestInList
biggestInList:
biggestInList_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r23, 0
mov r24, 8
mul r22, r23, r24
add r1, r0, r22
ldr r2, [r1]
mov r29, 1
mov r30, 8
mul r28, r29, r30
add r3, r0, r28
ldr r4, [r3]
cmp r4, null
cset r5, ne
cmp r5, 0
mov r6, r2
mov r7, r0
mov r16, r2
bne biggestInList_lab0
b biggestInList_returnLabel

inter_biggestInList_lab0:
mov r6, r10
mov r7, r12
b biggestInList_lab0

biggestInList_lab0:
mov r35, 0
mov r36, 8
mul r34, r35, r36
add r8, r7, r34
ldr r9, [r8]
mov x0, r6
mov x1, r9
bl biggest
mov r10, x0
mov r41, 1
mov r42, 8
mul r40, r41, r42
add r11, r7, r40
ldr r12, [r11]
mov r47, 1
mov r48, 8
mul r46, r47, r48
add r13, r12, r46
ldr r14, [r13]
cmp r14, null
cset r15, ne
cmp r15, 0
mov r16, r10
bne biggestInList_lab0
b biggestInList_returnLabel

biggestInList_returnLabel:
mov x0, r16
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

bl getIntList
mov r0, x0
mov x0, r0
bl biggestInList
mov r1, x0
ldr x0, =println
mov x1, r1
bl printf
mov r2, x0
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

