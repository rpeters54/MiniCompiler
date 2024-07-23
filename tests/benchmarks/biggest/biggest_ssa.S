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
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x0, 16
bl malloc
mov x11, x0
mov x24, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x4, =read_scratch
ldr x4, [x4]
cmp x4, -1
cset x11, eq
cmp x11, 0
bne getIntList_lab0
b getIntList_lab1

getIntList_lab0:
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x24, x11
str x4, [x11]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x4, x24, x11
mov x11, null
str x11, [x4]
mov x11, x24
b getIntList_returnLabel

getIntList_lab1:
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x24, x11
str x4, [x11]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x22, x24, x11
bl getIntList
mov x11, x0
str x11, [x22]
mov x11, x24
b getIntList_returnLabel

getIntList_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global biggest
biggest:
biggest_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
mov x24, x1
cmp x4, x24
cset x11, gt
cmp x11, 0
mov x11, x4
bne biggest_returnLabel
b biggest_lab1

biggest_lab1:
mov x11, x24
b biggest_returnLabel

biggest_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global biggestInList
biggestInList:
biggestInList_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x4, [x11]
mov x11, 1
mov x6, 8
mul x11, x11, x6
add x11, x24, x11
ldr x11, [x11]
cmp x11, null
cset x11, ne
cmp x11, 0
mov x6, x4
mov x24, x24
mov x4, x4
bne biggestInList_lab0
b biggestInList_returnLabel

inter_biggestInList_lab0:
mov x6, x11
mov x24, x24
b biggestInList_lab0

biggestInList_lab0:
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
mov x0, x6
mov x1, x11
bl biggest
mov x11, x0
mov x4, 1
mov x6, 8
mul x4, x4, x6
add x4, x24, x4
ldr x24, [x4]
mov x6, 1
mov x4, 8
mul x4, x6, x4
add x4, x24, x4
ldr x4, [x4]
cmp x4, null
cset x4, ne
cmp x4, 0
mov x4, x11
bne inter_biggestInList_lab0
b biggestInList_returnLabel

biggestInList_returnLabel:
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

bl getIntList
mov x11, x0
mov x0, x11
bl biggestInList
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
ldp x29, x30, [sp], 96
ret

