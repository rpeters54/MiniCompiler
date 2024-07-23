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
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x9, x0
mov x4, x1
add x6, sp, 96
add x11, sp, 104
add x24, sp, 112
str x9, [x11]
str x4, [x24]
ldr x9, [x11]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x9, x11
ldr x9, [x11]
ldr x4, [x24]
mov x24, 0
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
sub x11, x9, x11
str x11, [x6]
b compare_returnLabel

compare_returnLabel:
ldr x11, [x6]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global deathSort
deathSort:
deathSort_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x22, sp, 96
add x24, sp, 104
add x27, sp, 112
add x25, sp, 120
str x11, [x22]
mov x11, 1
str x11, [x24]
ldr x11, [x24]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne deathSort_lab0
b deathSort_lab6

deathSort_lab0:
mov x11, 0
str x11, [x24]
ldr x11, [x22]
str x11, [x25]
ldr x4, [x25]
mov x6, 2
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
ldr x4, [x22]
cmp x11, x4
cset x11, ne
cmp x11, 0
bne deathSort_lab1
b deathSort_lab5

deathSort_lab1:
ldr x9, [x25]
ldr x6, [x25]
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x11, [x11]
mov x0, x9
mov x1, x11
bl compare
mov x11, x0
cmp x11, 0
cset x11, gt
cmp x11, 0
bne deathSort_lab2
b deathSort_lab3

deathSort_lab2:
ldr x6, [x25]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
str x11, [x27]
ldr x4, [x25]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x4, x4, x11
ldr x11, [x25]
mov x9, 2
mov x6, 8
mul x6, x9, x6
add x11, x11, x6
ldr x9, [x11]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x9, x11
ldr x11, [x11]
str x11, [x4]
ldr x11, [x25]
mov x4, 2
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x4, [x11]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x4, [x27]
str x4, [x11]
mov x11, 1
str x11, [x24]
b deathSort_lab4

deathSort_lab3:
b deathSort_lab4

deathSort_lab4:
ldr x6, [x25]
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
str x11, [x25]
ldr x4, [x25]
mov x6, 2
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
ldr x4, [x22]
cmp x11, x4
cset x11, ne
cmp x11, 0
bne deathSort_lab1
b deathSort_lab5

deathSort_lab5:
ldr x11, [x24]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne deathSort_lab0
b deathSort_lab6

deathSort_lab6:
b deathSort_returnLabel

deathSort_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global printEVILList
printEVILList:
printEVILList_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
add x22, sp, 104
add x25, sp, 112
str x11, [x24]
ldr x4, [x24]
mov x6, 2
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
str x11, [x22]
ldr x4, [x24]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x11, x11
mov x0, x11
bl free
ldr x11, [x22]
ldr x4, [x24]
cmp x11, x4
cset x11, ne
cmp x11, 0
bne printEVILList_lab0
b printEVILList_lab1

printEVILList_lab0:
ldr x11, [x22]
str x11, [x25]
ldr x6, [x22]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x6, [x22]
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
str x11, [x22]
ldr x11, [x25]
mov x11, x11
mov x0, x11
bl free
ldr x4, [x22]
ldr x11, [x24]
cmp x4, x11
cset x11, ne
cmp x11, 0
bne printEVILList_lab0
b printEVILList_lab1

printEVILList_lab1:
b printEVILList_returnLabel

printEVILList_returnLabel:
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
stp x29, x30, [sp, -144]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x24, sp, 96
add x21, sp, 104
add x25, sp, 112
add x27, sp, 120
add x22, sp, 128
add x23, sp, 136
mov x4, 666
ldr x11, =swapped
str x4, [x11]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x21]
ldr x11, [x21]
cmp x11, 0
cset x11, le
cmp x11, 0
bne main_lab0
b main_lab1

main_lab0:
mov x4, 0
mov x11, 1
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 0
mov x11, 1
sub x11, x4, x11
str x11, [x24]
b main_returnLabel

main_lab1:
b main_lab2

main_lab2:
ldr x4, [x21]
mov x11, 1000
mul x11, x4, x11
str x11, [x21]
ldr x11, [x21]
str x11, [x25]
mov x0, 24
bl malloc
mov x11, x0
mov x11, x11
str x11, [x22]
ldr x4, [x22]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x4, [x25]
str x4, [x11]
ldr x4, [x22]
mov x11, 1
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x4, [x22]
str x4, [x11]
ldr x4, [x22]
mov x11, 2
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x4, [x22]
str x4, [x11]
ldr x4, [x25]
mov x11, 1
sub x11, x4, x11
str x11, [x25]
ldr x11, [x22]
str x11, [x23]
ldr x11, [x25]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne main_lab3
b main_lab4

main_lab3:
mov x0, 24
bl malloc
mov x11, x0
mov x11, x11
str x11, [x27]
ldr x6, [x27]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x4, x6, x11
ldr x11, [x25]
str x11, [x4]
ldr x4, [x27]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x4, [x23]
str x4, [x11]
ldr x6, [x27]
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x4, x6, x11
ldr x11, [x22]
str x11, [x4]
ldr x11, [x23]
mov x6, 2
mov x4, 8
mul x4, x6, x4
add x11, x11, x4
ldr x4, [x27]
str x4, [x11]
ldr x11, [x27]
str x11, [x23]
ldr x11, [x25]
mov x4, 1
sub x11, x11, x4
str x11, [x25]
ldr x11, [x25]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne main_lab3
b main_lab4

main_lab4:
ldr x11, [x22]
mov x0, x11
bl deathSort
ldr x11, [x22]
mov x0, x11
bl printEVILList
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
ldp x29, x30, [sp], 144
ret

