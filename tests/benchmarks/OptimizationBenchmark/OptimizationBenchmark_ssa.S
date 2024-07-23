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
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x11, 11
ldr x4, =global1
str x11, [x4]
mov x11, 5
ldr x4, =global1
str x11, [x4]
mov x11, 9
ldr x4, =global1
str x11, [x4]
mov x0, 38
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x4, x0
cmp x4, 0
cset x11, gt
cmp x11, 0
mov x24, x4
mov x4, 0
mov x11, 0
bne sum_lab0
b sum_returnLabel

inter_sum_lab0:
mov x24, x24
mov x4, x4
b sum_lab0

sum_lab0:
add x4, x4, x24
mov x11, 1
sub x24, x24, x11
cmp x24, 0
cset x11, gt
cmp x11, 0
mov x11, x4
bne inter_sum_lab0
b sum_returnLabel

sum_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x4, 1
ldr x11, =global1
str x4, [x11]
mov x4, 0
ldr x11, =global2
str x4, [x11]
mov x4, 0
ldr x11, =global3
str x4, [x11]
mov x0, 100
bl sum
mov x4, x0
ldr x11, =global1
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne interProceduralOptimization_lab0
b interProceduralOptimization_lab1

interProceduralOptimization_lab0:
mov x0, 10000
bl sum
mov x11, x0
mov x11, x11
b interProceduralOptimization_returnLabel

interProceduralOptimization_lab1:
ldr x11, =global2
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x4, x4
bne interProceduralOptimization_lab2
b interProceduralOptimization_lab4

interProceduralOptimization_lab2:
mov x0, 20000
bl sum
mov x11, x0
mov x4, x11
b interProceduralOptimization_lab4

interProceduralOptimization_lab4:
ldr x11, =global3
ldr x11, [x11]
cmp x11, 3
cset x11, eq
cmp x11, 0
mov x11, x4
bne interProceduralOptimization_lab5
b interProceduralOptimization_lab7

interProceduralOptimization_lab5:
mov x0, 30000
bl sum
mov x11, x0
mov x11, x11
b interProceduralOptimization_lab7

interProceduralOptimization_lab7:
mov x11, x11
b interProceduralOptimization_returnLabel

interProceduralOptimization_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x11, 1
cmp x11, 0
mov x24, 0
mov x4, 2
bne hoisting_lab0
b hoisting_returnLabel

inter_hoisting_lab0:
mov x24, x11
b hoisting_lab0

hoisting_lab0:
mov x11, 1
add x11, x24, x11
cmp x11, 1000000
cset x4, lt
cmp x4, 0
mov x4, 2
bne inter_hoisting_lab0
b hoisting_returnLabel

hoisting_returnLabel:
mov x0, x4
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x11, 1
cmp x11, 0
mov x11, 50
bne doubleIf_returnLabel
b doubleIf_lab4

doubleIf_lab4:
mov x11, 0
b doubleIf_returnLabel

doubleIf_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x24, x0
mov x11, x1
cmp x24, 0
cset x4, eq
cmp x4, 0
mov x4, x11
bne tailRecursionHelper_returnLabel
b tailRecursionHelper_lab1

tailRecursionHelper_lab1:
mov x4, 1
sub x4, x24, x4
add x11, x11, x24
mov x0, x4
mov x1, x11
bl tailRecursionHelper
mov x11, x0
mov x4, x11
b tailRecursionHelper_returnLabel

tailRecursionHelper_returnLabel:
mov x0, x4
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x11, x0
mov x0, x11
mov x1, 0
bl tailRecursionHelper
mov x11, x0
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x11, 1
cmp x11, 0
mov x4, 1
mov x11, 1
bne unswitching_lab0
b unswitching_returnLabel

inter_unswitching_lab0:
mov x4, x4
b unswitching_lab0

unswitching_lab0:
mov x11, 1
cmp x11, 0
bne unswitching_lab1
b unswitching_lab2

unswitching_lab1:
mov x11, 1
add x11, x4, x11
mov x4, x11
b unswitching_lab3

unswitching_lab2:
mov x11, 2
add x11, x4, x11
mov x4, x11
b unswitching_lab3

unswitching_lab3:
cmp x4, 1000000
cset x11, lt
cmp x11, 0
mov x11, x4
bne inter_unswitching_lab0
b unswitching_returnLabel

unswitching_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x9, x0
mov x11, 0
cmp x11, x9
cset x11, lt
cmp x11, 0
mov x24, 0
mov x11, 0
mov x6, 0
bne randomCalculation_lab0
b randomCalculation_returnLabel

inter_randomCalculation_lab0:
mov x24, x24
mov x11, x4
b randomCalculation_lab0

randomCalculation_lab0:
mov x4, 19
add x4, x11, x4
mov x11, 2
mul x24, x24, x11
mov x11, 2
sdiv x11, x24, x11
mov x24, 3
mul x24, x24, x11
mov x11, 3
sdiv x11, x24, x11
mov x24, 4
mul x24, x11, x24
mov x11, 4
sdiv x11, x24, x11
mov x24, 1
add x24, x11, x24
cmp x24, x9
cset x11, lt
cmp x11, 0
mov x6, x4
bne inter_randomCalculation_lab0
b randomCalculation_returnLabel

randomCalculation_returnLabel:
mov x0, x6
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x11, x0
mov x4, 0
cmp x4, x11
cset x4, lt
cmp x4, 0
mov x9, 1
mov x6, -1
mov x24, 0
mov x4, 1
bne iterativeFibonacci_lab0
b iterativeFibonacci_returnLabel

inter_iterativeFibonacci_lab0:
mov x9, x6
mov x6, x9
mov x24, x24
b iterativeFibonacci_lab0

iterativeFibonacci_lab0:
add x6, x9, x6
mov x4, 1
add x24, x24, x4
cmp x24, x11
cset x4, lt
cmp x4, 0
mov x4, x6
bne inter_iterativeFibonacci_lab0
b iterativeFibonacci_returnLabel

iterativeFibonacci_returnLabel:
mov x0, x4
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x22, x0
cmp x22, 0
cset x11, le
cmp x22, 1
cset x4, eq
orr x11, x11, x4
cmp x11, 0
mov x11, x22
bne recursiveFibonacci_returnLabel
b recursiveFibonacci_lab1

recursiveFibonacci_lab1:
mov x11, 1
sub x11, x22, x11
mov x0, x11
bl recursiveFibonacci
mov x24, x0
mov x11, 2
sub x11, x22, x11
mov x0, x11
bl recursiveFibonacci
mov x11, x0
add x11, x24, x11
mov x11, x11
b recursiveFibonacci_returnLabel

recursiveFibonacci_returnLabel:
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
ldr x22, =read_scratch
ldr x22, [x22]
mov x11, 1
cmp x11, x22
cset x11, lt
cmp x11, 0
mov x24, 1
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov x24, x11
b main_lab0

main_lab0:
bl constantFolding
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl constantPropagation
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl deadCodeElimination
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl interProceduralOptimization
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl commonSubexpressionElimination
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl hoisting
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl doubleIf
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl integerDivide
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl association
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 1000
sdiv x11, x22, x11
mov x0, x11
bl tailRecursion
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl unswitching
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x0, x22
bl randomCalculation
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 5
sdiv x11, x22, x11
mov x0, x11
bl iterativeFibonacci
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 1000
sdiv x11, x22, x11
mov x0, x11
bl recursiveFibonacci
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 1
add x11, x24, x11
cmp x11, x22
cset x4, lt
cmp x4, 0
bne inter_main_lab0
b main_returnLabel

main_returnLabel:
ldr x0, =println
mov x1, 9999
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

