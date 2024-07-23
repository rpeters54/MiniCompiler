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
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
mov x11, 1
cmp x11, x4
cset x11, le
cmp x11, 0
mov x11, 1
mov x6, 3
mov x24, 3
bne isqrt_lab0
b isqrt_returnLabel

inter_isqrt_lab0:
mov x11, x11
mov x6, x6
b isqrt_lab0

isqrt_lab0:
add x11, x11, x6
mov x24, 2
add x6, x6, x24
cmp x11, x4
cset x24, le
cmp x24, 0
mov x24, x6
bne inter_isqrt_lab0
b isqrt_returnLabel

isqrt_returnLabel:
mov x11, 2
sdiv x4, x24, x11
mov x11, 1
sub x11, x4, x11
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global prime
prime:
prime_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x22, x0
cmp x22, 2
cset x11, lt
cmp x11, 0
mov x24, 0
bne prime_returnLabel
b prime_lab1

prime_lab1:
mov x0, x22
bl isqrt
mov x6, x0
mov x11, 2
cmp x11, x6
cset x11, le
cmp x11, 0
mov x11, 2
mov x24, 1
bne prime_lab2
b prime_returnLabel

inter_prime_lab2:
mov x11, x4
b prime_lab2

prime_lab2:
sdiv x4, x22, x11
mul x4, x4, x11
sub x4, x22, x4
cmp x4, 0
cset x4, eq
cmp x4, 0
mov x24, 0
bne prime_returnLabel
b prime_lab5

prime_lab5:
mov x4, 1
add x4, x11, x4
cmp x4, x6
cset x11, le
cmp x11, 0
mov x24, 1
bne inter_prime_lab2
b prime_returnLabel

prime_returnLabel:
mov x0, x24
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

ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x24, =read_scratch
ldr x24, [x24]
mov x11, 0
cmp x11, x24
cset x11, le
cmp x11, 0
mov x22, 0
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov x22, x11
b main_lab0

main_lab0:
mov x0, x22
bl prime
mov x11, x0
cmp x11, 0
mov x11, x22
mov x4, x24
bne main_lab1
b main_lab3

main_lab1:
ldr x0, =println
mov x1, x22
bl printf
mov x11, x0
mov x11, x22
mov x4, x24
b main_lab3

main_lab3:
mov x6, 1
add x11, x11, x6
cmp x11, x4
cset x4, le
cmp x4, 0
bne inter_main_lab0
b main_returnLabel

main_returnLabel:
mov x0, 0
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

