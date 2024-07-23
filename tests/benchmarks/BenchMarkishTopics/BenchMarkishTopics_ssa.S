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
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
cmp x24, null
cset x11, eq
cmp x11, 0
mov x11, 0
bne length_returnLabel
b length_lab2

length_lab2:
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
bl length
mov x4, x0
mov x11, 1
add x11, x11, x4
mov x11, x11
b length_returnLabel

length_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global addToFront
addToFront:
addToFront_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
mov x22, x1
cmp x24, null
cset x11, eq
cmp x11, 0
bne addToFront_lab0
b addToFront_lab2

addToFront_lab0:
mov x0, 16
bl malloc
mov x11, x0
mov x24, x11
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
str x22, [x11]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x4, x24, x11
mov x11, null
str x11, [x4]
mov x11, x24
b addToFront_returnLabel

addToFront_lab2:
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
mov x4, 0
mov x6, 8
mul x4, x4, x6
add x4, x11, x4
str x22, [x4]
mov x4, 1
mov x6, 8
mul x4, x4, x6
add x4, x11, x4
str x24, [x4]
mov x11, x11
b addToFront_returnLabel

addToFront_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global deleteFirst
deleteFirst:
deleteFirst_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
cmp x11, null
cset x4, eq
cmp x4, 0
mov x4, null
bne deleteFirst_returnLabel
b deleteFirst_lab2

deleteFirst_lab2:
mov x4, 1
mov x24, 8
mul x4, x4, x24
add x4, x11, x4
ldr x24, [x4]
mov x11, x11
mov x0, x11
bl free
mov x4, x24
b deleteFirst_returnLabel

deleteFirst_returnLabel:
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
ldr x4, =intList
str x11, [x4]
ldr x11, =intList
ldr x11, [x11]
cmp x11, 0
cset x11, gt
cmp x11, 0
mov x4, null
mov x24, 0
mov x25, null
bne main_lab0
b main_lab1

inter_main_lab0:
mov x4, x22
b main_lab0

main_lab0:
ldr x11, =intList
ldr x11, [x11]
mov x0, x4
mov x1, x11
bl addToFront
mov x22, x0
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
ldr x11, =intList
ldr x11, [x11]
mov x4, 1
sub x4, x11, x4
ldr x11, =intList
str x4, [x11]
ldr x11, =intList
ldr x11, [x11]
cmp x11, 0
cset x11, gt
cmp x11, 0
mov x24, 0
mov x25, x22
bne inter_main_lab0
b main_lab1

main_lab1:
mov x0, x25
bl length
mov x11, x0
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
mov x0, x25
bl length
mov x11, x0
cmp x11, 0
cset x11, gt
cmp x11, 0
mov x6, x24
mov x22, x25
mov x11, x24
bne main_lab2
b main_returnLabel

inter_main_lab2:
mov x6, x24
mov x22, x22
b main_lab2

main_lab2:
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
ldr x11, [x11]
add x24, x6, x11
mov x0, x22
bl length
mov x11, x0
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
mov x0, x22
bl deleteFirst
mov x22, x0
mov x0, x22
bl length
mov x11, x0
cmp x11, 0
cset x11, gt
cmp x11, 0
mov x11, x24
bne inter_main_lab2
b main_returnLabel

main_returnLabel:
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
ldp x29, x30, [sp], 96
ret

