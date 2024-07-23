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
.global buildList
buildList:
buildList_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x0, 16
bl malloc
mov x11, x0
mov x25, x11
mov x0, 16
bl malloc
mov x11, x0
mov x24, x11
mov x0, 16
bl malloc
mov x11, x0
mov x21, x11
mov x0, 16
bl malloc
mov x11, x0
mov x23, x11
mov x0, 16
bl malloc
mov x11, x0
mov x27, x11
mov x0, 16
bl malloc
mov x11, x0
mov x22, x11
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x26, x25, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x26]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x26, x24, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x26]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x26, x21, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x26]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x26, x23, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x26]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x26, x27, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x26]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x26, x22, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x26]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x25, x11
str x24, [x11]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
str x21, [x11]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x21, x11
str x23, [x11]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x23, x11
str x27, [x11]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x27, x11
str x22, [x11]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
mov x4, null
str x4, [x11]
mov x0, x25
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global multiple
multiple:
multiple_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
mov x11, 0
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x6, [x11]
mov x24, 1
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
mov x4, 1
cmp x4, 0
mov x9, x11
mov x24, x6
mov x25, 0
mov x4, x6
bne multiple_lab0
b multiple_returnLabel

inter_multiple_lab0:
mov x9, x24
mov x24, x22
mov x25, x11
b multiple_lab0

multiple_lab0:
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x11, [x11]
mul x22, x24, x11
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x9, x11
ldr x24, [x11]
ldr x0, =println
mov x1, x22
bl printf
mov x11, x0
mov x11, 1
add x11, x25, x11
cmp x11, 5
cset x4, lt
cmp x4, 0
mov x4, x22
bne inter_multiple_lab0
b multiple_returnLabel

multiple_returnLabel:
mov x0, x4
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global add
add:
add_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
mov x24, 0
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x6, [x11]
mov x11, 1
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x11, [x11]
mov x4, 1
cmp x4, 0
mov x9, x11
mov x24, 0
mov x4, x6
mov x11, x6
bne add_lab0
b add_returnLabel

inter_add_lab0:
mov x9, x25
mov x24, x4
mov x4, x22
b add_lab0

add_lab0:
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x9, x11
ldr x11, [x11]
add x22, x4, x11
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x25, [x11]
ldr x0, =println
mov x1, x22
bl printf
mov x11, x0
mov x11, 1
add x4, x24, x11
cmp x4, 5
cset x11, lt
cmp x11, 0
mov x11, x22
bne inter_add_lab0
b add_returnLabel

add_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global recurseList
recurseList:
recurseList_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x6, x0
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
cmp x11, null
cset x11, eq
cmp x11, 0
bne recurseList_lab0
b recurseList_lab1

recurseList_lab0:
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
mov x11, x11
b recurseList_returnLabel

recurseList_lab1:
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x24, [x11]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
mov x0, x11
bl recurseList
mov x11, x0
mul x11, x24, x11
mov x11, x11
b recurseList_returnLabel

recurseList_returnLabel:
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

bl buildList
mov x25, x0
mov x0, x25
bl multiple
mov x24, x0
mov x0, x25
bl add
mov x11, x0
mov x4, 2
sdiv x11, x11, x4
sub x24, x24, x11
mov x11, 1
cmp x11, 0
mov x23, 0
mov x21, 0
mov x22, x24
mov x27, 0
bne main_lab0
b main_lab1

inter_main_lab0:
mov x23, x4
mov x21, x6
b main_lab0

main_lab0:
mov x0, x25
bl recurseList
mov x11, x0
add x4, x23, x11
mov x11, 1
add x6, x21, x11
cmp x6, 2
cset x11, lt
cmp x11, 0
mov x22, x24
mov x27, x4
bne inter_main_lab0
b main_lab1

main_lab1:
ldr x0, =println
mov x1, x27
bl printf
mov x11, x0
cmp x27, 0
cset x11, ne
cmp x11, 0
mov x11, x27
mov x6, x22
mov x24, x27
bne main_lab2
b main_returnLabel

inter_main_lab2:
mov x11, x4
b main_lab2

main_lab2:
mov x4, 1
sub x4, x11, x4
cmp x4, 0
cset x11, ne
cmp x11, 0
mov x6, x22
mov x24, x4
bne inter_main_lab2
b main_returnLabel

main_returnLabel:
ldr x0, =println
mov x1, x6
bl printf
mov x11, x0
ldr x0, =println
mov x1, x24
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

