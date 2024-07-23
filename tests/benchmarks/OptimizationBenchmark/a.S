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
.global global1
global1:
    .xword 0x0
.global global2
global2:
    .xword 0x0
.global global3
global3:
    .xword 0x0

.text
.global constantFolding
constantFolding:
constantFolding_returnLabel:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x0, 226
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global constantPropagation
constantPropagation:
constantPropagation_returnLabel:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x0, -25457889
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global deadCodeElimination
deadCodeElimination:
deadCodeElimination_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

ldr r6, =global1
str 11, [r6]
ldr r8, =global1
str 5, [r8]
ldr r10, =global1
str 9, [r10]
mov x0, 38
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global sum
sum:
sum_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
cmp r0, 0
cset r1, gt
cmp r1, 0
mov r2, r0
mov r3, 0
mov r8, 0
bne sum_lab0
b sum_returnLabel

inter_sum_lab0:
mov r2, r5
mov r3, r4
b sum_lab0

sum_lab0:
add r4, r3, r2
mov r11, 1
sub r5, r2, r11
cmp r5, 0
cset r6, gt
cmp r6, 0
mov r8, r4
bne sum_lab0
b sum_returnLabel

sum_returnLabel:
mov x0, r8
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global doesntModifyGlobals
doesntModifyGlobals:
doesntModifyGlobals_returnLabel:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x0, 3
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global interProceduralOptimization
interProceduralOptimization:
interProceduralOptimization_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

ldr r15, =global1
str 1, [r15]
ldr r17, =global2
str 0, [r17]
ldr r19, =global3
str 0, [r19]
mov x0, 100
bl sum
mov r0, x0
ldr r1, =global1
ldr r1, [r1]
cmp r1, 1
cset r2, eq
cmp r2, 0
bne interProceduralOptimization_lab0
b interProceduralOptimization_lab1

interProceduralOptimization_lab0:
mov x0, 10000
bl sum
mov r3, x0
mov r12, r3
b interProceduralOptimization_returnLabel

interProceduralOptimization_lab1:
ldr r4, =global2
ldr r4, [r4]
cmp r4, 2
cset r5, eq
cmp r5, 0
mov r7, r0
bne interProceduralOptimization_lab2
b interProceduralOptimization_lab4

interProceduralOptimization_lab2:
mov x0, 20000
bl sum
mov r6, x0
mov r7, r6
b interProceduralOptimization_lab4

interProceduralOptimization_lab4:
ldr r8, =global3
ldr r8, [r8]
cmp r8, 3
cset r9, eq
cmp r9, 0
mov r11, r7
bne interProceduralOptimization_lab5
b interProceduralOptimization_lab7

interProceduralOptimization_lab5:
mov x0, 30000
bl sum
mov r10, x0
mov r11, r10
b interProceduralOptimization_lab7

interProceduralOptimization_lab7:
mov r12, r11
b interProceduralOptimization_returnLabel

interProceduralOptimization_returnLabel:
mov x0, r12
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global commonSubexpressionElimination
commonSubexpressionElimination:
commonSubexpressionElimination_returnLabel:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x0, -48796
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global hoisting
hoisting:
hoisting_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r19, 1
cmp r19, 0
mov r5, 0
mov r13, 2
bne hoisting_lab0
b hoisting_returnLabel

inter_hoisting_lab0:
mov r5, r10
b hoisting_lab0

hoisting_lab0:
mov r21, 1
add r10, r5, r21
cmp r10, 1000000
cset r11, lt
cmp r11, 0
mov r13, 2
bne hoisting_lab0
b hoisting_returnLabel

hoisting_returnLabel:
mov x0, r13
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global doubleIf
doubleIf:
doubleIf_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r12, 1
cmp r12, 0
mov r9, 50
bne doubleIf_returnLabel
b doubleIf_lab4

doubleIf_lab4:
mov r9, 0
b doubleIf_returnLabel

doubleIf_returnLabel:
mov x0, r9
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global integerDivide
integerDivide:
integerDivide_returnLabel:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x0, 736
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global association
association:
association_returnLabel:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x0, 10
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global tailRecursionHelper
tailRecursionHelper:
tailRecursionHelper_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
cmp r0, 0
cset r2, eq
cmp r2, 0
mov r9, r1
bne tailRecursionHelper_returnLabel
b tailRecursionHelper_lab1

tailRecursionHelper_lab1:
mov r11, 1
sub r5, r0, r11
add r7, r1, r0
mov x0, r5
mov x1, r7
bl tailRecursionHelper
mov r8, x0
mov r9, r8
b tailRecursionHelper_returnLabel

tailRecursionHelper_returnLabel:
mov x0, r9
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global tailRecursion
tailRecursion:
tailRecursion_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov x0, r0
mov x1, 0
bl tailRecursionHelper
mov r1, x0
mov x0, r1
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global unswitching
unswitching:
unswitching_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r14, 1
cmp r14, 0
mov r1, 1
mov r10, 1
bne unswitching_lab0
b unswitching_returnLabel

inter_unswitching_lab0:
mov r1, r8
b unswitching_lab0

unswitching_lab0:
mov r16, 1
cmp r16, 0
bne unswitching_lab1
b unswitching_lab2

unswitching_lab1:
mov r18, 1
add r5, r1, r18
mov r8, r5
b unswitching_lab3

unswitching_lab2:
mov r20, 2
add r7, r1, r20
mov r8, r7
b unswitching_lab3

unswitching_lab3:
cmp r8, 1000000
cset r9, lt
cmp r9, 0
mov r10, r8
bne unswitching_lab0
b unswitching_returnLabel

unswitching_returnLabel:
mov x0, r10
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global randomCalculation
randomCalculation:
randomCalculation_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r21, 0
cmp r21, r0
cset r1, lt
cmp r1, 0
mov r3, 0
mov r4, 0
mov r18, 0
bne randomCalculation_lab0
b randomCalculation_returnLabel

inter_randomCalculation_lab0:
mov r3, r14
mov r4, r7
b randomCalculation_lab0

randomCalculation_lab0:
mov r23, 19
add r7, r4, r23
mov r25, 2
mul r8, r3, r25
mov r27, 2
sdiv r9, r8, r27
mov r29, 3
mul r10, r29, r9
mov r31, 3
sdiv r11, r10, r31
mov r33, 4
mul r12, r11, r33
mov r35, 4
sdiv r13, r12, r35
mov r37, 1
add r14, r13, r37
cmp r14, r0
cset r15, lt
cmp r15, 0
mov r18, r7
bne randomCalculation_lab0
b randomCalculation_returnLabel

randomCalculation_returnLabel:
mov x0, r18
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global iterativeFibonacci
iterativeFibonacci:
iterativeFibonacci_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r16, 0
cmp r16, r0
cset r2, lt
cmp r2, 0
mov r3, 1
mov r5, -1
mov r6, 0
mov r10, 1
bne iterativeFibonacci_lab0
b iterativeFibonacci_returnLabel

inter_iterativeFibonacci_lab0:
mov r3, r7
mov r5, r3
mov r6, r8
b iterativeFibonacci_lab0

iterativeFibonacci_lab0:
add r7, r3, r5
mov r18, 1
add r8, r6, r18
cmp r8, r0
cset r9, lt
cmp r9, 0
mov r10, r7
bne iterativeFibonacci_lab0
b iterativeFibonacci_returnLabel

iterativeFibonacci_returnLabel:
mov x0, r10
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global recursiveFibonacci
recursiveFibonacci:
recursiveFibonacci_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
cmp r0, 0
cset r1, le
cmp r0, 1
cset r2, eq
or r3, r1, r2
cmp r3, 0
mov r11, r0
bne recursiveFibonacci_returnLabel
b recursiveFibonacci_lab1

recursiveFibonacci_lab1:
mov r13, 1
sub r6, r0, r13
mov x0, r6
bl recursiveFibonacci
mov r7, x0
mov r15, 2
sub r8, r0, r15
mov x0, r8
bl recursiveFibonacci
mov r9, x0
add r10, r7, r9
mov r11, r10
b recursiveFibonacci_returnLabel

recursiveFibonacci_returnLabel:
mov x0, r11
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

ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r0, x0
ldr r1, =read_scratch
ldr r1, [r1]
mov r43, 1
cmp r43, r1
cset r2, lt
cmp r2, 0
mov r4, 1
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov r4, r36
b main_lab0

main_lab0:
bl constantFolding
mov r5, x0
ldr x0, =println
mov x1, r5
bl printf
mov r6, x0
bl constantPropagation
mov r7, x0
ldr x0, =println
mov x1, r7
bl printf
mov r8, x0
bl deadCodeElimination
mov r9, x0
ldr x0, =println
mov x1, r9
bl printf
mov r10, x0
bl interProceduralOptimization
mov r11, x0
ldr x0, =println
mov x1, r11
bl printf
mov r12, x0
bl commonSubexpressionElimination
mov r13, x0
ldr x0, =println
mov x1, r13
bl printf
mov r14, x0
bl hoisting
mov r15, x0
ldr x0, =println
mov x1, r15
bl printf
mov r16, x0
bl doubleIf
mov r17, x0
ldr x0, =println
mov x1, r17
bl printf
mov r18, x0
bl integerDivide
mov r19, x0
ldr x0, =println
mov x1, r19
bl printf
mov r20, x0
bl association
mov r21, x0
ldr x0, =println
mov x1, r21
bl printf
mov r22, x0
mov r45, 1000
sdiv r23, r1, r45
mov x0, r23
bl tailRecursion
mov r24, x0
ldr x0, =println
mov x1, r24
bl printf
mov r25, x0
bl unswitching
mov r26, x0
ldr x0, =println
mov x1, r26
bl printf
mov r27, x0
mov x0, r1
bl randomCalculation
mov r28, x0
ldr x0, =println
mov x1, r28
bl printf
mov r29, x0
mov r47, 5
sdiv r30, r1, r47
mov x0, r30
bl iterativeFibonacci
mov r31, x0
ldr x0, =println
mov x1, r31
bl printf
mov r32, x0
mov r49, 1000
sdiv r33, r1, r49
mov x0, r33
bl recursiveFibonacci
mov r34, x0
ldr x0, =println
mov x1, r34
bl printf
mov r35, x0
mov r51, 1
add r36, r4, r51
cmp r36, r1
cset r37, lt
cmp r37, 0
bne main_lab0
b main_returnLabel

main_returnLabel:
ldr x0, =println
mov x1, 9999
bl printf
mov r40, x0
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

