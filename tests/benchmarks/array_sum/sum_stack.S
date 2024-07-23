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
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x9, x0
mov x4, x1
mov x11, x2
add x24, sp, 96
add x2, sp, 104
add x22, sp, 112
add x6, sp, 120
str x9, [x2]
str x4, [x22]
str x11, [x6]
ldr x11, [x6]
ldr x4, [x22]
cmp x11, x4
cset x11, ge
cmp x11, 0
bne sum_lab0
b sum_lab1

sum_lab0:
mov x11, 0
str x11, [x24]
b sum_returnLabel

sum_lab1:
b sum_lab2

sum_lab2:
ldr x4, [x2]
ldr x11, [x6]
mov x11, x11
mov x9, 8
mul x11, x11, x9
add x11, x4, x11
ldr x25, [x11]
ldr x9, [x2]
ldr x11, [x22]
ldr x4, [x6]
mov x6, 1
add x4, x4, x6
mov x0, x9
mov x1, x11
mov x2, x4
bl sum
mov x11, x0
add x11, x25, x11
str x11, [x24]
b sum_returnLabel

sum_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global main
main:
main_prologue:
stp x29, x30, [sp, -208]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x22, sp, 96
add x27, sp, 104
add x25, sp, 112
add x11, sp, 120
mov x11, x11
str x11, [x27]
mov x11, 0
str x11, [x25]
ldr x11, [x25]
cmp x11, 10
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab0:
ldr x11, [x27]
ldr x4, [x25]
mov x4, x4
mov x24, 8
mul x4, x4, x24
add x24, x11, x4
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x24]
ldr x4, [x25]
mov x11, 1
add x11, x4, x11
str x11, [x25]
ldr x11, [x25]
cmp x11, 10
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab1:
ldr x11, [x27]
mov x0, x11
mov x1, 10
mov x2, 0
bl sum
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 0
str x11, [x22]
b main_returnLabel

main_returnLabel:
ldr x11, [x22]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 208
ret

