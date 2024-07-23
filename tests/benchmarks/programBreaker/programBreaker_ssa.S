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

mov x4, x0
mov x24, x1
cmp x4, 0
cset x11, eq
cmp x11, 0
mov x11, x24
bne fun2_returnLabel
b fun2_lab1

fun2_lab1:
mov x11, 1
sub x11, x4, x11
mov x0, x11
mov x1, x24
bl fun2
mov x11, x0
mov x11, x11
b fun2_returnLabel

fun2_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x6, x0
mov x4, x1
mov x9, x2
mov x11, 2
mul x24, x6, x11
mov x11, 11
sub x24, x11, x24
mov x11, 4
sdiv x11, x11, x4
add x11, x24, x11
add x24, x11, x9
cmp x24, x4
cset x11, gt
cmp x11, 0
bne fun1_lab0
b fun1_lab1

fun1_lab0:
mov x0, x24
mov x1, x6
bl fun2
mov x11, x0
mov x11, x11
b fun1_returnLabel

fun1_lab1:
cmp x24, x4
cset x11, le
mov x6, 1
and x11, x6, x11
cmp x11, 0
mov x11, x24
bne fun1_lab2
b fun1_returnLabel

fun1_lab2:
mov x0, x24
mov x1, x4
bl fun2
mov x11, x0
mov x11, x11
b fun1_returnLabel

fun1_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
cmp x11, 10000
cset x4, lt
cmp x4, 0
mov x24, x11
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov x24, x11
b main_lab0

main_lab0:
mov x0, 3
mov x1, x24
mov x2, 5
bl fun1
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 1
add x11, x24, x11
cmp x11, 10000
cset x4, lt
cmp x4, 0
bne inter_main_lab0
b main_returnLabel

main_returnLabel:
mov x0, 0
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

