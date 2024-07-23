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
.global interval
interval:
    .xword 0x0
.global end
end:
    .xword 0x0

.text
.global multBy4xTimes
multBy4xTimes:
multBy4xTimes_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
mov x6, x1
cmp x6, 0
cset x11, le
cmp x11, 0
bne multBy4xTimes_lab0
b multBy4xTimes_lab2

multBy4xTimes_lab0:
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x11, x11
b multBy4xTimes_returnLabel

multBy4xTimes_lab2:
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
mov x9, 0
mov x4, 8
mul x4, x9, x4
add x4, x24, x4
ldr x4, [x4]
mov x9, 4
mul x4, x9, x4
str x4, [x11]
mov x11, 1
sub x11, x6, x11
mov x0, x24
mov x1, x11
bl multBy4xTimes
mov x11, x0
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x11, x11
b multBy4xTimes_returnLabel

multBy4xTimes_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global divideBy8
divideBy8:
divideBy8_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x6, x24, x11
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x4, [x11]
mov x11, 2
sdiv x11, x4, x11
str x11, [x6]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x4, x24, x11
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x24, x11
ldr x11, [x11]
mov x6, 2
sdiv x11, x11, x6
str x11, [x4]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x4, x24, x11
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x24, x11
ldr x24, [x11]
mov x11, 2
sdiv x11, x24, x11
str x11, [x4]
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

mov x0, 8
bl malloc
mov x11, x0
mov x22, x11
mov x4, 1000000
ldr x11, =end
str x4, [x11]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x24, =read_scratch
ldr x24, [x24]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x4, =read_scratch
ldr x4, [x4]
ldr x11, =interval
str x4, [x11]
ldr x0, =println
mov x1, x24
bl printf
mov x11, x0
ldr x11, =interval
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 1
cmp x11, 0
mov x24, 0
mov x25, x22
mov x2, 0
mov x6, 0
mov x22, 0
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov x24, x11
mov x25, x4
mov x2, x2
b main_lab0

main_lab0:
ldr x11, =end
ldr x11, [x11]
mov x4, 0
cmp x4, x11
cset x11, le
cmp x11, 0
mov x6, 0
mov x11, x24
mov x9, 0
mov x4, x25
mov x2, x2
bne main_lab1
b main_lab5

inter_main_lab1:
mov x6, x6
b main_lab1

main_lab1:
mov x11, 1
add x22, x6, x11
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x25, x11
str x22, [x11]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x25, x11
ldr x11, [x11]
mov x0, x25
mov x1, 2
bl multBy4xTimes
mov x11, x0
mov x0, x25
bl divideBy8
ldr x4, =interval
ldr x4, [x4]
mov x11, 1
sub x4, x4, x11
cmp x4, 0
cset x11, le
cmp x11, 0
mov x11, 1
mov x6, x22
bne main_lab4
b main_lab3

main_lab3:
mov x11, x4
mov x6, x22
b main_lab4

main_lab4:
add x6, x6, x11
ldr x11, =end
ldr x11, [x11]
cmp x6, x11
cset x11, le
cmp x11, 0
mov x11, x24
mov x9, x6
mov x4, x25
mov x2, 39916800
bne inter_main_lab1
b main_lab5

main_lab5:
mov x24, 1
add x11, x11, x24
cmp x11, 50
cset x24, lt
cmp x24, 0
mov x6, x9
mov x22, x2
bne inter_main_lab0
b main_returnLabel

main_returnLabel:
ldr x0, =println
mov x1, x6
bl printf
mov x11, x0
ldr x0, =println
mov x1, x22
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

