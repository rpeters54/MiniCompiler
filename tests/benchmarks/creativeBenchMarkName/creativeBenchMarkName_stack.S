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
stp x29, x30, [sp, -176]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x23, sp, 96
add x11, sp, 104
add x11, sp, 112
add x27, sp, 120
add x26, sp, 128
add x22, sp, 136
add x21, sp, 144
add x25, sp, 152
add x24, sp, 160
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x27]
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x26]
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x22]
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x21]
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x25]
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x24]
ldr x4, [x27]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x28, x4, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x28]
ldr x11, [x26]
mov x4, 0
mov x6, 8
mul x4, x4, x6
add x28, x11, x4
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x28]
ldr x6, [x22]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x28, x6, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x28]
ldr x11, [x21]
mov x6, 0
mov x4, 8
mul x4, x6, x4
add x28, x11, x4
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x28]
ldr x6, [x25]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x28, x6, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x28]
ldr x4, [x24]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x28, x4, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x28]
ldr x6, [x27]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x4, [x26]
str x4, [x11]
ldr x6, [x26]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x4, x6, x11
ldr x11, [x22]
str x11, [x4]
ldr x4, [x22]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x4, [x21]
str x4, [x11]
ldr x4, [x21]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x4, x4, x11
ldr x11, [x25]
str x11, [x4]
ldr x11, [x25]
mov x4, 1
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x4, [x24]
str x4, [x11]
ldr x4, [x24]
mov x24, 1
mov x11, 8
mul x11, x24, x11
add x4, x4, x11
mov x11, null
str x11, [x4]
ldr x11, [x27]
str x11, [x23]
b buildList_returnLabel

buildList_returnLabel:
ldr x11, [x23]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 176
ret

.global multiple
multiple:
multiple_prologue:
stp x29, x30, [sp, -144]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
add x24, sp, 96
add x11, sp, 104
add x25, sp, 112
add x22, sp, 120
add x9, sp, 128
str x4, [x11]
mov x4, 0
str x4, [x25]
ldr x11, [x11]
str x11, [x9]
ldr x6, [x9]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
str x11, [x22]
ldr x11, [x9]
mov x4, 1
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x11, [x11]
str x11, [x9]
ldr x11, [x25]
cmp x11, 5
cset x11, lt
cmp x11, 0
bne multiple_lab0
b multiple_lab1

multiple_lab0:
ldr x2, [x22]
ldr x11, [x9]
mov x6, 0
mov x4, 8
mul x4, x6, x4
add x11, x11, x4
ldr x11, [x11]
mul x11, x2, x11
str x11, [x22]
ldr x6, [x9]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x11, [x11]
str x11, [x9]
ldr x11, [x22]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x25]
mov x4, 1
add x11, x11, x4
str x11, [x25]
ldr x11, [x25]
cmp x11, 5
cset x11, lt
cmp x11, 0
bne multiple_lab0
b multiple_lab1

multiple_lab1:
ldr x11, [x22]
str x11, [x24]
b multiple_returnLabel

multiple_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 144
ret

.global add
add:
add_prologue:
stp x29, x30, [sp, -144]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x25, sp, 96
add x24, sp, 104
add x27, sp, 112
add x22, sp, 120
add x4, sp, 128
str x11, [x24]
mov x11, 0
str x11, [x27]
ldr x11, [x24]
str x11, [x4]
ldr x6, [x4]
mov x11, 0
mov x24, 8
mul x11, x11, x24
add x11, x6, x11
ldr x11, [x11]
str x11, [x22]
ldr x11, [x4]
mov x6, 1
mov x24, 8
mul x24, x6, x24
add x11, x11, x24
ldr x11, [x11]
str x11, [x4]
ldr x11, [x27]
cmp x11, 5
cset x11, lt
cmp x11, 0
bne add_lab0
b add_lab1

add_lab0:
ldr x6, [x22]
ldr x11, [x4]
mov x9, 0
mov x24, 8
mul x24, x9, x24
add x11, x11, x24
ldr x11, [x11]
add x11, x6, x11
str x11, [x22]
ldr x11, [x4]
mov x24, 1
mov x6, 8
mul x24, x24, x6
add x11, x11, x24
ldr x11, [x11]
str x11, [x4]
ldr x11, [x22]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x27]
mov x4, 1
add x11, x11, x4
str x11, [x27]
ldr x11, [x27]
cmp x11, 5
cset x11, lt
cmp x11, 0
bne add_lab0
b add_lab1

add_lab1:
ldr x11, [x22]
str x11, [x25]
b add_returnLabel

add_returnLabel:
ldr x11, [x25]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 144
ret

.global recurseList
recurseList:
recurseList_prologue:
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
ldr x6, [x4]
mov x9, 1
mov x11, 8
mul x11, x9, x11
add x11, x6, x11
ldr x11, [x11]
cmp x11, null
cset x11, eq
cmp x11, 0
bne recurseList_lab0
b recurseList_lab1

recurseList_lab0:
ldr x6, [x4]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
str x11, [x24]
b recurseList_returnLabel

recurseList_lab1:
ldr x6, [x4]
mov x11, 0
mov x9, 8
mul x11, x11, x9
add x11, x6, x11
ldr x22, [x11]
ldr x4, [x4]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
mov x0, x11
bl recurseList
mov x11, x0
mul x11, x22, x11
str x11, [x24]
b recurseList_returnLabel

recurseList_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global main
main:
main_prologue:
stp x29, x30, [sp, -160]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x27, sp, 96
add x21, sp, 104
add x24, sp, 112
add x22, sp, 120
add x25, sp, 128
add x23, sp, 136
add x26, sp, 144
mov x11, 0
str x11, [x26]
mov x11, 0
str x11, [x23]
bl buildList
mov x11, x0
str x11, [x21]
ldr x11, [x21]
mov x0, x11
bl multiple
mov x11, x0
str x11, [x24]
ldr x11, [x21]
mov x0, x11
bl add
mov x11, x0
str x11, [x22]
ldr x4, [x24]
ldr x24, [x22]
mov x11, 2
sdiv x11, x24, x11
sub x11, x4, x11
str x11, [x25]
ldr x11, [x26]
cmp x11, 2
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab0:
ldr x24, [x23]
ldr x11, [x21]
mov x0, x11
bl recurseList
mov x11, x0
add x11, x24, x11
str x11, [x23]
ldr x4, [x26]
mov x11, 1
add x11, x4, x11
str x11, [x26]
ldr x11, [x26]
cmp x11, 2
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab1:
ldr x11, [x23]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x23]
cmp x11, 0
cset x11, ne
cmp x11, 0
bne main_lab2
b main_lab3

main_lab2:
ldr x11, [x23]
mov x4, 1
sub x11, x11, x4
str x11, [x23]
ldr x11, [x23]
cmp x11, 0
cset x11, ne
cmp x11, 0
bne main_lab2
b main_lab3

main_lab3:
ldr x11, [x25]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x23]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 0
str x11, [x27]
b main_returnLabel

main_returnLabel:
ldr x11, [x27]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 160
ret

