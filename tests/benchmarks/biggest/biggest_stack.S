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
.global getIntList
getIntList:
getIntList_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x24, sp, 96
add x22, sp, 104
add x25, sp, 112
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x22]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x25]
ldr x6, [x25]
mov x4, 0
mov x11, 1
sub x11, x4, x11
cmp x6, x11
cset x11, eq
cmp x11, 0
bne getIntList_lab0
b getIntList_lab1

getIntList_lab0:
ldr x6, [x22]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x4, [x25]
str x4, [x11]
ldr x11, [x22]
mov x6, 1
mov x4, 8
mul x4, x6, x4
add x11, x11, x4
mov x4, null
str x4, [x11]
ldr x11, [x22]
str x11, [x24]
b getIntList_returnLabel

getIntList_lab1:
ldr x6, [x22]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x4, x6, x11
ldr x11, [x25]
str x11, [x4]
ldr x11, [x22]
mov x6, 1
mov x4, 8
mul x4, x6, x4
add x25, x11, x4
bl getIntList
mov x11, x0
str x11, [x25]
ldr x11, [x22]
str x11, [x24]
b getIntList_returnLabel

getIntList_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global biggest
biggest:
biggest_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x9, x1
add x4, sp, 96
add x6, sp, 104
add x24, sp, 112
str x11, [x6]
str x9, [x24]
ldr x11, [x6]
ldr x9, [x24]
cmp x11, x9
cset x11, gt
cmp x11, 0
bne biggest_lab0
b biggest_lab1

biggest_lab0:
ldr x11, [x6]
str x11, [x4]
b biggest_returnLabel

biggest_lab1:
ldr x11, [x24]
str x11, [x4]
b biggest_returnLabel

biggest_returnLabel:
ldr x11, [x4]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global biggestInList
biggestInList:
biggestInList_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
add x25, sp, 104
add x22, sp, 112
str x11, [x25]
ldr x4, [x25]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x11, [x11]
str x11, [x22]
ldr x11, [x25]
mov x4, 1
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x11, [x11]
cmp x11, null
cset x11, ne
cmp x11, 0
bne biggestInList_lab0
b biggestInList_lab1

biggestInList_lab0:
ldr x4, [x22]
ldr x6, [x25]
mov x11, 0
mov x9, 8
mul x11, x11, x9
add x11, x6, x11
ldr x11, [x11]
mov x0, x4
mov x1, x11
bl biggest
mov x11, x0
str x11, [x22]
ldr x4, [x25]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
str x11, [x25]
ldr x4, [x25]
mov x11, 1
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x11, [x11]
cmp x11, null
cset x11, ne
cmp x11, 0
bne biggestInList_lab0
b biggestInList_lab1

biggestInList_lab1:
ldr x11, [x22]
str x11, [x24]
b biggestInList_returnLabel

biggestInList_returnLabel:
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
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x24, sp, 96
add x22, sp, 104
bl getIntList
mov x11, x0
str x11, [x22]
ldr x11, [x22]
mov x0, x11
bl biggestInList
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
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

