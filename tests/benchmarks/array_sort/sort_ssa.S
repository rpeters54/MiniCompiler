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
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x4, x1
mov x24, 0
cmp x24, x4
cset x24, lt
cmp x24, 0
mov x9, x11
mov x4, x4
mov x24, 0
bne sort_lab0
b sort_returnLabel

inter_sort_lab0:
mov x9, x6
mov x4, x11
mov x24, x24
b sort_lab0

sort_lab0:
cmp x24, 0
cset x2, gt
mov x6, x24
mov x11, 8
mul x11, x6, x11
add x11, x9, x11
ldr x22, [x11]
mov x11, 1
sub x11, x24, x11
mov x6, x11
mov x11, 8
mul x11, x6, x11
add x11, x9, x11
ldr x11, [x11]
cmp x22, x11
cset x11, lt
and x11, x2, x11
cmp x11, 0
mov x25, x24
mov x6, x9
mov x11, x4
mov x22, x24
bne sort_lab1
b sort_lab2

inter_sort_lab1:
mov x25, x25
b sort_lab1

sort_lab1:
mov x11, x25
mov x6, 8
mul x11, x11, x6
add x11, x9, x11
ldr x6, [x11]
mov x22, x25
mov x11, 8
mul x11, x22, x11
add x2, x9, x11
mov x11, 1
sub x11, x25, x11
mov x22, x11
mov x11, 8
mul x11, x22, x11
add x11, x9, x11
ldr x11, [x11]
str x11, [x2]
mov x11, 1
sub x11, x25, x11
mov x22, x11
mov x11, 8
mul x11, x22, x11
add x11, x9, x11
str x6, [x11]
mov x11, 1
sub x25, x25, x11
cmp x25, 0
cset x2, gt
mov x6, x25
mov x11, 8
mul x11, x6, x11
add x11, x9, x11
ldr x22, [x11]
mov x11, 1
sub x11, x25, x11
mov x11, x11
mov x6, 8
mul x11, x11, x6
add x11, x9, x11
ldr x11, [x11]
cmp x22, x11
cset x11, lt
and x11, x2, x11
cmp x11, 0
mov x6, x9
mov x11, x4
mov x22, x24
bne inter_sort_lab1
b sort_lab2

sort_lab2:
mov x4, 1
add x24, x22, x4
cmp x24, x11
cset x4, lt
cmp x4, 0
bne inter_sort_lab0
b sort_returnLabel

sort_returnLabel:
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
mov x22, x25
bne main_lab0
b main_lab1

inter_main_lab0:
mov x24, x4
b main_lab0

main_lab0:
mov x11, x24
mov x4, 8
mul x11, x11, x4
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
mov x22, x25
bne inter_main_lab0
b main_lab1

main_lab1:
mov x0, x22
mov x1, 10
bl sort
mov x11, 1
cmp x11, 0
mov x24, 0
bne main_lab2
b main_returnLabel

inter_main_lab2:
mov x24, x4
b main_lab2

main_lab2:
mov x4, x24
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 1
add x4, x24, x11
cmp x4, 10
cset x11, lt
cmp x11, 0
bne inter_main_lab2
b main_returnLabel

main_returnLabel:
mov x0, 0
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 176
ret

