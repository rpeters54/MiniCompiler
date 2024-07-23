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
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x6, x0
mov x11, x1
add x24, sp, 96
add x22, sp, 104
add x4, sp, 112
str x6, [x22]
str x11, [x4]
ldr x11, [x4]
cmp x11, 0
cset x11, le
cmp x11, 0
bne multBy4xTimes_lab0
b multBy4xTimes_lab1

multBy4xTimes_lab0:
ldr x6, [x22]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
str x11, [x24]
b multBy4xTimes_returnLabel

multBy4xTimes_lab1:
b multBy4xTimes_lab2

multBy4xTimes_lab2:
ldr x6, [x22]
mov x11, 0
mov x9, 8
mul x11, x11, x9
add x6, x6, x11
ldr x11, [x22]
mov x2, 0
mov x9, 8
mul x9, x2, x9
add x11, x11, x9
ldr x9, [x11]
mov x11, 4
mul x11, x11, x9
str x11, [x6]
ldr x6, [x22]
ldr x11, [x4]
mov x4, 1
sub x11, x11, x4
mov x0, x6
mov x1, x11
bl multBy4xTimes
mov x11, x0
ldr x6, [x22]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
str x11, [x24]
b multBy4xTimes_returnLabel

multBy4xTimes_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global divideBy8
divideBy8:
divideBy8_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x6, sp, 96
str x11, [x6]
ldr x11, [x6]
mov x24, 0
mov x4, 8
mul x4, x24, x4
add x4, x11, x4
ldr x24, [x6]
mov x9, 0
mov x11, 8
mul x11, x9, x11
add x11, x24, x11
ldr x11, [x11]
mov x24, 2
sdiv x11, x11, x24
str x11, [x4]
ldr x24, [x6]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x24, x24, x11
ldr x11, [x6]
mov x9, 0
mov x4, 8
mul x4, x9, x4
add x11, x11, x4
ldr x4, [x11]
mov x11, 2
sdiv x11, x4, x11
str x11, [x24]
ldr x24, [x6]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x4, x24, x11
ldr x6, [x6]
mov x24, 0
mov x11, 8
mul x11, x24, x11
add x11, x6, x11
ldr x24, [x11]
mov x11, 2
sdiv x11, x24, x11
str x11, [x4]
b divideBy8_returnLabel

divideBy8_returnLabel:
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
stp x29, x30, [sp, -192]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x26, sp, 96
add x25, sp, 104
add x28, sp, 112
add x27, sp, 120
add x19, sp, 128
str x19, [sp, 184]
add x21, sp, 136
add x22, sp, 144
add x23, sp, 152
add x24, sp, 160
add x11, sp, 168
mov x0, 8
bl malloc
mov x11, x0
mov x11, x11
str x11, [x23]
mov x11, 1000000
ldr x4, =end
str x11, [x4]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x25]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
ldr x4, =interval
str x11, [x4]
ldr x11, [x25]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, =interval
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 0
str x11, [x28]
mov x11, 0
str x11, [x27]
mov x11, 0
ldr x19, [sp, 184]
str x11, [x19]
ldr x11, [x28]
cmp x11, 50
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab6

main_lab0:
mov x11, 0
str x11, [x27]
ldr x4, [x27]
ldr x11, =end
ldr x11, [x11]
cmp x4, x11
cset x11, le
cmp x11, 0
bne main_lab1
b main_lab5

main_lab1:
mov x4, 1
mov x11, 2
mul x11, x4, x11
mov x4, 3
mul x4, x11, x4
mov x11, 4
mul x11, x4, x11
mov x4, 5
mul x11, x11, x4
mov x4, 6
mul x11, x11, x4
mov x4, 7
mul x4, x11, x4
mov x11, 8
mul x11, x4, x11
mov x4, 9
mul x4, x11, x4
mov x11, 10
mul x11, x4, x11
mov x4, 11
mul x11, x11, x4
ldr x19, [sp, 184]
str x11, [x19]
ldr x4, [x27]
mov x11, 1
add x11, x4, x11
str x11, [x27]
ldr x11, [x23]
mov x6, 0
mov x4, 8
mul x4, x6, x4
add x4, x11, x4
ldr x11, [x27]
str x11, [x4]
ldr x4, [x23]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x11, [x11]
str x11, [x21]
ldr x11, [x23]
mov x0, x11
mov x1, 2
bl multBy4xTimes
mov x11, x0
ldr x11, [x23]
mov x0, x11
bl divideBy8
ldr x11, =interval
ldr x11, [x11]
mov x4, 1
sub x11, x11, x4
str x11, [x22]
ldr x11, [x22]
cmp x11, 0
cset x11, le
str x11, [x24]
ldr x11, [x22]
cmp x11, 0
cset x11, le
cmp x11, 0
bne main_lab2
b main_lab3

main_lab2:
mov x11, 1
str x11, [x22]
b main_lab4

main_lab3:
b main_lab4

main_lab4:
ldr x4, [x27]
ldr x11, [x22]
add x11, x4, x11
str x11, [x27]
ldr x11, [x27]
ldr x4, =end
ldr x4, [x4]
cmp x11, x4
cset x11, le
cmp x11, 0
bne main_lab1
b main_lab5

main_lab5:
ldr x11, [x28]
mov x4, 1
add x11, x11, x4
str x11, [x28]
ldr x11, [x28]
cmp x11, 50
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab6

main_lab6:
ldr x11, [x27]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x19, [sp, 184]
ldr x11, [x19]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 0
str x11, [x26]
b main_returnLabel

main_returnLabel:
ldr x11, [x26]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 192
ret

