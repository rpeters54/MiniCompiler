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
.global swapped
swapped:
    .xword 0x0

.text
.global compare
compare:
compare_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x6, x0
mov x4, x1
mov x24, 0
mov x11, 8
mul x11, x24, x11
add x11, x6, x11
ldr x24, [x11]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x11, [x11]
sub x11, x24, x11
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global deathSort
deathSort:
deathSort_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x4, 1
cmp x4, 0
mov x22, x11
bne deathSort_lab0
b deathSort_returnLabel

inter_deathSort_lab0:
mov x22, x6
b deathSort_lab0

deathSort_lab0:
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
cmp x11, x22
cset x11, ne
cmp x11, 0
mov x24, 0
mov x25, x22
mov x6, x22
mov x4, 0
bne deathSort_lab1
b deathSort_lab5

inter_deathSort_lab1:
mov x24, x24
mov x25, x11
b deathSort_lab1

deathSort_lab1:
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x25, x11
ldr x11, [x11]
mov x0, x25
mov x1, x11
bl compare
mov x11, x0
cmp x11, 0
cset x11, gt
cmp x11, 0
mov x24, x24
mov x9, x25
mov x6, x22
bne deathSort_lab2
b deathSort_lab4

deathSort_lab2:
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x25, x11
ldr x24, [x11]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x4, x25, x11
mov x11, 2
mov x6, 8
mul x11, x11, x6
add x11, x25, x11
ldr x9, [x11]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x9, x11
ldr x11, [x11]
str x11, [x4]
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x25, x11
ldr x4, [x11]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
str x24, [x11]
mov x24, 1
mov x9, x25
mov x6, x22
b deathSort_lab4

deathSort_lab4:
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x11, [x11]
mov x4, 2
mov x9, 8
mul x4, x4, x9
add x4, x11, x4
ldr x4, [x4]
cmp x4, x6
cset x4, ne
cmp x4, 0
mov x6, x6
mov x4, x24
bne inter_deathSort_lab1
b deathSort_lab5

deathSort_lab5:
cmp x4, 1
cset x11, eq
cmp x11, 0
bne inter_deathSort_lab0
b deathSort_returnLabel

deathSort_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global printEVILList
printEVILList:
printEVILList_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x22, x0
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x24, [x11]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, x22
mov x0, x11
bl free
cmp x24, x22
cset x11, ne
cmp x11, 0
mov x25, x24
bne printEVILList_lab0
b printEVILList_returnLabel

inter_printEVILList_lab0:
mov x25, x24
b printEVILList_lab0

printEVILList_lab0:
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x25, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x25, x11
ldr x24, [x11]
mov x11, x25
mov x0, x11
bl free
cmp x24, x22
cset x11, ne
cmp x11, 0
bne inter_printEVILList_lab0
b printEVILList_returnLabel

printEVILList_returnLabel:
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

mov x4, 666
ldr x11, =swapped
str x4, [x11]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x4, =read_scratch
ldr x4, [x4]
cmp x4, 0
cset x11, le
cmp x11, 0
bne main_lab0
b main_lab2

main_lab0:
ldr x0, =println
mov x1, -1
bl printf
mov x11, x0
mov x11, -1
b main_returnLabel

main_lab2:
mov x11, 1000
mul x22, x4, x11
mov x0, 24
bl malloc
mov x11, x0
mov x24, x11
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
str x22, [x11]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
str x24, [x11]
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
str x24, [x11]
mov x11, 1
sub x4, x22, x11
cmp x4, 0
cset x11, gt
cmp x11, 0
mov x25, x24
mov x27, x4
mov x22, x24
bne main_lab3
b main_lab4

inter_main_lab3:
mov x25, x6
mov x27, x4
b main_lab3

main_lab3:
mov x0, 24
bl malloc
mov x11, x0
mov x6, x11
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
str x27, [x11]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
str x25, [x11]
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
str x24, [x11]
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x25, x11
str x6, [x11]
mov x11, 1
sub x4, x27, x11
cmp x4, 0
cset x11, gt
cmp x11, 0
mov x22, x24
bne inter_main_lab3
b main_lab4

main_lab4:
mov x0, x22
bl deathSort
mov x0, x22
bl printEVILList
mov x11, 0
b main_returnLabel

main_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

