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
stp x29, x30, [sp, -144]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x4, x1
add x22, sp, 96
add x6, sp, 104
add x9, sp, 112
add x2, sp, 120
add x24, sp, 128
str x11, [x22]
str x4, [x6]
mov x11, 0
str x11, [x9]
ldr x11, [x9]
ldr x4, [x6]
cmp x11, x4
cset x11, lt
cmp x11, 0
bne sort_lab0
b sort_lab3

sort_lab0:
ldr x11, [x9]
str x11, [x24]
ldr x11, [x24]
cmp x11, 0
cset x27, gt
ldr x4, [x22]
ldr x11, [x24]
mov x25, x11
mov x11, 8
mul x11, x25, x11
add x11, x4, x11
ldr x4, [x11]
ldr x12, [x22]
ldr x11, [x24]
mov x25, 1
sub x11, x11, x25
mov x25, x11
mov x11, 8
mul x11, x25, x11
add x11, x12, x11
ldr x11, [x11]
cmp x4, x11
cset x11, lt
and x11, x27, x11
cmp x11, 0
bne sort_lab1
b sort_lab2

sort_lab1:
ldr x4, [x22]
ldr x11, [x24]
mov x11, x11
mov x25, 8
mul x11, x11, x25
add x11, x4, x11
ldr x11, [x11]
str x11, [x2]
ldr x25, [x22]
ldr x11, [x24]
mov x4, x11
mov x11, 8
mul x11, x4, x11
add x27, x25, x11
ldr x4, [x22]
ldr x11, [x24]
mov x25, 1
sub x11, x11, x25
mov x25, x11
mov x11, 8
mul x11, x25, x11
add x11, x4, x11
ldr x11, [x11]
str x11, [x27]
ldr x4, [x22]
ldr x11, [x24]
mov x25, 1
sub x11, x11, x25
mov x11, x11
mov x25, 8
mul x11, x11, x25
add x4, x4, x11
ldr x11, [x2]
str x11, [x4]
ldr x4, [x24]
mov x11, 1
sub x11, x4, x11
str x11, [x24]
ldr x11, [x24]
cmp x11, 0
cset x25, gt
ldr x2, [x22]
ldr x11, [x24]
mov x4, x11
mov x11, 8
mul x11, x4, x11
add x11, x2, x11
ldr x2, [x11]
ldr x22, [x22]
ldr x4, [x24]
mov x11, 1
sub x11, x4, x11
mov x11, x11
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
cmp x2, x11
cset x11, lt
and x11, x25, x11
cmp x11, 0
bne sort_lab1
b sort_lab2

sort_lab2:
ldr x4, [x9]
mov x11, 1
add x11, x4, x11
str x11, [x9]
ldr x4, [x9]
ldr x11, [x6]
cmp x4, x11
cset x11, lt
cmp x11, 0
bne sort_lab0
b sort_lab3

sort_lab3:
b sort_returnLabel

sort_returnLabel:
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
stp x29, x30, [sp, -208]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x22, sp, 96
add x25, sp, 104
add x24, sp, 112
add x11, sp, 120
mov x11, x11
str x11, [x25]
mov x11, 0
str x11, [x24]
ldr x11, [x24]
cmp x11, 10
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab0:
ldr x11, [x25]
ldr x4, [x24]
mov x6, x4
mov x4, 8
mul x4, x6, x4
add x27, x11, x4
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x27]
ldr x4, [x24]
mov x11, 1
add x11, x4, x11
str x11, [x24]
ldr x11, [x24]
cmp x11, 10
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab1:
ldr x11, [x25]
mov x0, x11
mov x1, 10
bl sort
mov x11, 0
str x11, [x24]
ldr x11, [x24]
cmp x11, 10
cset x11, lt
cmp x11, 0
bne main_lab2
b main_lab3

main_lab2:
ldr x4, [x25]
ldr x11, [x24]
mov x6, x11
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x4, 1
add x11, x11, x4
str x11, [x24]
ldr x11, [x24]
cmp x11, 10
cset x11, lt
cmp x11, 0
bne main_lab2
b main_lab3

main_lab3:
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

