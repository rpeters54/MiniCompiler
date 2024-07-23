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
.global wait
wait:
wait_returnLabel:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x0, 0
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global power
power:
power_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x4, x1
cmp x4, 0
cset x24, gt
cmp x24, 0
mov x24, 1
mov x4, x4
mov x6, 1
bne power_lab0
b power_returnLabel

inter_power_lab0:
mov x24, x24
mov x4, x9
b power_lab0

power_lab0:
mul x24, x24, x11
mov x6, 1
sub x9, x4, x6
cmp x9, 0
cset x4, gt
cmp x4, 0
mov x6, x24
bne inter_power_lab0
b power_returnLabel

power_returnLabel:
mov x0, x6
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global recursiveDecimalSum
recursiveDecimalSum:
recursiveDecimalSum_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x25, x0
mov x24, x1
mov x22, x2
cmp x25, 0
cset x11, gt
cmp x11, 0
mov x11, x24
bne recursiveDecimalSum_lab0
b recursiveDecimalSum_returnLabel

recursiveDecimalSum_lab0:
mov x11, 10
sdiv x4, x25, x11
mov x11, 10
mul x11, x4, x11
sub x11, x25, x11
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x4, x22
mov x6, x24
mov x9, x25
bne recursiveDecimalSum_lab1
b recursiveDecimalSum_lab3

recursiveDecimalSum_lab1:
mov x0, 2
mov x1, x22
bl power
mov x11, x0
add x11, x24, x11
mov x4, x22
mov x6, x11
mov x9, x25
b recursiveDecimalSum_lab3

recursiveDecimalSum_lab3:
mov x11, 10
sdiv x24, x9, x11
mov x11, 1
add x11, x4, x11
mov x0, x24
mov x1, x6
mov x2, x11
bl recursiveDecimalSum
mov x11, x0
mov x11, x11
b recursiveDecimalSum_returnLabel

recursiveDecimalSum_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global convertToDecimal
convertToDecimal:
convertToDecimal_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x0, x11
mov x1, 0
mov x2, 0
bl recursiveDecimalSum
mov x11, x0
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
bl convertToDecimal
mov x22, x0
mul x11, x22, x22
cmp x11, 0
cset x4, gt
cmp x4, 0
mov x24, x11
mov x11, x22
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov x24, x4
b main_lab0

main_lab0:
mov x0, x24
bl wait
mov x11, x0
mov x11, 1
sub x4, x24, x11
cmp x4, 0
cset x11, gt
cmp x11, 0
mov x11, x22
bne inter_main_lab0
b main_returnLabel

main_returnLabel:
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

