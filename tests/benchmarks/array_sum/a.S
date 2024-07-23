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
.global sum
sum:
sum_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
mov r2, x2
cmp r2, r1
cset r3, ge
cmp r3, 0
mov r12, 0
bne sum_returnLabel
b sum_lab2

sum_lab2:
mov r17, r2
mov r18, 8
mul r16, r17, r18
add r6, r0, r16
ldr r7, [r6]
mov r20, 1
add r9, r2, r20
mov x0, r0
mov x1, r1
mov x2, r9
bl sum
mov r10, x0
add r11, r7, r10
mov r12, r11
b sum_returnLabel

sum_returnLabel:
mov x0, r12
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

add r25, x13, 96
mov r1, r25
mov r16, 1
cmp r16, 0
mov r4, 0
mov r10, r1
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov r4, r8
b main_lab0

main_lab0:
mov r21, r4
mov r22, 8
mul r20, r21, r22
add r5, r1, r20
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r6, x0
ldr r7, =read_scratch
ldr r7, [r7]
str r7, [r5]
mov r24, 1
add r8, r4, r24
cmp r8, 10
cset r9, lt
cmp r9, 0
mov r10, r1
bne main_lab0
b main_returnLabel

main_returnLabel:
mov x0, r10
mov x1, 10
mov x2, 0
bl sum
mov r12, x0
ldr x0, =println
mov x1, r12
bl printf
mov r13, x0
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 176
ret

