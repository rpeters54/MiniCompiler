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
.global function
function:
function_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r32, x13, 96
add r33, x13, 104
add r34, x13, 112
add r35, x13, 120
str r0, [r33]
ldr r5, [r33]
cmp r5, 0
cset r6, le
cmp r6, 0
bne function_lab0
b function_lab1

function_lab0:
str 0, [r32]
b function_returnLabel

function_lab1:
b function_lab2

function_lab2:
str 0, [r34]
ldr r7, [r34]
ldr r8, [r33]
ldr r9, [r33]
mul r10, r8, r9
cmp r7, r10
cset r11, lt
cmp r11, 0
bne function_lab3
b function_lab4

function_lab3:
ldr r12, [r34]
ldr r13, [r33]
add r14, r12, r13
str r14, [r35]
ldr r15, [r35]
ldr x0, =print
mov x1, r15
bl printf
mov r16, x0
ldr r17, [r34]
mov r29, 1
add r18, r17, r29
str r18, [r34]
ldr r19, [r34]
ldr r20, [r33]
ldr r21, [r33]
mul r22, r20, r21
cmp r19, r22
cset r23, lt
cmp r23, 0
bne function_lab3
b function_lab4

function_lab4:
ldr r24, [r33]
mov r31, 1
sub r25, r24, r31
mov x0, r25
bl function
mov r26, x0
str r26, [r32]
b function_returnLabel

function_returnLabel:
ldr r27, [r32]
mov x0, r27
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global main
main:
main_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add r8, x13, 96
add r9, x13, 104
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r2, x0
ldr r3, =read_scratch
ldr r3, [r3]
str r3, [r9]
ldr r4, [r9]
mov x0, r4
bl function
mov r5, x0
ldr x0, =println
mov x1, 0
bl printf
mov r6, x0
str 0, [r8]
b main_returnLabel

main_returnLabel:
ldr r7, [r8]
mov x0, r7
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 112
ret

