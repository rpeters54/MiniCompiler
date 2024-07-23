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
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
cmp r0, 0
cset r1, le
cmp r1, 0
bne tailrecursive_returnLabel
b tailrecursive_lab2

tailrecursive_lab2:
mov r5, 1
sub r3, r0, r5
mov x0, r3
bl tailrecursive
b tailrecursive_returnLabel

tailrecursive_returnLabel:
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
mov r1, x1
add r2, r0, r1
mov x0, r2
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global domath
domath:
domath_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov x0, 17
bl malloc
mov r1, x0
mov r2, r1
mov r69, 2
mov r70, 8
mul r68, r69, r70
add r3, r2, r68
mov x0, 8
bl malloc
mov r4, x0
mov r5, r4
str r5, [r3]
mov x0, 17
bl malloc
mov r6, x0
mov r7, r6
mov r75, 2
mov r76, 8
mul r74, r75, r76
add r8, r7, r74
mov x0, 8
bl malloc
mov r9, x0
mov r10, r9
str r10, [r8]
mov r81, 0
mov r82, 8
mul r80, r81, r82
add r11, r2, r80
str r0, [r11]
mov r87, 0
mov r88, 8
mul r86, r87, r88
add r12, r7, r86
str 3, [r12]
mov r93, 2
mov r94, 8
mul r92, r93, r94
add r13, r2, r92
ldr r14, [r13]
mov r99, 0
mov r100, 8
mul r98, r99, r100
add r15, r14, r98
mov r105, 0
mov r106, 8
mul r104, r105, r106
add r16, r2, r104
ldr r17, [r16]
str r17, [r15]
mov r111, 2
mov r112, 8
mul r110, r111, r112
add r18, r7, r110
ldr r19, [r18]
mov r117, 0
mov r118, 8
mul r116, r117, r118
add r20, r19, r116
mov r123, 0
mov r124, 8
mul r122, r123, r124
add r21, r7, r122
ldr r22, [r21]
str r22, [r20]
cmp r0, 0
cset r23, gt
cmp r23, 0
mov r25, r0
mov r54, r2
mov r56, r7
bne domath_lab0
b domath_returnLabel

inter_domath_lab0:
mov r25, r52
b domath_lab0

domath_lab0:
mov r129, 0
mov r130, 8
mul r128, r129, r130
add r27, r2, r128
ldr r28, [r27]
mov r135, 0
mov r136, 8
mul r134, r135, r136
add r29, r7, r134
ldr r30, [r29]
mov r141, 2
mov r142, 8
mul r140, r141, r142
add r32, r2, r140
ldr r33, [r32]
mov r147, 0
mov r148, 8
mul r146, r147, r148
add r34, r33, r146
ldr r35, [r34]
mov r153, 0
mov r154, 8
mul r152, r153, r154
add r37, r7, r152
ldr r38, [r37]
mov r159, 2
mov r160, 8
mul r158, r159, r160
add r40, r7, r158
ldr r41, [r40]
mov r165, 0
mov r166, 8
mul r164, r165, r166
add r42, r41, r164
ldr r43, [r42]
mov r171, 0
mov r172, 8
mul r170, r171, r172
add r44, r2, r170
ldr r45, [r44]
mov x0, r43
mov x1, r45
bl add
mov r46, x0
mov r177, 0
mov r178, 8
mul r176, r177, r178
add r47, r7, r176
ldr r48, [r47]
mov r183, 0
mov r184, 8
mul r182, r183, r184
add r49, r2, r182
ldr r50, [r49]
mov r186, 1
sub r52, r25, r186
cmp r52, 0
cset r53, gt
cmp r53, 0
mov r54, r2
mov r56, r7
bne domath_lab0
b domath_returnLabel

domath_returnLabel:
mov r191, 2
mov r192, 8
mul r190, r191, r192
add r57, r54, r190
ldr r58, [r57]
mov r197, 2
mov r198, 8
mul r196, r197, r198
add r60, r56, r196
ldr r61, [r60]
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global objinstantiation
objinstantiation:
objinstantiation_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
cmp r0, 0
cset r1, gt
cmp r1, 0
mov r2, r0
bne objinstantiation_lab0
b objinstantiation_returnLabel

inter_objinstantiation_lab0:
mov r2, r6
b objinstantiation_lab0

objinstantiation_lab0:
mov x0, 17
bl malloc
mov r3, x0
mov r10, 1
sub r6, r2, r10
cmp r6, 0
cset r7, gt
cmp r7, 0
bne objinstantiation_lab0
b objinstantiation_returnLabel

objinstantiation_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global ackermann
ackermann:
ackermann_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
cmp r0, 0
cset r2, eq
cmp r2, 0
bne ackermann_lab0
b ackermann_lab2

ackermann_lab0:
mov r18, 1
add r4, r1, r18
mov r16, r4
b ackermann_returnLabel

ackermann_lab2:
cmp r1, 0
cset r6, eq
cmp r6, 0
bne ackermann_lab3
b ackermann_lab4

ackermann_lab3:
mov r20, 1
sub r8, r0, r20
mov x0, r8
mov x1, 1
bl ackermann
mov r9, x0
mov r16, r9
b ackermann_returnLabel

ackermann_lab4:
mov r22, 1
sub r11, r0, r22
mov r24, 1
sub r13, r1, r24
mov x0, r0
mov x1, r13
bl ackermann
mov r14, x0
mov x0, r11
mov x1, r14
bl ackermann
mov r15, x0
mov r16, r15
b ackermann_returnLabel

ackermann_returnLabel:
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
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r4, x0
ldr r5, =read_scratch
ldr r5, [r5]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r6, x0
ldr r7, =read_scratch
ldr r7, [r7]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r8, x0
ldr r9, =read_scratch
ldr r9, [r9]
mov x0, r1
bl tailrecursive
ldr x0, =println
mov x1, r1
bl printf
mov r10, x0
mov x0, r3
bl domath
ldr x0, =println
mov x1, r3
bl printf
mov r11, x0
mov x0, r5
bl objinstantiation
ldr x0, =println
mov x1, r5
bl printf
mov r12, x0
mov x0, r7
mov x1, r9
bl ackermann
mov r13, x0
ldr x0, =println
mov x1, r13
bl printf
mov r14, x0
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

