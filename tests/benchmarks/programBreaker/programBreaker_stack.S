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
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x4, x1
add x24, sp, 96
add x9, sp, 104
add x6, sp, 112
str x11, [x9]
str x4, [x6]
ldr x11, [x9]
cmp x11, 0
cset x11, eq
cmp x11, 0
bne fun2_lab0
b fun2_lab1

fun2_lab0:
ldr x11, [x6]
str x11, [x24]
b fun2_returnLabel

fun2_lab1:
ldr x11, [x9]
mov x4, 1
sub x11, x11, x4
ldr x4, [x6]
mov x0, x11
mov x1, x4
bl fun2
mov x11, x0
str x11, [x24]
b fun2_returnLabel

fun2_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global fun1
fun1:
fun1_prologue:
stp x29, x30, [sp, -144]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x27, x0
mov x9, x1
mov x11, x2
add x22, sp, 96
add x25, sp, 104
add x6, sp, 112
add x24, sp, 120
add x4, sp, 128
str x27, [x25]
str x9, [x6]
str x11, [x24]
mov x11, 5
mov x9, 6
add x2, x11, x9
ldr x9, [x25]
mov x11, 2
mul x11, x9, x11
sub x9, x2, x11
ldr x11, [x6]
mov x2, 4
sdiv x11, x2, x11
add x11, x9, x11
ldr x24, [x24]
add x11, x11, x24
str x11, [x4]
ldr x11, [x4]
ldr x24, [x6]
cmp x11, x24
cset x11, gt
cmp x11, 0
bne fun1_lab0
b fun1_lab1

fun1_lab0:
ldr x11, [x4]
ldr x4, [x25]
mov x0, x11
mov x1, x4
bl fun2
mov x11, x0
str x11, [x22]
b fun1_returnLabel

fun1_lab1:
mov x11, 5
cmp x11, 6
cset x24, lt
ldr x9, [x4]
ldr x11, [x6]
cmp x9, x11
cset x11, le
and x11, x24, x11
cmp x11, 0
bne fun1_lab2
b fun1_lab3

fun1_lab2:
ldr x4, [x4]
ldr x11, [x6]
mov x0, x4
mov x1, x11
bl fun2
mov x11, x0
str x11, [x22]
b fun1_returnLabel

fun1_lab3:
b fun1_lab4

fun1_lab4:
b fun1_lab5

fun1_lab5:
ldr x11, [x4]
str x11, [x22]
b fun1_returnLabel

fun1_returnLabel:
ldr x11, [x22]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 144
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

add x24, sp, 96
add x22, sp, 104
mov x11, 0
str x11, [x22]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x22]
ldr x11, [x22]
cmp x11, 10000
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab0:
ldr x11, [x22]
mov x0, 3
mov x1, x11
mov x2, 5
bl fun1
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x4, [x22]
mov x11, 1
add x11, x4, x11
str x11, [x22]
ldr x11, [x22]
cmp x11, 10000
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab1:
mov x11, 0
str x11, [x24]
b main_returnLabel

main_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

