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
.global GLOBAL
GLOBAL:
    .xword 0x0
.global count
count:
    .xword 0x0

.text
.global fun2
fun2:
fun2_prologue:
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
mov r8, r1
bne fun2_returnLabel
b fun2_lab1

fun2_lab1:
mov r10, 1
sub r5, r0, r10
mov x0, r5
mov x1, r1
bl fun2
mov r7, x0
mov r8, r7
b fun2_returnLabel

fun2_returnLabel:
mov x0, r8
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global fun1
fun1:
fun1_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
mov r2, x2
mov r24, 2
mul r4, r0, r24
mov r26, 11
sub r5, r26, r4
mov r28, 4
sdiv r6, r28, r1
add r7, r5, r6
add r8, r7, r2
cmp r8, r1
cset r9, gt
cmp r9, 0
bne fun1_lab0
b fun1_lab1

fun1_lab0:
mov x0, r8
mov x1, r0
bl fun2
mov r12, x0
mov r22, r12
b fun1_returnLabel

fun1_lab1:
cmp r8, r1
cset r16, le
mov r30, 1
and r17, r30, r16
cmp r17, 0
mov r22, r8
bne fun1_lab2
b fun1_returnLabel

fun1_lab2:
mov x0, r8
mov x1, r1
bl fun2
mov r20, x0
mov r22, r20
b fun1_returnLabel

fun1_returnLabel:
mov x0, r22
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
cmp r1, 10000
cset r2, lt
cmp r2, 0
mov r3, r1
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov r3, r6
b main_lab0

main_lab0:
mov x0, 3
mov x1, r3
mov x2, 5
bl fun1
mov r4, x0
ldr x0, =println
mov x1, r4
bl printf
mov r5, x0
mov r11, 1
add r6, r3, r11
cmp r6, 10000
cset r7, lt
cmp r7, 0
bne main_lab0
b main_returnLabel

main_returnLabel:
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

