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
.global function
function:
function_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
cmp x24, 0
cset x11, le
cmp x11, 0
mov x11, 0
bne function_returnLabel
b function_lab2

function_lab2:
mul x4, x24, x24
mov x11, 0
cmp x11, x4
cset x11, lt
cmp x11, 0
mov x22, 0
mov x4, x24
bne function_lab3
b function_lab4

inter_function_lab3:
mov x22, x11
b function_lab3

function_lab3:
add x11, x22, x24
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
mov x11, 1
add x11, x22, x11
mul x4, x24, x24
cmp x11, x4
cset x4, lt
cmp x4, 0
mov x4, x24
bne inter_function_lab3
b function_lab4

function_lab4:
mov x11, 1
sub x11, x4, x11
mov x0, x11
bl function
mov x11, x0
mov x11, x11
b function_returnLabel

function_returnLabel:
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

ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
mov x0, x11
bl function
mov x11, x0
ldr x0, =println
mov x1, 0
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

