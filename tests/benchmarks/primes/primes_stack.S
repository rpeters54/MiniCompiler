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
.global isqrt
isqrt:
isqrt_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
add x4, sp, 104
add x22, sp, 112
add x6, sp, 120
str x11, [x4]
mov x11, 1
str x11, [x22]
mov x11, 3
str x11, [x6]
ldr x9, [x22]
ldr x11, [x4]
cmp x9, x11
cset x11, le
cmp x11, 0
bne isqrt_lab0
b isqrt_lab1

isqrt_lab0:
ldr x9, [x22]
ldr x11, [x6]
add x11, x9, x11
str x11, [x22]
ldr x9, [x6]
mov x11, 2
add x11, x9, x11
str x11, [x6]
ldr x11, [x22]
ldr x4, [x4]
cmp x11, x4
cset x11, le
cmp x11, 0
bne isqrt_lab0
b isqrt_lab1

isqrt_lab1:
ldr x11, [x6]
mov x4, 2
sdiv x4, x11, x4
mov x11, 1
sub x11, x4, x11
str x11, [x24]
b isqrt_returnLabel

isqrt_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global prime
prime:
prime_prologue:
stp x29, x30, [sp, -144]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x22, sp, 96
add x24, sp, 104
add x25, sp, 112
add x27, sp, 120
add x23, sp, 128
str x11, [x24]
ldr x11, [x24]
cmp x11, 2
cset x11, lt
cmp x11, 0
bne prime_lab0
b prime_lab1

prime_lab0:
mov x11, 0
str x11, [x22]
b prime_returnLabel

prime_lab1:
ldr x11, [x24]
mov x0, x11
bl isqrt
mov x11, x0
str x11, [x25]
mov x11, 2
str x11, [x27]
ldr x4, [x27]
ldr x11, [x25]
cmp x4, x11
cset x11, le
cmp x11, 0
bne prime_lab2
b prime_lab6

prime_lab2:
ldr x6, [x24]
ldr x4, [x24]
ldr x11, [x27]
sdiv x4, x4, x11
ldr x11, [x27]
mul x11, x4, x11
sub x11, x6, x11
str x11, [x23]
ldr x11, [x23]
cmp x11, 0
cset x11, eq
cmp x11, 0
bne prime_lab3
b prime_lab4

prime_lab3:
mov x11, 0
str x11, [x22]
b prime_returnLabel

prime_lab4:
b prime_lab5

prime_lab5:
ldr x4, [x27]
mov x11, 1
add x11, x4, x11
str x11, [x27]
ldr x4, [x27]
ldr x11, [x25]
cmp x4, x11
cset x11, le
cmp x11, 0
bne prime_lab2
b prime_lab6

prime_lab6:
mov x11, 1
str x11, [x22]
b prime_returnLabel

prime_returnLabel:
ldr x11, [x22]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 144
ret

.global main
main:
main_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x24, sp, 96
add x22, sp, 104
add x25, sp, 112
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x22]
mov x11, 0
str x11, [x25]
ldr x4, [x25]
ldr x11, [x22]
cmp x4, x11
cset x11, le
cmp x11, 0
bne main_lab0
b main_lab4

main_lab0:
ldr x11, [x25]
mov x0, x11
bl prime
mov x11, x0
cmp x11, 0
bne main_lab1
b main_lab2

main_lab1:
ldr x11, [x25]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b main_lab3

main_lab2:
b main_lab3

main_lab3:
ldr x11, [x25]
mov x4, 1
add x11, x11, x4
str x11, [x25]
ldr x4, [x25]
ldr x11, [x22]
cmp x4, x11
cset x11, le
cmp x11, 0
bne main_lab0
b main_lab4

main_lab4:
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
ldp x29, x30, [sp], 128
ret

