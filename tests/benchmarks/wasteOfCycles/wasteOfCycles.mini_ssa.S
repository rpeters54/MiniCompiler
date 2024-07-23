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
mov r16, 0
bne function_returnLabel
b function_lab2

function_lab2:
mul r3, r0, r0
mov r18, 0
cmp r18, r3
cset r4, lt
cmp r4, 0
mov r5, 0
mov r13, r0
bne function_lab3
b function_lab4

inter_function_lab3:
mov r5, r9
b function_lab3

function_lab3:
add r7, r5, r0
ldr x0, =print
mov x1, r7
bl printf
mov r8, x0
mov r20, 1
add r9, r5, r20
mul r10, r0, r0
cmp r9, r10
cset r11, lt
cmp r11, 0
mov r13, r0
bne function_lab3
b function_lab4

function_lab4:
mov r22, 1
sub r14, r13, r22
mov x0, r14
bl function
mov r15, x0
mov r16, r15
b function_returnLabel

function_returnLabel:
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
mov x0, r1
bl function
mov r2, x0
ldr x0, =println
mov x1, 0
bl printf
mov r3, x0
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

