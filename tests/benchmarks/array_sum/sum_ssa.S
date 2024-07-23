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

mov x9, x0
mov x24, x1
mov x11, x2
cmp x11, x24
cset x4, ge
cmp x4, 0
mov x4, 0
bne sum_returnLabel
b sum_lab2

sum_lab2:
mov x6, x11
mov x4, 8
mul x4, x6, x4
add x4, x9, x4
ldr x22, [x4]
mov x4, 1
add x11, x11, x4
mov x0, x9
mov x1, x24
mov x2, x11
bl sum
mov x11, x0
add x11, x22, x11
mov x4, x11
b sum_returnLabel

sum_returnLabel:
mov x0, x4
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
stp x29, x30, [sp, -176]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x11, sp, 96
mov x25, x11
mov x11, 1
cmp x11, 0
mov x24, 0
mov x11, x25
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov x24, x4
b main_lab0

main_lab0:
mov x4, x24
mov x11, 8
mul x11, x4, x11
add x22, x25, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x22]
mov x11, 1
add x4, x24, x11
cmp x4, 10
cset x11, lt
cmp x11, 0
mov x11, x25
bne inter_main_lab0
b main_returnLabel

main_returnLabel:
mov x0, x11
mov x1, 10
mov x2, 0
bl sum
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x0, 0
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 176
ret

