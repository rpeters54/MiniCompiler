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
.global peg1
peg1:
    .xword 0x0
.global peg2
peg2:
    .xword 0x0
.global peg3
peg3:
    .xword 0x0
.global numMoves
numMoves:
    .xword 0x0

.text
.global move
move:
move_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
cmp r0, 1
cset r2, eq
cmp r2, 0
bne move_lab0
b move_lab1

move_lab0:
ldr r3, =peg1
ldr r3, [r3]
ldr r4, =peg1
ldr r4, [r4]
mov r40, 1
mov r41, 8
mul r39, r40, r41
add r5, r4, r39
ldr r6, [r5]
ldr r43, =peg1
str r6, [r43]
mov r18, r3
mov r19, r1
b move_lab5

move_lab1:
cmp r0, 2
cset r8, eq
cmp r8, 0
bne move_lab2
b move_lab3

move_lab2:
ldr r9, =peg2
ldr r9, [r9]
ldr r10, =peg2
ldr r10, [r10]
mov r48, 1
mov r49, 8
mul r47, r48, r49
add r11, r10, r47
ldr r12, [r11]
ldr r51, =peg2
str r12, [r51]
mov r17, r9
b move_lab4

move_lab3:
ldr r13, =peg3
ldr r13, [r13]
ldr r14, =peg3
ldr r14, [r14]
mov r56, 1
mov r57, 8
mul r55, r56, r57
add r15, r14, r55
ldr r16, [r15]
ldr r59, =peg3
str r16, [r59]
mov r17, r13
b move_lab4

move_lab4:
mov r18, r17
mov r19, r1
b move_lab5

move_lab5:
cmp r19, 1
cset r20, eq
cmp r20, 0
bne move_lab6
b move_lab7

move_lab6:
mov r64, 1
mov r65, 8
mul r63, r64, r65
add r22, r18, r63
ldr r23, =peg1
ldr r23, [r23]
str r23, [r22]
ldr r67, =peg1
str r18, [r67]
b move_returnLabel

move_lab7:
cmp r19, 2
cset r25, eq
cmp r25, 0
bne move_lab8
b move_lab9

move_lab8:
mov r72, 1
mov r73, 8
mul r71, r72, r73
add r27, r18, r71
ldr r28, =peg2
ldr r28, [r28]
str r28, [r27]
ldr r75, =peg2
str r18, [r75]
b move_returnLabel

move_lab9:
mov r80, 1
mov r81, 8
mul r79, r80, r81
add r30, r18, r79
ldr r31, =peg3
ldr r31, [r31]
str r31, [r30]
ldr r83, =peg3
str r18, [r83]
b move_returnLabel

move_returnLabel:
ldr r34, =numMoves
ldr r34, [r34]
mov r85, 1
add r35, r34, r85
ldr r87, =numMoves
str r35, [r87]
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global hanoi
hanoi:
hanoi_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
mov r2, x2
mov r3, x3
cmp r0, 1
cset r4, eq
cmp r4, 0
bne hanoi_lab0
b hanoi_lab1

hanoi_lab0:
mov x0, r1
mov x1, r2
bl move
b hanoi_returnLabel

hanoi_lab1:
mov r18, 1
sub r8, r0, r18
mov x0, r8
mov x1, r1
mov x2, r3
mov x3, r2
bl hanoi
mov x0, r1
mov x1, r2
bl move
mov r20, 1
sub r12, r0, r20
mov x0, r12
mov x1, r3
mov x2, r2
mov x3, r1
bl hanoi
b hanoi_returnLabel

hanoi_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global printPeg
printPeg:
printPeg_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
cmp r0, null
cset r1, ne
cmp r1, 0
mov r3, r0
bne printPeg_lab0
b printPeg_returnLabel

inter_printPeg_lab0:
mov r3, r8
b printPeg_lab0

printPeg_lab0:
mov r16, 0
mov r17, 8
mul r15, r16, r17
add r4, r3, r15
ldr r5, [r4]
ldr x0, =println
mov x1, r5
bl printf
mov r6, x0
mov r22, 1
mov r23, 8
mul r21, r22, r23
add r7, r3, r21
ldr r8, [r7]
cmp r8, null
cset r9, ne
cmp r9, 0
bne printPeg_lab0
b printPeg_returnLabel

printPeg_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

ldr r48, =peg1
str null, [r48]
ldr r50, =peg2
str null, [r50]
ldr r52, =peg3
str null, [r52]
ldr r54, =numMoves
str 0, [r54]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r0, x0
ldr r1, =read_scratch
ldr r1, [r1]
cmp r1, 1
cset r2, ge
cmp r2, 0
bne main_lab0
b main_returnLabel

main_lab0:
cmp r1, 0
cset r4, ne
cmp r4, 0
mov r6, r1
mov r14, r1
bne main_lab1
b main_lab2

inter_main_lab1:
mov r6, r12
b main_lab1

main_lab1:
mov x0, 16
bl malloc
mov r7, x0
mov r8, r7
mov r59, 0
mov r60, 8
mul r58, r59, r60
add r9, r8, r58
str r6, [r9]
mov r65, 1
mov r66, 8
mul r64, r65, r66
add r10, r8, r64
ldr r11, =peg1
ldr r11, [r11]
str r11, [r10]
ldr r68, =peg1
str r8, [r68]
mov r70, 1
sub r12, r6, r70
cmp r12, 0
cset r13, ne
cmp r13, 0
mov r14, r1
bne main_lab1
b main_lab2

main_lab2:
ldr x0, =println
mov x1, 1
bl printf
mov r16, x0
ldr r17, =peg1
ldr r17, [r17]
mov x0, r17
bl printPeg
ldr x0, =println
mov x1, 2
bl printf
mov r18, x0
ldr r19, =peg2
ldr r19, [r19]
mov x0, r19
bl printPeg
ldr x0, =println
mov x1, 3
bl printf
mov r20, x0
ldr r21, =peg3
ldr r21, [r21]
mov x0, r21
bl printPeg
mov x0, r14
mov x1, 1
mov x2, 3
mov x3, 2
bl hanoi
ldr x0, =println
mov x1, 1
bl printf
mov r22, x0
ldr r23, =peg1
ldr r23, [r23]
mov x0, r23
bl printPeg
ldr x0, =println
mov x1, 2
bl printf
mov r24, x0
ldr r25, =peg2
ldr r25, [r25]
mov x0, r25
bl printPeg
ldr x0, =println
mov x1, 3
bl printf
mov r26, x0
ldr r27, =peg3
ldr r27, [r27]
mov x0, r27
bl printPeg
ldr r28, =numMoves
ldr r28, [r28]
ldr x0, =println
mov x1, r28
bl printf
mov r29, x0
ldr r30, =peg3
ldr r30, [r30]
cmp r30, null
cset r31, ne
cmp r31, 0
bne main_lab3
b main_returnLabel

main_lab3:
ldr r35, =peg3
ldr r35, [r35]
ldr r36, =peg3
ldr r36, [r36]
mov r75, 1
mov r76, 8
mul r74, r75, r76
add r37, r36, r74
ldr r38, [r37]
ldr r78, =peg3
str r38, [r78]
ldr r40, =peg3
ldr r40, [r40]
cmp r40, null
cset r41, ne
cmp r41, 0
bne main_lab3
b main_returnLabel

main_returnLabel:
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

