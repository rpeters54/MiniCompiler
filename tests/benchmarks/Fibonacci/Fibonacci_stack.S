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
.global computeFib
computeFib:
computeFib_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x22, sp, 96
add x24, sp, 104
str x11, [x24]
ldr x11, [x24]
cmp x11, 0
cset x11, eq
cmp x11, 0
bne computeFib_lab0
b computeFib_lab1

computeFib_lab0:
mov x11, 0
str x11, [x22]
b computeFib_returnLabel

computeFib_lab1:
ldr x11, [x24]
cmp x11, 2
cset x11, le
cmp x11, 0
bne computeFib_lab2
b computeFib_lab3

computeFib_lab2:
mov x11, 1
str x11, [x22]
b computeFib_returnLabel

computeFib_lab3:
ldr x11, [x24]
mov x4, 1
sub x11, x11, x4
mov x0, x11
bl computeFib
mov x25, x0
ldr x4, [x24]
mov x11, 2
sub x11, x4, x11
mov x0, x11
bl computeFib
mov x11, x0
add x11, x25, x11
str x11, [x22]
b computeFib_returnLabel

computeFib_returnLabel:
ldr x11, [x22]
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
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x24, sp, 96
add x22, sp, 104
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x22]
ldr x11, [x22]
mov x0, x11
bl computeFib
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

