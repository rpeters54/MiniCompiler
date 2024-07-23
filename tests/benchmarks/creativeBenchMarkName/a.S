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
.global buildList
buildList:
buildList_prologue:
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
mov x0, 16
bl malloc
mov r2, x0
mov r3, r2
mov x0, 16
bl malloc
mov r4, x0
mov r5, r4
mov x0, 16
bl malloc
mov r6, x0
mov r7, r6
mov x0, 16
bl malloc
mov r8, x0
mov r9, r8
mov x0, 16
bl malloc
mov r10, x0
mov r11, r10
mov r41, 0
mov r42, 8
mul r40, r41, r42
add r12, r1, r40
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r13, x0
ldr r14, =read_scratch
ldr r14, [r14]
str r14, [r12]
mov r47, 0
mov r48, 8
mul r46, r47, r48
add r15, r3, r46
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r16, x0
ldr r17, =read_scratch
ldr r17, [r17]
str r17, [r15]
mov r53, 0
mov r54, 8
mul r52, r53, r54
add r18, r5, r52
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r19, x0
ldr r20, =read_scratch
ldr r20, [r20]
str r20, [r18]
mov r59, 0
mov r60, 8
mul r58, r59, r60
add r21, r7, r58
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r22, x0
ldr r23, =read_scratch
ldr r23, [r23]
str r23, [r21]
mov r65, 0
mov r66, 8
mul r64, r65, r66
add r24, r9, r64
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r25, x0
ldr r26, =read_scratch
ldr r26, [r26]
str r26, [r24]
mov r71, 0
mov r72, 8
mul r70, r71, r72
add r27, r11, r70
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r28, x0
ldr r29, =read_scratch
ldr r29, [r29]
str r29, [r27]
mov r77, 1
mov r78, 8
mul r76, r77, r78
add r30, r1, r76
str r3, [r30]
mov r83, 1
mov r84, 8
mul r82, r83, r84
add r31, r3, r82
str r5, [r31]
mov r89, 1
mov r90, 8
mul r88, r89, r90
add r32, r5, r88
str r7, [r32]
mov r95, 1
mov r96, 8
mul r94, r95, r96
add r33, r7, r94
str r9, [r33]
mov r101, 1
mov r102, 8
mul r100, r101, r102
add r34, r9, r100
str r11, [r34]
mov r107, 1
mov r108, 8
mul r106, r107, r108
add r35, r11, r106
str null, [r35]
mov x0, r1
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global multiple
multiple:
multiple_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r27, 0
mov r28, 8
mul r26, r27, r28
add r1, r0, r26
ldr r2, [r1]
mov r33, 1
mov r34, 8
mul r32, r33, r34
add r3, r0, r32
ldr r4, [r3]
mov r36, 1
cmp r36, 0
mov r6, r4
mov r7, r2
mov r8, 0
mov r19, r2
bne multiple_lab0
b multiple_returnLabel

inter_multiple_lab0:
mov r6, r14
mov r7, r12
mov r8, r16
b multiple_lab0

multiple_lab0:
mov r41, 0
mov r42, 8
mul r40, r41, r42
add r10, r6, r40
ldr r11, [r10]
mul r12, r7, r11
mov r47, 1
mov r48, 8
mul r46, r47, r48
add r13, r6, r46
ldr r14, [r13]
ldr x0, =println
mov x1, r12
bl printf
mov r15, x0
mov r50, 1
add r16, r8, r50
cmp r16, 5
cset r17, lt
cmp r17, 0
mov r19, r12
bne multiple_lab0
b multiple_returnLabel

multiple_returnLabel:
mov x0, r19
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global add
add:
add_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r27, 0
mov r28, 8
mul r26, r27, r28
add r1, r0, r26
ldr r2, [r1]
mov r33, 1
mov r34, 8
mul r32, r33, r34
add r3, r0, r32
ldr r4, [r3]
mov r36, 1
cmp r36, 0
mov r6, r4
mov r7, 0
mov r8, r2
mov r20, r2
bne add_lab0
b add_returnLabel

inter_add_lab0:
mov r6, r14
mov r7, r16
mov r8, r12
b add_lab0

add_lab0:
mov r41, 0
mov r42, 8
mul r40, r41, r42
add r10, r6, r40
ldr r11, [r10]
add r12, r8, r11
mov r47, 1
mov r48, 8
mul r46, r47, r48
add r13, r6, r46
ldr r14, [r13]
ldr x0, =println
mov x1, r12
bl printf
mov r15, x0
mov r50, 1
add r16, r7, r50
cmp r16, 5
cset r17, lt
cmp r17, 0
mov r20, r12
bne add_lab0
b add_returnLabel

add_returnLabel:
mov x0, r20
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global recurseList
recurseList:
recurseList_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r19, 1
mov r20, 8
mul r18, r19, r20
add r1, r0, r18
ldr r2, [r1]
cmp r2, null
cset r3, eq
cmp r3, 0
bne recurseList_lab0
b recurseList_lab1

recurseList_lab0:
mov r25, 0
mov r26, 8
mul r24, r25, r26
add r5, r0, r24
ldr r6, [r5]
mov r14, r6
b recurseList_returnLabel

recurseList_lab1:
mov r31, 0
mov r32, 8
mul r30, r31, r32
add r8, r0, r30
ldr r9, [r8]
mov r37, 1
mov r38, 8
mul r36, r37, r38
add r10, r0, r36
ldr r11, [r10]
mov x0, r11
bl recurseList
mov r12, x0
mul r13, r9, r12
mov r14, r13
b recurseList_returnLabel

recurseList_returnLabel:
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

bl buildList
mov r0, x0
mov x0, r0
bl multiple
mov r1, x0
mov x0, r0
bl add
mov r2, x0
mov r42, 2
sdiv r3, r2, r42
sub r4, r1, r3
mov r44, 1
cmp r44, 0
mov r7, 0
mov r9, 0
mov r16, r4
mov r17, 0
bne main_lab0
b main_lab1

inter_main_lab0:
mov r7, r13
mov r9, r14
b main_lab0

main_lab0:
mov x0, r0
bl recurseList
mov r12, x0
add r13, r7, r12
mov r46, 1
add r14, r9, r46
cmp r14, 2
cset r15, lt
cmp r15, 0
mov r16, r4
mov r17, r13
bne main_lab0
b main_lab1

main_lab1:
ldr x0, =println
mov x1, r17
bl printf
mov r22, x0
cmp r17, 0
cset r23, ne
cmp r23, 0
mov r25, r17
mov r32, r16
mov r33, r17
bne main_lab2
b main_returnLabel

inter_main_lab2:
mov r25, r30
b main_lab2

main_lab2:
mov r48, 1
sub r30, r25, r48
cmp r30, 0
cset r31, ne
cmp r31, 0
mov r32, r16
mov r33, r30
bne main_lab2
b main_returnLabel

main_returnLabel:
ldr x0, =println
mov x1, r32
bl printf
mov r38, x0
ldr x0, =println
mov x1, r33
bl printf
mov r39, x0
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

