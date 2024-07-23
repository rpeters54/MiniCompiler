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
.global sort
sort:
sort_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
mov r45, 0
cmp r45, r1
cset r2, lt
cmp r2, 0
mov r3, r0
mov r4, r1
mov r5, 0
bne sort_lab0
b sort_returnLabel

inter_sort_lab0:
mov r3, r35
mov r4, r36
mov r5, r39
b sort_lab0

sort_lab0:
cmp r5, 0
cset r6, gt
mov r50, r5
mov r51, 8
mul r49, r50, r51
add r7, r3, r49
ldr r8, [r7]
mov r53, 1
sub r9, r5, r53
mov r58, r9
mov r59, 8
mul r57, r58, r59
add r10, r3, r57
ldr r11, [r10]
cmp r8, r11
cset r12, lt
and r13, r6, r12
cmp r13, 0
mov r17, r5
mov r35, r3
mov r36, r4
mov r37, r5
bne sort_lab1
b sort_lab2

inter_sort_lab1:
mov r17, r26
b sort_lab1

sort_lab1:
mov r64, r17
mov r65, 8
mul r63, r64, r65
add r18, r3, r63
ldr r19, [r18]
mov r70, r17
mov r71, 8
mul r69, r70, r71
add r20, r3, r69
mov r73, 1
sub r21, r17, r73
mov r78, r21
mov r79, 8
mul r77, r78, r79
add r22, r3, r77
ldr r23, [r22]
str r23, [r20]
mov r81, 1
sub r24, r17, r81
mov r86, r24
mov r87, 8
mul r85, r86, r87
add r25, r3, r85
str r19, [r25]
mov r89, 1
sub r26, r17, r89
cmp r26, 0
cset r27, gt
mov r94, r26
mov r95, 8
mul r93, r94, r95
add r28, r3, r93
ldr r29, [r28]
mov r97, 1
sub r30, r26, r97
mov r102, r30
mov r103, 8
mul r101, r102, r103
add r31, r3, r101
ldr r32, [r31]
cmp r29, r32
cset r33, lt
and r34, r27, r33
cmp r34, 0
mov r35, r3
mov r36, r4
mov r37, r5
bne sort_lab1
b sort_lab2

sort_lab2:
mov r105, 1
add r39, r37, r105
cmp r39, r36
cset r40, lt
cmp r40, 0
bne sort_lab0
b sort_returnLabel

sort_returnLabel:
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
stp x29, x30, [sp, -176]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add r43, x13, 96
mov r1, r43
mov r24, 1
cmp r24, 0
mov r4, 0
mov r10, r1
bne main_lab0
b main_lab1

inter_main_lab0:
mov r4, r8
b main_lab0

main_lab0:
mov r29, r4
mov r30, 8
mul r28, r29, r30
add r5, r1, r28
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r6, x0
ldr r7, =read_scratch
ldr r7, [r7]
str r7, [r5]
mov r32, 1
add r8, r4, r32
cmp r8, 10
cset r9, lt
cmp r9, 0
mov r10, r1
bne main_lab0
b main_lab1

main_lab1:
mov x0, r10
mov x1, 10
bl sort
mov r34, 1
cmp r34, 0
mov r14, 0
bne main_lab2
b main_returnLabel

inter_main_lab2:
mov r14, r18
b main_lab2

main_lab2:
mov r39, r14
mov r40, 8
mul r38, r39, r40
add r15, r10, r38
ldr r16, [r15]
ldr x0, =println
mov x1, r16
bl printf
mov r17, x0
mov r42, 1
add r18, r14, r42
cmp r18, 10
cset r19, lt
cmp r19, 0
bne main_lab2
b main_returnLabel

main_returnLabel:
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 176
ret

