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
constantFolding_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x9, sp, 96
add x4, sp, 104
mov x24, 8
mov x11, 9
mul x24, x24, x11
mov x11, 4
sdiv x11, x24, x11
mov x24, 2
add x11, x11, x24
mov x24, 5
mov x6, 8
mul x24, x24, x6
sub x24, x11, x24
mov x11, 9
add x11, x24, x11
mov x24, 12
sub x11, x11, x24
mov x24, 6
add x24, x11, x24
mov x11, 9
sub x11, x24, x11
mov x24, 18
sub x24, x11, x24
mov x6, 23
mov x11, 3
mul x6, x6, x11
mov x11, 23
sdiv x11, x6, x11
mov x6, 90
mul x11, x11, x6
add x11, x24, x11
str x11, [x4]
ldr x11, [x4]
str x11, [x9]
b constantFolding_returnLabel

constantFolding_returnLabel:
ldr x11, [x9]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global constantPropagation
constantPropagation:
constantPropagation_prologue:
stp x29, x30, [sp, -384]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x19, sp, 96
str x19, [sp, 368]
add x15, sp, 104
add x27, sp, 112
add x26, sp, 120
add x22, sp, 128
add x4, sp, 136
add x5, sp, 144
add x19, sp, 152
str x19, [sp, 384]
add x14, sp, 160
add x1, sp, 168
add x25, sp, 176
add x19, sp, 184
str x19, [sp, 352]
add x12, sp, 192
add x19, sp, 200
str x19, [sp, 344]
add x23, sp, 208
add x6, sp, 216
add x7, sp, 224
add x2, sp, 232
add x13, sp, 240
add x3, sp, 248
add x9, sp, 256
add x21, sp, 264
add x24, sp, 272
add x10, sp, 280
add x19, sp, 288
str x19, [sp, 376]
add x0, sp, 296
add x19, sp, 304
str x19, [sp, 360]
mov x11, 4
str x11, [x15]
mov x11, 7
str x11, [x27]
mov x11, 8
str x11, [x26]
mov x11, 5
str x11, [x22]
mov x11, 11
str x11, [x4]
mov x11, 21
str x11, [x5]
ldr x11, [x15]
ldr x28, [x27]
add x11, x11, x28
ldr x19, [sp, 384]
str x11, [x19]
ldr x11, [x26]
ldr x28, [x22]
add x11, x11, x28
str x11, [x14]
ldr x28, [x4]
ldr x11, [x5]
add x11, x28, x11
str x11, [x1]
ldr x19, [sp, 384]
ldr x28, [x19]
ldr x11, [x14]
add x11, x28, x11
str x11, [x25]
ldr x11, [x1]
ldr x28, [x25]
mul x11, x11, x28
ldr x19, [sp, 352]
str x11, [x19]
ldr x19, [x4]
str x19, [sp, 328]
ldr x28, [x14]
ldr x11, [x1]
mul x11, x28, x11
ldr x19, [sp, 328]
add x28, x19, x11
ldr x19, [sp, 352]
ldr x11, [x19]
sub x11, x28, x11
str x11, [x12]
ldr x28, [x14]
ldr x11, [x1]
ldr x19, [x25]
str x19, [sp, 336]
ldr x19, [sp, 336]
mul x11, x11, x19
sub x11, x28, x11
ldr x19, [sp, 352]
ldr x19, [x19]
str x19, [sp, 320]
ldr x28, [x12]
ldr x19, [sp, 320]
sdiv x28, x19, x28
add x11, x11, x28
ldr x19, [sp, 344]
str x11, [x19]
ldr x11, [x4]
ldr x28, [x5]
add x28, x11, x28
ldr x19, [sp, 384]
ldr x11, [x19]
add x28, x28, x11
ldr x11, [x14]
add x28, x28, x11
ldr x11, [x1]
add x11, x28, x11
ldr x25, [x25]
sub x11, x11, x25
str x11, [x23]
ldr x11, [x23]
ldr x19, [sp, 344]
ldr x25, [x19]
sub x11, x11, x25
ldr x25, [x14]
add x11, x11, x25
ldr x25, [x15]
sub x25, x11, x25
ldr x11, [x27]
sub x11, x25, x11
str x11, [x6]
ldr x19, [sp, 352]
ldr x11, [x19]
ldr x25, [x12]
add x25, x11, x25
ldr x19, [sp, 384]
ldr x11, [x19]
sub x11, x25, x11
ldr x25, [x14]
sub x11, x11, x25
str x11, [x7]
ldr x25, [x27]
ldr x11, [x15]
sub x25, x25, x11
ldr x11, [x22]
mul x25, x25, x11
ldr x11, [x1]
sub x11, x25, x11
str x11, [x2]
ldr x2, [x12]
ldr x11, [x26]
mul x2, x2, x11
ldr x11, [x22]
mul x11, x2, x11
ldr x2, [x6]
add x11, x11, x2
str x11, [x13]
ldr x2, [x27]
ldr x11, [x15]
mul x2, x2, x11
ldr x11, [x26]
mul x2, x2, x11
ldr x11, [x4]
sdiv x4, x2, x11
ldr x11, [x6]
sub x11, x4, x11
str x11, [x3]
ldr x4, [x1]
ldr x19, [sp, 352]
ldr x11, [x19]
add x11, x4, x11
ldr x4, [x26]
add x4, x11, x4
ldr x11, [x7]
sub x11, x4, x11
str x11, [x9]
ldr x11, [x23]
ldr x4, [x6]
add x11, x11, x4
ldr x2, [x5]
ldr x4, [x15]
mul x4, x2, x4
sub x11, x11, x4
str x11, [x21]
ldr x11, [x15]
ldr x4, [x27]
mul x11, x11, x4
ldr x19, [sp, 352]
ldr x4, [x19]
sub x11, x11, x4
ldr x4, [x12]
sub x11, x11, x4
str x11, [x24]
ldr x4, [x24]
ldr x11, [x3]
sub x4, x4, x11
ldr x11, [x13]
ldr x22, [x22]
mul x11, x11, x22
sub x11, x4, x11
str x11, [x10]
ldr x4, [x6]
ldr x11, [x10]
sub x4, x4, x11
ldr x11, [x24]
sub x4, x4, x11
ldr x11, [x23]
sub x11, x4, x11
ldr x19, [sp, 376]
str x11, [x19]
ldr x11, [x7]
ldr x19, [sp, 376]
ldr x4, [x19]
mul x11, x11, x4
ldr x4, [x9]
add x11, x11, x4
ldr x4, [x10]
sub x11, x11, x4
str x11, [x0]
ldr x4, [x10]
ldr x19, [sp, 376]
ldr x11, [x19]
sub x4, x4, x11
ldr x11, [x0]
add x4, x4, x11
ldr x19, [sp, 352]
ldr x11, [x19]
add x11, x4, x11
ldr x19, [sp, 360]
str x11, [x19]
ldr x19, [sp, 360]
ldr x11, [x19]
ldr x19, [sp, 368]
str x11, [x19]
b constantPropagation_returnLabel

constantPropagation_returnLabel:
ldr x19, [sp, 368]
ldr x11, [x19]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 384
ret

.global deadCodeElimination
deadCodeElimination:
deadCodeElimination_prologue:
stp x29, x30, [sp, -144]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x9, sp, 96
add x25, sp, 104
add x2, sp, 112
add x24, sp, 120
add x6, sp, 128
add x22, sp, 136
mov x11, 4
str x11, [x25]
mov x11, 5
str x11, [x25]
mov x11, 7
str x11, [x25]
mov x11, 8
str x11, [x25]
mov x11, 6
str x11, [x2]
mov x11, 9
str x11, [x2]
mov x11, 12
str x11, [x2]
mov x11, 8
str x11, [x2]
mov x11, 10
str x11, [x24]
mov x11, 13
str x11, [x24]
mov x11, 9
str x11, [x24]
mov x11, 45
str x11, [x6]
mov x11, 12
str x11, [x6]
mov x11, 3
str x11, [x6]
mov x11, 23
str x11, [x22]
mov x11, 10
str x11, [x22]
mov x11, 11
ldr x4, =global1
str x11, [x4]
mov x11, 5
ldr x4, =global1
str x11, [x4]
mov x11, 9
ldr x4, =global1
str x11, [x4]
ldr x4, [x25]
ldr x11, [x2]
add x11, x4, x11
ldr x4, [x24]
add x4, x11, x4
ldr x11, [x6]
add x11, x4, x11
ldr x4, [x22]
add x11, x11, x4
str x11, [x9]
b deadCodeElimination_returnLabel

deadCodeElimination_returnLabel:
ldr x11, [x9]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 144
ret

.global sum
sum:
sum_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
add x9, sp, 104
add x4, sp, 112
str x11, [x9]
mov x11, 0
str x11, [x4]
ldr x11, [x9]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne sum_lab0
b sum_lab1

sum_lab0:
ldr x11, [x4]
ldr x6, [x9]
add x11, x11, x6
str x11, [x4]
ldr x6, [x9]
mov x11, 1
sub x11, x6, x11
str x11, [x9]
ldr x11, [x9]
cmp x11, 0
cset x11, gt
cmp x11, 0
bne sum_lab0
b sum_lab1

sum_lab1:
ldr x11, [x4]
str x11, [x24]
b sum_returnLabel

sum_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global doesntModifyGlobals
doesntModifyGlobals:
doesntModifyGlobals_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x4, sp, 96
add x24, sp, 104
add x6, sp, 112
mov x11, 1
str x11, [x24]
mov x11, 2
str x11, [x6]
ldr x11, [x24]
ldr x24, [x6]
add x11, x11, x24
str x11, [x4]
b doesntModifyGlobals_returnLabel

doesntModifyGlobals_returnLabel:
ldr x11, [x4]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global interProceduralOptimization
interProceduralOptimization:
interProceduralOptimization_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x24, sp, 96
add x22, sp, 104
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
mov x11, x0
str x11, [x22]
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
str x11, [x22]
b interProceduralOptimization_lab8

interProceduralOptimization_lab1:
ldr x11, =global2
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne interProceduralOptimization_lab2
b interProceduralOptimization_lab3

interProceduralOptimization_lab2:
mov x0, 20000
bl sum
mov x11, x0
str x11, [x22]
b interProceduralOptimization_lab4

interProceduralOptimization_lab3:
b interProceduralOptimization_lab4

interProceduralOptimization_lab4:
ldr x11, =global3
ldr x11, [x11]
cmp x11, 3
cset x11, eq
cmp x11, 0
bne interProceduralOptimization_lab5
b interProceduralOptimization_lab6

interProceduralOptimization_lab5:
mov x0, 30000
bl sum
mov x11, x0
str x11, [x22]
b interProceduralOptimization_lab7

interProceduralOptimization_lab6:
b interProceduralOptimization_lab7

interProceduralOptimization_lab7:
b interProceduralOptimization_lab8

interProceduralOptimization_lab8:
ldr x11, [x22]
str x11, [x24]
b interProceduralOptimization_returnLabel

interProceduralOptimization_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global commonSubexpressionElimination
commonSubexpressionElimination:
commonSubexpressionElimination_prologue:
stp x29, x30, [sp, -624]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x19, sp, 96
str x19, [sp, 480]
add x22, sp, 104
add x5, sp, 112
add x15, sp, 120
add x19, sp, 128
str x19, [sp, 568]
add x6, sp, 136
add x0, sp, 144
add x21, sp, 152
add x25, sp, 160
add x19, sp, 168
str x19, [sp, 464]
add x19, sp, 176
str x19, [sp, 616]
add x3, sp, 184
add x23, sp, 192
add x10, sp, 200
add x13, sp, 208
add x24, sp, 216
add x2, sp, 224
add x14, sp, 232
add x7, sp, 240
add x19, sp, 248
str x19, [sp, 592]
add x9, sp, 256
add x19, sp, 264
str x19, [sp, 552]
add x26, sp, 272
add x12, sp, 280
add x27, sp, 288
add x4, sp, 296
add x1, sp, 304
mov x11, 11
str x11, [x22]
mov x11, 22
str x11, [x5]
mov x11, 33
str x11, [x15]
mov x11, 44
ldr x19, [sp, 568]
str x11, [x19]
mov x11, 55
str x11, [x6]
mov x11, 66
str x11, [x0]
mov x11, 77
str x11, [x21]
ldr x28, [x22]
ldr x11, [x5]
mul x11, x28, x11
str x11, [x25]
ldr x11, [x15]
ldr x19, [sp, 568]
ldr x28, [x19]
sdiv x11, x11, x28
ldr x19, [sp, 464]
str x11, [x19]
ldr x11, [x6]
ldr x28, [x0]
mul x11, x11, x28
ldr x19, [sp, 616]
str x11, [x19]
ldr x11, [x22]
ldr x28, [x5]
mul x19, x11, x28
str x19, [sp, 344]
ldr x11, [x15]
ldr x19, [sp, 568]
ldr x28, [x19]
sdiv x11, x11, x28
ldr x19, [sp, 344]
add x19, x19, x11
str x19, [sp, 368]
ldr x28, [x6]
ldr x11, [x0]
mul x11, x28, x11
ldr x19, [sp, 368]
sub x28, x19, x11
ldr x11, [x21]
add x11, x28, x11
str x11, [x3]
ldr x28, [x22]
ldr x11, [x5]
mul x28, x28, x11
ldr x19, [x15]
str x19, [sp, 576]
ldr x19, [sp, 568]
ldr x11, [x19]
ldr x19, [sp, 576]
sdiv x11, x19, x11
add x28, x28, x11
ldr x11, [x6]
ldr x19, [x0]
str x19, [sp, 504]
ldr x19, [sp, 504]
mul x11, x11, x19
sub x11, x28, x11
ldr x28, [x21]
add x11, x11, x28
str x11, [x23]
ldr x28, [x22]
ldr x11, [x5]
mul x11, x28, x11
ldr x28, [x15]
ldr x19, [sp, 568]
ldr x19, [x19]
str x19, [sp, 408]
ldr x19, [sp, 408]
sdiv x28, x28, x19
add x11, x11, x28
ldr x28, [x6]
ldr x19, [x0]
str x19, [sp, 384]
ldr x19, [sp, 384]
mul x28, x28, x19
sub x28, x11, x28
ldr x11, [x21]
add x11, x28, x11
str x11, [x10]
ldr x28, [x22]
ldr x11, [x5]
mul x28, x28, x11
ldr x19, [x15]
str x19, [sp, 520]
ldr x19, [sp, 568]
ldr x11, [x19]
ldr x19, [sp, 520]
sdiv x11, x19, x11
add x28, x28, x11
ldr x19, [x6]
str x19, [sp, 336]
ldr x11, [x0]
ldr x19, [sp, 336]
mul x11, x19, x11
sub x28, x28, x11
ldr x11, [x21]
add x11, x28, x11
str x11, [x13]
ldr x11, [x22]
ldr x28, [x5]
mul x28, x11, x28
ldr x19, [x15]
str x19, [sp, 472]
ldr x19, [sp, 568]
ldr x11, [x19]
ldr x19, [sp, 472]
sdiv x11, x19, x11
add x28, x28, x11
ldr x19, [x6]
str x19, [sp, 536]
ldr x11, [x0]
ldr x19, [sp, 536]
mul x11, x19, x11
sub x28, x28, x11
ldr x11, [x21]
add x11, x28, x11
str x11, [x24]
ldr x28, [x22]
ldr x11, [x5]
mul x19, x28, x11
str x19, [sp, 400]
ldr x28, [x15]
ldr x19, [sp, 568]
ldr x11, [x19]
sdiv x11, x28, x11
ldr x19, [sp, 400]
add x19, x19, x11
str x19, [sp, 352]
ldr x28, [x6]
ldr x11, [x0]
mul x11, x28, x11
ldr x19, [sp, 352]
sub x28, x19, x11
ldr x11, [x21]
add x11, x28, x11
str x11, [x2]
ldr x28, [x22]
ldr x11, [x5]
mul x11, x28, x11
ldr x19, [x15]
str x19, [sp, 512]
ldr x19, [sp, 568]
ldr x28, [x19]
ldr x19, [sp, 512]
sdiv x28, x19, x28
add x28, x11, x28
ldr x11, [x6]
ldr x19, [x0]
str x19, [sp, 392]
ldr x19, [sp, 392]
mul x11, x11, x19
sub x11, x28, x11
ldr x28, [x21]
add x11, x11, x28
str x11, [x14]
ldr x11, [x22]
ldr x28, [x5]
mul x11, x11, x28
ldr x19, [x15]
str x19, [sp, 496]
ldr x19, [sp, 568]
ldr x28, [x19]
ldr x19, [sp, 496]
sdiv x28, x19, x28
add x11, x11, x28
ldr x19, [x6]
str x19, [sp, 624]
ldr x28, [x0]
ldr x19, [sp, 624]
mul x28, x19, x28
sub x11, x11, x28
ldr x28, [x21]
add x11, x11, x28
str x11, [x7]
ldr x28, [x22]
ldr x11, [x5]
mul x28, x28, x11
ldr x19, [x15]
str x19, [sp, 440]
ldr x19, [sp, 568]
ldr x11, [x19]
ldr x19, [sp, 440]
sdiv x11, x19, x11
add x19, x28, x11
str x19, [sp, 320]
ldr x28, [x6]
ldr x11, [x0]
mul x11, x28, x11
ldr x19, [sp, 320]
sub x11, x19, x11
ldr x28, [x21]
add x11, x11, x28
ldr x19, [sp, 592]
str x11, [x19]
ldr x11, [x22]
ldr x28, [x5]
mul x11, x11, x28
ldr x28, [x15]
ldr x19, [sp, 568]
ldr x19, [x19]
str x19, [sp, 416]
ldr x19, [sp, 416]
sdiv x28, x28, x19
add x28, x11, x28
ldr x19, [x6]
str x19, [sp, 456]
ldr x11, [x0]
ldr x19, [sp, 456]
mul x11, x19, x11
sub x28, x28, x11
ldr x11, [x21]
add x11, x28, x11
str x11, [x9]
ldr x28, [x22]
ldr x11, [x5]
mul x19, x28, x11
str x19, [sp, 448]
ldr x28, [x15]
ldr x19, [sp, 568]
ldr x11, [x19]
sdiv x11, x28, x11
ldr x19, [sp, 448]
add x11, x19, x11
ldr x19, [x6]
str x19, [sp, 488]
ldr x28, [x0]
ldr x19, [sp, 488]
mul x28, x19, x28
sub x11, x11, x28
ldr x28, [x21]
add x11, x11, x28
ldr x19, [sp, 552]
str x11, [x19]
ldr x28, [x5]
ldr x11, [x22]
mul x28, x28, x11
ldr x11, [x15]
ldr x19, [sp, 568]
ldr x19, [x19]
str x19, [sp, 560]
ldr x19, [sp, 560]
sdiv x11, x11, x19
add x28, x28, x11
ldr x19, [x6]
str x19, [sp, 432]
ldr x11, [x0]
ldr x19, [sp, 432]
mul x11, x19, x11
sub x28, x28, x11
ldr x11, [x21]
add x11, x28, x11
str x11, [x26]
ldr x11, [x22]
ldr x28, [x5]
mul x19, x11, x28
str x19, [sp, 608]
ldr x11, [x15]
ldr x19, [sp, 568]
ldr x28, [x19]
sdiv x11, x11, x28
ldr x19, [sp, 608]
add x11, x19, x11
ldr x28, [x0]
ldr x19, [x6]
str x19, [sp, 328]
ldr x19, [sp, 328]
mul x28, x28, x19
sub x28, x11, x28
ldr x11, [x21]
add x11, x28, x11
str x11, [x12]
ldr x28, [x21]
ldr x11, [x22]
ldr x19, [x5]
str x19, [sp, 528]
ldr x19, [sp, 528]
mul x11, x11, x19
add x28, x28, x11
ldr x11, [x15]
ldr x19, [sp, 568]
ldr x19, [x19]
str x19, [sp, 424]
ldr x19, [sp, 424]
sdiv x11, x11, x19
add x19, x28, x11
str x19, [sp, 584]
ldr x11, [x6]
ldr x28, [x0]
mul x11, x11, x28
ldr x19, [sp, 584]
sub x11, x19, x11
str x11, [x27]
ldr x28, [x22]
ldr x11, [x5]
mul x19, x28, x11
str x19, [sp, 376]
ldr x28, [x15]
ldr x19, [sp, 568]
ldr x11, [x19]
sdiv x11, x28, x11
ldr x19, [sp, 376]
add x19, x19, x11
str x19, [sp, 544]
ldr x11, [x6]
ldr x28, [x0]
mul x11, x11, x28
ldr x19, [sp, 544]
sub x11, x19, x11
ldr x28, [x21]
add x11, x11, x28
str x11, [x4]
ldr x28, [x15]
ldr x19, [sp, 568]
ldr x11, [x19]
sdiv x28, x28, x11
ldr x11, [x22]
ldr x19, [x5]
str x19, [sp, 360]
ldr x19, [sp, 360]
mul x11, x11, x19
add x11, x28, x11
ldr x28, [x6]
ldr x19, [x0]
str x19, [sp, 600]
ldr x19, [sp, 600]
mul x28, x28, x19
sub x11, x11, x28
ldr x28, [x21]
add x11, x11, x28
str x11, [x1]
ldr x11, [x22]
ldr x22, [x5]
add x11, x11, x22
ldr x22, [x15]
add x11, x11, x22
ldr x19, [sp, 568]
ldr x22, [x19]
add x11, x11, x22
ldr x6, [x6]
add x11, x11, x6
ldr x6, [x0]
add x11, x11, x6
ldr x6, [x21]
add x11, x11, x6
ldr x6, [x25]
add x11, x11, x6
ldr x19, [sp, 464]
ldr x6, [x19]
add x6, x11, x6
ldr x19, [sp, 616]
ldr x11, [x19]
add x11, x6, x11
ldr x6, [x3]
add x6, x11, x6
ldr x11, [x23]
add x6, x6, x11
ldr x11, [x10]
add x11, x6, x11
ldr x6, [x13]
add x11, x11, x6
ldr x24, [x24]
add x24, x11, x24
ldr x11, [x2]
add x24, x24, x11
ldr x11, [x14]
add x24, x24, x11
ldr x11, [x7]
add x24, x24, x11
ldr x19, [sp, 592]
ldr x11, [x19]
add x11, x24, x11
ldr x24, [x9]
add x24, x11, x24
ldr x19, [sp, 552]
ldr x11, [x19]
add x11, x24, x11
ldr x24, [x26]
add x24, x11, x24
ldr x11, [x12]
add x11, x24, x11
ldr x24, [x27]
add x11, x11, x24
ldr x4, [x4]
add x4, x11, x4
ldr x11, [x1]
add x11, x4, x11
ldr x19, [sp, 480]
str x11, [x19]
b commonSubexpressionElimination_returnLabel

commonSubexpressionElimination_returnLabel:
ldr x19, [sp, 480]
ldr x11, [x19]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 624
ret

.global hoisting
hoisting:
hoisting_prologue:
stp x29, x30, [sp, -176]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x24, sp, 96
add x25, sp, 104
add x2, sp, 112
add x12, sp, 120
add x11, sp, 128
add x9, sp, 136
add x4, sp, 144
add x27, sp, 152
add x22, sp, 160
add x6, sp, 168
mov x4, 1
str x4, [x25]
mov x4, 2
str x4, [x2]
mov x4, 3
str x4, [x12]
mov x4, 4
str x4, [x11]
mov x4, 0
str x4, [x6]
ldr x4, [x6]
cmp x4, 1000000
cset x4, lt
cmp x4, 0
bne hoisting_lab0
b hoisting_lab1

hoisting_lab0:
mov x4, 5
str x4, [x9]
ldr x4, [x25]
ldr x9, [x2]
add x9, x4, x9
ldr x4, [x12]
add x4, x9, x4
str x4, [x27]
ldr x4, [x12]
ldr x11, [x11]
add x4, x4, x11
ldr x11, [x27]
add x11, x4, x11
str x11, [x22]
ldr x4, [x6]
mov x11, 1
add x11, x4, x11
str x11, [x6]
ldr x11, [x6]
cmp x11, 1000000
cset x11, lt
cmp x11, 0
bne hoisting_lab0
b hoisting_lab1

hoisting_lab1:
ldr x11, [x2]
str x11, [x24]
b hoisting_returnLabel

hoisting_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 176
ret

.global doubleIf
doubleIf:
doubleIf_prologue:
stp x29, x30, [sp, -144]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x6, sp, 96
add x22, sp, 104
add x4, sp, 112
add x9, sp, 120
add x24, sp, 128
mov x11, 1
str x11, [x22]
mov x11, 2
str x11, [x4]
mov x11, 3
str x11, [x9]
mov x11, 0
str x11, [x24]
ldr x11, [x22]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne doubleIf_lab0
b doubleIf_lab4

doubleIf_lab0:
mov x11, 20
str x11, [x4]
ldr x11, [x22]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne doubleIf_lab1
b doubleIf_lab2

doubleIf_lab1:
mov x11, 200
str x11, [x4]
mov x11, 300
str x11, [x9]
b doubleIf_lab3

doubleIf_lab2:
mov x11, 1
str x11, [x22]
mov x11, 2
str x11, [x4]
mov x11, 3
str x11, [x9]
b doubleIf_lab3

doubleIf_lab3:
mov x11, 50
str x11, [x24]
b doubleIf_lab5

doubleIf_lab4:
b doubleIf_lab5

doubleIf_lab5:
ldr x11, [x24]
str x11, [x6]
b doubleIf_returnLabel

doubleIf_returnLabel:
ldr x11, [x6]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 144
ret

.global integerDivide
integerDivide:
integerDivide_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x11, sp, 96
add x6, sp, 104
mov x4, 3000
str x4, [x6]
ldr x4, [x6]
mov x24, 2
sdiv x4, x4, x24
str x4, [x6]
ldr x24, [x6]
mov x4, 4
mul x4, x24, x4
str x4, [x6]
ldr x24, [x6]
mov x4, 8
sdiv x4, x24, x4
str x4, [x6]
ldr x24, [x6]
mov x4, 16
sdiv x4, x24, x4
str x4, [x6]
ldr x4, [x6]
mov x24, 32
mul x4, x4, x24
str x4, [x6]
ldr x4, [x6]
mov x24, 64
sdiv x4, x4, x24
str x4, [x6]
ldr x24, [x6]
mov x4, 128
mul x4, x24, x4
str x4, [x6]
ldr x4, [x6]
mov x24, 4
sdiv x4, x4, x24
str x4, [x6]
ldr x4, [x6]
str x4, [x11]
b integerDivide_returnLabel

integerDivide_returnLabel:
ldr x11, [x11]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global association
association:
association_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x6, sp, 96
add x4, sp, 104
mov x11, 10
str x11, [x4]
ldr x24, [x4]
mov x11, 2
mul x11, x24, x11
str x11, [x4]
ldr x24, [x4]
mov x11, 2
sdiv x11, x24, x11
str x11, [x4]
ldr x24, [x4]
mov x11, 3
mul x11, x11, x24
str x11, [x4]
ldr x11, [x4]
mov x24, 3
sdiv x11, x11, x24
str x11, [x4]
ldr x24, [x4]
mov x11, 4
mul x11, x24, x11
str x11, [x4]
ldr x11, [x4]
mov x24, 4
sdiv x11, x11, x24
str x11, [x4]
ldr x11, [x4]
mov x24, 4
add x11, x11, x24
str x11, [x4]
ldr x11, [x4]
mov x24, 4
sub x11, x11, x24
str x11, [x4]
ldr x11, [x4]
mov x24, 50
mul x11, x11, x24
str x11, [x4]
ldr x11, [x4]
mov x24, 50
sdiv x11, x11, x24
str x11, [x4]
ldr x11, [x4]
str x11, [x6]
b association_returnLabel

association_returnLabel:
ldr x11, [x6]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global tailRecursionHelper
tailRecursionHelper:
tailRecursionHelper_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
mov x11, x1
add x24, sp, 96
add x6, sp, 104
add x9, sp, 112
str x4, [x6]
str x11, [x9]
ldr x11, [x6]
cmp x11, 0
cset x11, eq
cmp x11, 0
bne tailRecursionHelper_lab0
b tailRecursionHelper_lab1

tailRecursionHelper_lab0:
ldr x11, [x9]
str x11, [x24]
b tailRecursionHelper_returnLabel

tailRecursionHelper_lab1:
ldr x4, [x6]
mov x11, 1
sub x22, x4, x11
ldr x4, [x9]
ldr x11, [x6]
add x11, x4, x11
mov x0, x22
mov x1, x11
bl tailRecursionHelper
mov x11, x0
str x11, [x24]
b tailRecursionHelper_returnLabel

tailRecursionHelper_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global tailRecursion
tailRecursion:
tailRecursion_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
add x24, sp, 96
add x11, sp, 104
str x4, [x11]
ldr x11, [x11]
mov x0, x11
mov x1, 0
bl tailRecursionHelper
mov x11, x0
str x11, [x24]
b tailRecursion_returnLabel

tailRecursion_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global unswitching
unswitching:
unswitching_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x6, sp, 96
add x4, sp, 104
add x24, sp, 112
mov x11, 1
str x11, [x4]
mov x11, 2
str x11, [x24]
ldr x11, [x4]
cmp x11, 1000000
cset x11, lt
cmp x11, 0
bne unswitching_lab0
b unswitching_lab4

unswitching_lab0:
ldr x11, [x24]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne unswitching_lab1
b unswitching_lab2

unswitching_lab1:
ldr x24, [x4]
mov x11, 1
add x11, x24, x11
str x11, [x4]
b unswitching_lab3

unswitching_lab2:
ldr x11, [x4]
mov x24, 2
add x11, x11, x24
str x11, [x4]
b unswitching_lab3

unswitching_lab3:
ldr x11, [x4]
cmp x11, 1000000
cset x11, lt
cmp x11, 0
bne unswitching_lab0
b unswitching_lab4

unswitching_lab4:
ldr x11, [x4]
str x11, [x6]
b unswitching_returnLabel

unswitching_returnLabel:
ldr x11, [x6]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global randomCalculation
randomCalculation:
randomCalculation_prologue:
stp x29, x30, [sp, -176]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x6, sp, 96
add x24, sp, 104
add x27, sp, 112
add x2, sp, 120
add x0, sp, 128
add x12, sp, 136
add x25, sp, 144
add x22, sp, 152
add x9, sp, 160
str x11, [x24]
mov x11, 0
str x11, [x22]
mov x11, 0
str x11, [x9]
ldr x4, [x22]
ldr x11, [x24]
cmp x4, x11
cset x11, lt
cmp x11, 0
bne randomCalculation_lab0
b randomCalculation_lab1

randomCalculation_lab0:
mov x11, 4
str x11, [x27]
mov x11, 7
str x11, [x2]
mov x11, 8
str x11, [x0]
ldr x4, [x27]
ldr x11, [x2]
add x11, x4, x11
str x11, [x12]
ldr x4, [x12]
ldr x11, [x0]
add x11, x4, x11
str x11, [x25]
ldr x11, [x9]
ldr x4, [x25]
add x11, x11, x4
str x11, [x9]
ldr x4, [x22]
mov x11, 2
mul x11, x4, x11
str x11, [x22]
ldr x4, [x22]
mov x11, 2
sdiv x11, x4, x11
str x11, [x22]
ldr x11, [x22]
mov x4, 3
mul x11, x4, x11
str x11, [x22]
ldr x11, [x22]
mov x4, 3
sdiv x11, x11, x4
str x11, [x22]
ldr x4, [x22]
mov x11, 4
mul x11, x4, x11
str x11, [x22]
ldr x4, [x22]
mov x11, 4
sdiv x11, x4, x11
str x11, [x22]
ldr x4, [x22]
mov x11, 1
add x11, x4, x11
str x11, [x22]
ldr x11, [x22]
ldr x4, [x24]
cmp x11, x4
cset x11, lt
cmp x11, 0
bne randomCalculation_lab0
b randomCalculation_lab1

randomCalculation_lab1:
ldr x11, [x9]
str x11, [x6]
b randomCalculation_returnLabel

randomCalculation_returnLabel:
ldr x11, [x6]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 176
ret

.global iterativeFibonacci
iterativeFibonacci:
iterativeFibonacci_prologue:
stp x29, x30, [sp, -160]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x25, sp, 96
add x24, sp, 104
add x22, sp, 112
add x2, sp, 120
add x4, sp, 128
add x4, sp, 136
add x6, sp, 144
str x11, [x24]
mov x11, 0
mov x9, 1
sub x11, x11, x9
str x11, [x22]
mov x11, 1
str x11, [x2]
mov x11, 0
str x11, [x4]
ldr x9, [x4]
ldr x11, [x24]
cmp x9, x11
cset x11, lt
cmp x11, 0
bne iterativeFibonacci_lab0
b iterativeFibonacci_lab1

iterativeFibonacci_lab0:
ldr x9, [x2]
ldr x11, [x22]
add x11, x9, x11
str x11, [x6]
ldr x11, [x2]
str x11, [x22]
ldr x11, [x6]
str x11, [x2]
ldr x11, [x4]
mov x6, 1
add x11, x11, x6
str x11, [x4]
ldr x11, [x4]
ldr x4, [x24]
cmp x11, x4
cset x11, lt
cmp x11, 0
bne iterativeFibonacci_lab0
b iterativeFibonacci_lab1

iterativeFibonacci_lab1:
ldr x11, [x2]
str x11, [x25]
b iterativeFibonacci_returnLabel

iterativeFibonacci_returnLabel:
ldr x11, [x25]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 160
ret

.global recursiveFibonacci
recursiveFibonacci:
recursiveFibonacci_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
add x22, sp, 104
str x11, [x22]
ldr x11, [x22]
cmp x11, 0
cset x11, le
ldr x4, [x22]
cmp x4, 1
cset x4, eq
orr x11, x11, x4
cmp x11, 0
bne recursiveFibonacci_lab0
b recursiveFibonacci_lab1

recursiveFibonacci_lab0:
ldr x11, [x22]
str x11, [x24]
b recursiveFibonacci_returnLabel

recursiveFibonacci_lab1:
ldr x11, [x22]
mov x4, 1
sub x11, x11, x4
mov x0, x11
bl recursiveFibonacci
mov x25, x0
ldr x11, [x22]
mov x4, 2
sub x11, x11, x4
mov x0, x11
bl recursiveFibonacci
mov x11, x0
add x11, x25, x11
str x11, [x24]
b recursiveFibonacci_returnLabel

recursiveFibonacci_returnLabel:
ldr x11, [x24]
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
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x22, sp, 96
add x25, sp, 104
add x24, sp, 112
add x27, sp, 120
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x25]
mov x11, 1
str x11, [x27]
ldr x4, [x27]
ldr x11, [x25]
cmp x4, x11
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab0:
bl constantFolding
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl constantPropagation
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl deadCodeElimination
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl interProceduralOptimization
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl commonSubexpressionElimination
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl hoisting
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl doubleIf
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl integerDivide
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl association
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x25]
mov x4, 1000
sdiv x11, x11, x4
mov x0, x11
bl tailRecursion
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
bl unswitching
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x25]
mov x0, x11
bl randomCalculation
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x4, [x25]
mov x11, 5
sdiv x11, x4, x11
mov x0, x11
bl iterativeFibonacci
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x25]
mov x4, 1000
sdiv x11, x11, x4
mov x0, x11
bl recursiveFibonacci
mov x11, x0
str x11, [x24]
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x27]
mov x4, 1
add x11, x11, x4
str x11, [x27]
ldr x4, [x27]
ldr x11, [x25]
cmp x4, x11
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab1:
ldr x0, =println
mov x1, 9999
bl printf
mov x11, x0
mov x11, 0
str x11, [x22]
b main_returnLabel

main_returnLabel:
ldr x11, [x22]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

