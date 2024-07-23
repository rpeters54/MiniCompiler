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
.global intList
intList:
    .xword 0x0

.text
.global length
length:
length_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
add x4, sp, 104
str x11, [x4]
ldr x11, [x4]
cmp x11, null
cset x11, eq
cmp x11, 0
bne length_lab0
b length_lab1

length_lab0:
mov x11, 0
str x11, [x24]
b length_returnLabel

length_lab1:
b length_lab2

length_lab2:
ldr x6, [x4]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
mov x0, x11
bl length
mov x4, x0
mov x11, 1
add x11, x11, x4
str x11, [x24]
b length_returnLabel

length_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global addToFront
addToFront:
addToFront_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
mov x11, x1
add x25, sp, 96
add x22, sp, 104
add x24, sp, 112
add x27, sp, 120
str x4, [x22]
str x11, [x24]
ldr x11, [x22]
cmp x11, null
cset x11, eq
cmp x11, 0
bne addToFront_lab0
b addToFront_lab1

addToFront_lab0:
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x22]
ldr x6, [x22]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x4, x6, x11
ldr x11, [x24]
str x11, [x4]
ldr x4, [x22]
mov x24, 1
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
mov x4, null
str x4, [x11]
ldr x11, [x22]
str x11, [x25]
b addToFront_returnLabel

addToFront_lab1:
b addToFront_lab2

addToFront_lab2:
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x27]
ldr x4, [x27]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x4, x4, x11
ldr x11, [x24]
str x11, [x4]
ldr x11, [x27]
mov x4, 1
mov x24, 8
mul x4, x4, x24
add x4, x11, x4
ldr x11, [x22]
str x11, [x4]
ldr x11, [x27]
str x11, [x25]
b addToFront_returnLabel

addToFront_returnLabel:
ldr x11, [x25]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global deleteFirst
deleteFirst:
deleteFirst_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x25, sp, 96
add x22, sp, 104
add x4, sp, 112
str x11, [x22]
ldr x11, [x22]
cmp x11, null
cset x11, eq
cmp x11, 0
bne deleteFirst_lab0
b deleteFirst_lab1

deleteFirst_lab0:
mov x11, null
str x11, [x25]
b deleteFirst_returnLabel

deleteFirst_lab1:
b deleteFirst_lab2

deleteFirst_lab2:
ldr x11, [x22]
str x11, [x4]
ldr x6, [x22]
mov x24, 1
mov x11, 8
mul x11, x24, x11
add x11, x6, x11
ldr x11, [x11]
str x11, [x22]
ldr x11, [x4]
mov x11, x11
mov x0, x11
bl free
ldr x11, [x22]
str x11, [x25]
b deleteFirst_returnLabel

deleteFirst_returnLabel:
ldr x11, [x25]
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
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x22, sp, 96
add x25, sp, 104
add x24, sp, 112
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x4, =read_scratch
ldr x4, [x4]
ldr x11, =intList
str x4, [x11]
mov x11, 0
str x11, [x24]
mov x11, null
str x11, [x25]
ldr x11, =intList
ldr x11, [x11]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab0:
ldr x4, [x25]
ldr x11, =intList
ldr x11, [x11]
mov x0, x4
mov x1, x11
bl addToFront
mov x11, x0
str x11, [x25]
ldr x4, [x25]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
ldr x4, =intList
ldr x4, [x4]
mov x11, 1
sub x4, x4, x11
ldr x11, =intList
str x4, [x11]
ldr x11, =intList
ldr x11, [x11]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab1:
ldr x11, [x25]
mov x0, x11
bl length
mov x11, x0
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x25]
mov x0, x11
bl length
mov x11, x0
cmp x11, 0
cset x11, gt
cmp x11, 0
bne main_lab2
b main_lab3

main_lab2:
ldr x4, [x24]
ldr x9, [x25]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x9, x11
ldr x11, [x11]
add x11, x4, x11
str x11, [x24]
ldr x11, [x25]
mov x0, x11
bl length
mov x11, x0
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x25]
mov x0, x11
bl deleteFirst
mov x11, x0
str x11, [x25]
ldr x11, [x25]
mov x0, x11
bl length
mov x11, x0
cmp x11, 0
cset x11, gt
cmp x11, 0
bne main_lab2
b main_lab3

main_lab3:
ldr x11, [x24]
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
ldp x29, x30, [sp], 128
ret

