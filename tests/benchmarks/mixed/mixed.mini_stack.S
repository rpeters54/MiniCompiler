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
.global globalfoo
globalfoo:
    .xword 0x0

.text
.global tailrecursive
tailrecursive:
tailrecursive_prologue:
stp x29, x30, [sp, -104]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r8, x13, 96
str r0, [r8]
ldr r2, [r8]
cmp r2, 0
cset r3, le
cmp r3, 0
bne tailrecursive_lab0
b tailrecursive_lab1

tailrecursive_lab0:
b tailrecursive_returnLabel

tailrecursive_lab1:
b tailrecursive_lab2

tailrecursive_lab2:
ldr r4, [r8]
mov r7, 1
sub r5, r4, r7
mov x0, r5
bl tailrecursive
b tailrecursive_returnLabel

tailrecursive_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 104
ret

.global add
add:
add_prologue:
stp x29, x30, [sp, -120]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
add r9, x13, 96
add r10, x13, 104
add r11, x13, 112
str r0, [r10]
str r1, [r11]
ldr r5, [r10]
ldr r6, [r11]
add r7, r5, r6
str r7, [r9]
b add_returnLabel

add_returnLabel:
ldr r8, [r9]
mov x0, r8
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 120
ret

.global domath
domath:
domath_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r222, x13, 96
add r223, x13, 104
add r224, x13, 112
add r225, x13, 120
str r0, [r222]
mov x0, 17
bl malloc
mov r5, x0
mov r6, r5
str r6, [r223]
ldr r7, [r223]
mov r92, 2
mov r93, 8
mul r91, r92, r93
add r8, r7, r91
mov x0, 8
bl malloc
mov r9, x0
mov r10, r9
str r10, [r8]
mov x0, 17
bl malloc
mov r11, x0
mov r12, r11
str r12, [r224]
ldr r13, [r224]
mov r98, 2
mov r99, 8
mul r97, r98, r99
add r14, r13, r97
mov x0, 8
bl malloc
mov r15, x0
mov r16, r15
str r16, [r14]
ldr r17, [r223]
mov r104, 0
mov r105, 8
mul r103, r104, r105
add r18, r17, r103
ldr r19, [r222]
str r19, [r18]
ldr r20, [r224]
mov r110, 0
mov r111, 8
mul r109, r110, r111
add r21, r20, r109
str 3, [r21]
ldr r22, [r223]
mov r116, 2
mov r117, 8
mul r115, r116, r117
add r23, r22, r115
ldr r24, [r23]
mov r122, 0
mov r123, 8
mul r121, r122, r123
add r25, r24, r121
ldr r26, [r223]
mov r128, 0
mov r129, 8
mul r127, r128, r129
add r27, r26, r127
ldr r28, [r27]
str r28, [r25]
ldr r29, [r224]
mov r134, 2
mov r135, 8
mul r133, r134, r135
add r30, r29, r133
ldr r31, [r30]
mov r140, 0
mov r141, 8
mul r139, r140, r141
add r32, r31, r139
ldr r33, [r224]
mov r146, 0
mov r147, 8
mul r145, r146, r147
add r34, r33, r145
ldr r35, [r34]
str r35, [r32]
ldr r36, [r222]
cmp r36, 0
cset r37, gt
cmp r37, 0
bne domath_lab0
b domath_lab1

domath_lab0:
ldr r38, [r223]
mov r152, 0
mov r153, 8
mul r151, r152, r153
add r39, r38, r151
ldr r40, [r39]
ldr r41, [r224]
mov r158, 0
mov r159, 8
mul r157, r158, r159
add r42, r41, r157
ldr r43, [r42]
mul r44, r40, r43
str r44, [r225]
ldr r45, [r225]
ldr r46, [r223]
mov r164, 2
mov r165, 8
mul r163, r164, r165
add r47, r46, r163
ldr r48, [r47]
mov r170, 0
mov r171, 8
mul r169, r170, r171
add r49, r48, r169
ldr r50, [r49]
mul r51, r45, r50
ldr r52, [r224]
mov r176, 0
mov r177, 8
mul r175, r176, r177
add r53, r52, r175
ldr r54, [r53]
sdiv r55, r51, r54
str r55, [r225]
ldr r56, [r224]
mov r182, 2
mov r183, 8
mul r181, r182, r183
add r57, r56, r181
ldr r58, [r57]
mov r188, 0
mov r189, 8
mul r187, r188, r189
add r59, r58, r187
ldr r60, [r59]
ldr r61, [r223]
mov r194, 0
mov r195, 8
mul r193, r194, r195
add r62, r61, r193
ldr r63, [r62]
mov x0, r60
mov x1, r63
bl add
mov r64, x0
str r64, [r225]
ldr r65, [r224]
mov r200, 0
mov r201, 8
mul r199, r200, r201
add r66, r65, r199
ldr r67, [r66]
ldr r68, [r223]
mov r206, 0
mov r207, 8
mul r205, r206, r207
add r69, r68, r205
ldr r70, [r69]
sub r71, r67, r70
str r71, [r225]
ldr r72, [r222]
mov r209, 1
sub r73, r72, r209
str r73, [r222]
ldr r74, [r222]
cmp r74, 0
cset r75, gt
cmp r75, 0
bne domath_lab0
b domath_lab1

domath_lab1:
ldr r76, [r223]
mov r214, 2
mov r215, 8
mul r213, r214, r215
add r77, r76, r213
ldr r78, [r77]
mov r79, r78
mov x0, r79
bl free
ldr r80, [r224]
mov r220, 2
mov r221, 8
mul r219, r220, r221
add r81, r80, r219
ldr r82, [r81]
mov r83, r82
mov x0, r83
bl free
ldr r84, [r223]
mov r85, r84
mov x0, r85
bl free
ldr r86, [r224]
mov r87, r86
mov x0, r87
bl free
b domath_returnLabel

domath_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global objinstantiation
objinstantiation:
objinstantiation_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r15, x13, 96
add r16, x13, 104
str r0, [r15]
ldr r3, [r15]
cmp r3, 0
cset r4, gt
cmp r4, 0
bne objinstantiation_lab0
b objinstantiation_lab1

objinstantiation_lab0:
mov x0, 17
bl malloc
mov r5, x0
mov r6, r5
str r6, [r16]
ldr r7, [r16]
mov r8, r7
mov x0, r8
bl free
ldr r9, [r15]
mov r14, 1
sub r10, r9, r14
str r10, [r15]
ldr r11, [r15]
cmp r11, 0
cset r12, gt
cmp r12, 0
bne objinstantiation_lab0
b objinstantiation_lab1

objinstantiation_lab1:
b objinstantiation_returnLabel

objinstantiation_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global ackermann
ackermann:
ackermann_prologue:
stp x29, x30, [sp, -120]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
add r30, x13, 96
add r31, x13, 104
add r32, x13, 112
str r0, [r31]
str r1, [r32]
ldr r5, [r31]
cmp r5, 0
cset r6, eq
cmp r6, 0
bne ackermann_lab0
b ackermann_lab1

ackermann_lab0:
ldr r7, [r32]
mov r23, 1
add r8, r7, r23
str r8, [r30]
b ackermann_returnLabel

ackermann_lab1:
b ackermann_lab2

ackermann_lab2:
ldr r9, [r32]
cmp r9, 0
cset r10, eq
cmp r10, 0
bne ackermann_lab3
b ackermann_lab4

ackermann_lab3:
ldr r11, [r31]
mov r25, 1
sub r12, r11, r25
mov x0, r12
mov x1, 1
bl ackermann
mov r13, x0
str r13, [r30]
b ackermann_returnLabel

ackermann_lab4:
ldr r14, [r31]
mov r27, 1
sub r15, r14, r27
ldr r16, [r31]
ldr r17, [r32]
mov r29, 1
sub r18, r17, r29
mov x0, r16
mov x1, r18
bl ackermann
mov r19, x0
mov x0, r15
mov x1, r19
bl ackermann
mov r20, x0
str r20, [r30]
b ackermann_returnLabel

ackermann_returnLabel:
ldr r21, [r30]
mov x0, r21
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 120
ret

.global main
main:
main_prologue:
stp x29, x30, [sp, -144]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add r30, x13, 96
add r31, x13, 104
add r32, x13, 112
add r33, x13, 120
add r34, x13, 128
add r35, x13, 136
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r6, x0
ldr r7, =read_scratch
ldr r7, [r7]
str r7, [r31]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r8, x0
ldr r9, =read_scratch
ldr r9, [r9]
str r9, [r32]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r10, x0
ldr r11, =read_scratch
ldr r11, [r11]
str r11, [r33]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r12, x0
ldr r13, =read_scratch
ldr r13, [r13]
str r13, [r34]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r14, x0
ldr r15, =read_scratch
ldr r15, [r15]
str r15, [r35]
ldr r16, [r31]
mov x0, r16
bl tailrecursive
ldr r17, [r31]
ldr x0, =println
mov x1, r17
bl printf
mov r18, x0
ldr r19, [r32]
mov x0, r19
bl domath
ldr r20, [r32]
ldr x0, =println
mov x1, r20
bl printf
mov r21, x0
ldr r22, [r33]
mov x0, r22
bl objinstantiation
ldr r23, [r33]
ldr x0, =println
mov x1, r23
bl printf
mov r24, x0
ldr r25, [r34]
ldr r26, [r35]
mov x0, r25
mov x1, r26
bl ackermann
mov r27, x0
ldr x0, =println
mov x1, r27
bl printf
mov r28, x0
str 0, [r30]
b main_returnLabel

main_returnLabel:
ldr r29, [r30]
mov x0, r29
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 144
ret

