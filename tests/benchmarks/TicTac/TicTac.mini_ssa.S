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
.global cleanBoard
cleanBoard:
cleanBoard_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r14, 0
mov r15, 8
mul r13, r14, r15
add r1, r0, r13
str 0, [r1]
mov r20, 1
mov r21, 8
mul r19, r20, r21
add r2, r0, r19
str 0, [r2]
mov r26, 2
mov r27, 8
mul r25, r26, r27
add r3, r0, r25
str 0, [r3]
mov r32, 3
mov r33, 8
mul r31, r32, r33
add r4, r0, r31
str 0, [r4]
mov r38, 4
mov r39, 8
mul r37, r38, r39
add r5, r0, r37
str 0, [r5]
mov r44, 5
mov r45, 8
mul r43, r44, r45
add r6, r0, r43
str 0, [r6]
mov r50, 6
mov r51, 8
mul r49, r50, r51
add r7, r0, r49
str 0, [r7]
mov r56, 7
mov r57, 8
mul r55, r56, r57
add r8, r0, r55
str 0, [r8]
mov r62, 8
mov r63, 8
mul r61, r62, r63
add r9, r0, r61
str 0, [r9]
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global printBoard
printBoard:
printBoard_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r32, 0
mov r33, 8
mul r31, r32, r33
add r1, r0, r31
ldr r2, [r1]
ldr x0, =print
mov x1, r2
bl printf
mov r3, x0
mov r38, 1
mov r39, 8
mul r37, r38, r39
add r4, r0, r37
ldr r5, [r4]
ldr x0, =print
mov x1, r5
bl printf
mov r6, x0
mov r44, 2
mov r45, 8
mul r43, r44, r45
add r7, r0, r43
ldr r8, [r7]
ldr x0, =println
mov x1, r8
bl printf
mov r9, x0
mov r50, 3
mov r51, 8
mul r49, r50, r51
add r10, r0, r49
ldr r11, [r10]
ldr x0, =print
mov x1, r11
bl printf
mov r12, x0
mov r56, 4
mov r57, 8
mul r55, r56, r57
add r13, r0, r55
ldr r14, [r13]
ldr x0, =print
mov x1, r14
bl printf
mov r15, x0
mov r62, 5
mov r63, 8
mul r61, r62, r63
add r16, r0, r61
ldr r17, [r16]
ldr x0, =println
mov x1, r17
bl printf
mov r18, x0
mov r68, 6
mov r69, 8
mul r67, r68, r69
add r19, r0, r67
ldr r20, [r19]
ldr x0, =print
mov x1, r20
bl printf
mov r21, x0
mov r74, 7
mov r75, 8
mul r73, r74, r75
add r22, r0, r73
ldr r23, [r22]
ldr x0, =print
mov x1, r23
bl printf
mov r24, x0
mov r80, 8
mov r81, 8
mul r79, r80, r81
add r25, r0, r79
ldr r26, [r25]
ldr x0, =println
mov x1, r26
bl printf
mov r27, x0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global printMoveBoard
printMoveBoard:
printMoveBoard_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

ldr x0, =println
mov x1, 123
bl printf
mov r0, x0
ldr x0, =println
mov x1, 456
bl printf
mov r1, x0
ldr x0, =println
mov x1, 789
bl printf
mov r2, x0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global placePiece
placePiece:
placePiece_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
mov r2, x2
cmp r2, 1
cset r3, eq
cmp r3, 0
bne placePiece_lab0
b placePiece_lab1

placePiece_lab0:
mov r69, 0
mov r70, 8
mul r68, r69, r70
add r5, r0, r68
str r1, [r5]
b placePiece_returnLabel

placePiece_lab1:
cmp r2, 2
cset r8, eq
cmp r8, 0
bne placePiece_lab2
b placePiece_lab3

placePiece_lab2:
mov r75, 1
mov r76, 8
mul r74, r75, r76
add r10, r0, r74
str r1, [r10]
b placePiece_returnLabel

placePiece_lab3:
cmp r2, 3
cset r13, eq
cmp r13, 0
bne placePiece_lab4
b placePiece_lab5

placePiece_lab4:
mov r81, 2
mov r82, 8
mul r80, r81, r82
add r15, r0, r80
str r1, [r15]
b placePiece_returnLabel

placePiece_lab5:
cmp r2, 4
cset r18, eq
cmp r18, 0
bne placePiece_lab6
b placePiece_lab7

placePiece_lab6:
mov r87, 3
mov r88, 8
mul r86, r87, r88
add r20, r0, r86
str r1, [r20]
b placePiece_returnLabel

placePiece_lab7:
cmp r2, 5
cset r23, eq
cmp r23, 0
bne placePiece_lab8
b placePiece_lab9

placePiece_lab8:
mov r93, 4
mov r94, 8
mul r92, r93, r94
add r25, r0, r92
str r1, [r25]
b placePiece_returnLabel

placePiece_lab9:
cmp r2, 6
cset r28, eq
cmp r28, 0
bne placePiece_lab10
b placePiece_lab11

placePiece_lab10:
mov r99, 5
mov r100, 8
mul r98, r99, r100
add r30, r0, r98
str r1, [r30]
b placePiece_returnLabel

placePiece_lab11:
cmp r2, 7
cset r33, eq
cmp r33, 0
bne placePiece_lab12
b placePiece_lab13

placePiece_lab12:
mov r105, 6
mov r106, 8
mul r104, r105, r106
add r35, r0, r104
str r1, [r35]
b placePiece_returnLabel

placePiece_lab13:
cmp r2, 8
cset r38, eq
cmp r38, 0
bne placePiece_lab14
b placePiece_lab15

placePiece_lab14:
mov r111, 7
mov r112, 8
mul r110, r111, r112
add r40, r0, r110
str r1, [r40]
b placePiece_returnLabel

placePiece_lab15:
cmp r2, 9
cset r43, eq
cmp r43, 0
bne placePiece_lab16
b placePiece_returnLabel

placePiece_lab16:
mov r117, 8
mov r118, 8
mul r116, r117, r118
add r45, r0, r116
str r1, [r45]
b placePiece_returnLabel

placePiece_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global checkWinner
checkWinner:
checkWinner_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r150, 0
mov r151, 8
mul r149, r150, r151
add r1, r0, r149
ldr r2, [r1]
cmp r2, 1
cset r3, eq
cmp r3, 0
mov r12, r0
bne checkWinner_lab0
b checkWinner_lab8

checkWinner_lab0:
mov r156, 1
mov r157, 8
mul r155, r156, r157
add r5, r0, r155
ldr r6, [r5]
cmp r6, 1
cset r7, eq
cmp r7, 0
mov r12, r0
bne checkWinner_lab1
b checkWinner_lab8

checkWinner_lab1:
mov r162, 2
mov r163, 8
mul r161, r162, r163
add r9, r0, r161
ldr r10, [r9]
cmp r10, 1
cset r11, eq
cmp r11, 0
mov r12, r0
mov r145, 0
bne checkWinner_returnLabel
b checkWinner_lab8

checkWinner_lab8:
mov r168, 0
mov r169, 8
mul r167, r168, r169
add r13, r12, r167
ldr r14, [r13]
cmp r14, 2
cset r15, eq
cmp r15, 0
mov r24, r12
bne checkWinner_lab9
b checkWinner_lab17

checkWinner_lab9:
mov r174, 1
mov r175, 8
mul r173, r174, r175
add r17, r12, r173
ldr r18, [r17]
cmp r18, 2
cset r19, eq
cmp r19, 0
mov r24, r12
bne checkWinner_lab10
b checkWinner_lab17

checkWinner_lab10:
mov r180, 2
mov r181, 8
mul r179, r180, r181
add r21, r12, r179
ldr r22, [r21]
cmp r22, 2
cset r23, eq
cmp r23, 0
mov r24, r12
mov r145, 1
bne checkWinner_returnLabel
b checkWinner_lab17

checkWinner_lab17:
mov r186, 3
mov r187, 8
mul r185, r186, r187
add r25, r24, r185
ldr r26, [r25]
cmp r26, 1
cset r27, eq
cmp r27, 0
mov r36, r24
bne checkWinner_lab18
b checkWinner_lab26

checkWinner_lab18:
mov r192, 4
mov r193, 8
mul r191, r192, r193
add r29, r24, r191
ldr r30, [r29]
cmp r30, 1
cset r31, eq
cmp r31, 0
mov r36, r24
bne checkWinner_lab19
b checkWinner_lab26

checkWinner_lab19:
mov r198, 5
mov r199, 8
mul r197, r198, r199
add r33, r24, r197
ldr r34, [r33]
cmp r34, 1
cset r35, eq
cmp r35, 0
mov r36, r24
mov r145, 0
bne checkWinner_returnLabel
b checkWinner_lab26

checkWinner_lab26:
mov r204, 3
mov r205, 8
mul r203, r204, r205
add r37, r36, r203
ldr r38, [r37]
cmp r38, 2
cset r39, eq
cmp r39, 0
mov r48, r36
bne checkWinner_lab27
b checkWinner_lab35

checkWinner_lab27:
mov r210, 4
mov r211, 8
mul r209, r210, r211
add r41, r36, r209
ldr r42, [r41]
cmp r42, 2
cset r43, eq
cmp r43, 0
mov r48, r36
bne checkWinner_lab28
b checkWinner_lab35

checkWinner_lab28:
mov r216, 5
mov r217, 8
mul r215, r216, r217
add r45, r36, r215
ldr r46, [r45]
cmp r46, 2
cset r47, eq
cmp r47, 0
mov r48, r36
mov r145, 1
bne checkWinner_returnLabel
b checkWinner_lab35

checkWinner_lab35:
mov r222, 6
mov r223, 8
mul r221, r222, r223
add r49, r48, r221
ldr r50, [r49]
cmp r50, 1
cset r51, eq
cmp r51, 0
mov r60, r48
bne checkWinner_lab36
b checkWinner_lab44

checkWinner_lab36:
mov r228, 7
mov r229, 8
mul r227, r228, r229
add r53, r48, r227
ldr r54, [r53]
cmp r54, 1
cset r55, eq
cmp r55, 0
mov r60, r48
bne checkWinner_lab37
b checkWinner_lab44

checkWinner_lab37:
mov r234, 8
mov r235, 8
mul r233, r234, r235
add r57, r48, r233
ldr r58, [r57]
cmp r58, 1
cset r59, eq
cmp r59, 0
mov r60, r48
mov r145, 0
bne checkWinner_returnLabel
b checkWinner_lab44

checkWinner_lab44:
mov r240, 6
mov r241, 8
mul r239, r240, r241
add r61, r60, r239
ldr r62, [r61]
cmp r62, 2
cset r63, eq
cmp r63, 0
mov r72, r60
bne checkWinner_lab45
b checkWinner_lab53

checkWinner_lab45:
mov r246, 7
mov r247, 8
mul r245, r246, r247
add r65, r60, r245
ldr r66, [r65]
cmp r66, 2
cset r67, eq
cmp r67, 0
mov r72, r60
bne checkWinner_lab46
b checkWinner_lab53

checkWinner_lab46:
mov r252, 8
mov r253, 8
mul r251, r252, r253
add r69, r60, r251
ldr r70, [r69]
cmp r70, 2
cset r71, eq
cmp r71, 0
mov r72, r60
mov r145, 1
bne checkWinner_returnLabel
b checkWinner_lab53

checkWinner_lab53:
mov r258, 0
mov r259, 8
mul r257, r258, r259
add r73, r72, r257
ldr r74, [r73]
cmp r74, 1
cset r75, eq
cmp r75, 0
mov r84, r72
bne checkWinner_lab54
b checkWinner_lab62

checkWinner_lab54:
mov r264, 3
mov r265, 8
mul r263, r264, r265
add r77, r72, r263
ldr r78, [r77]
cmp r78, 1
cset r79, eq
cmp r79, 0
mov r84, r72
bne checkWinner_lab55
b checkWinner_lab62

checkWinner_lab55:
mov r270, 6
mov r271, 8
mul r269, r270, r271
add r81, r72, r269
ldr r82, [r81]
cmp r82, 1
cset r83, eq
cmp r83, 0
mov r84, r72
mov r145, 0
bne checkWinner_returnLabel
b checkWinner_lab62

checkWinner_lab62:
mov r276, 0
mov r277, 8
mul r275, r276, r277
add r85, r84, r275
ldr r86, [r85]
cmp r86, 2
cset r87, eq
cmp r87, 0
mov r96, r84
bne checkWinner_lab63
b checkWinner_lab71

checkWinner_lab63:
mov r282, 3
mov r283, 8
mul r281, r282, r283
add r89, r84, r281
ldr r90, [r89]
cmp r90, 2
cset r91, eq
cmp r91, 0
mov r96, r84
bne checkWinner_lab64
b checkWinner_lab71

checkWinner_lab64:
mov r288, 6
mov r289, 8
mul r287, r288, r289
add r93, r84, r287
ldr r94, [r93]
cmp r94, 2
cset r95, eq
cmp r95, 0
mov r96, r84
mov r145, 1
bne checkWinner_returnLabel
b checkWinner_lab71

checkWinner_lab71:
mov r294, 1
mov r295, 8
mul r293, r294, r295
add r97, r96, r293
ldr r98, [r97]
cmp r98, 1
cset r99, eq
cmp r99, 0
mov r108, r96
bne checkWinner_lab72
b checkWinner_lab80

checkWinner_lab72:
mov r300, 4
mov r301, 8
mul r299, r300, r301
add r101, r96, r299
ldr r102, [r101]
cmp r102, 1
cset r103, eq
cmp r103, 0
mov r108, r96
bne checkWinner_lab73
b checkWinner_lab80

checkWinner_lab73:
mov r306, 7
mov r307, 8
mul r305, r306, r307
add r105, r96, r305
ldr r106, [r105]
cmp r106, 1
cset r107, eq
cmp r107, 0
mov r108, r96
mov r145, 0
bne checkWinner_returnLabel
b checkWinner_lab80

checkWinner_lab80:
mov r312, 1
mov r313, 8
mul r311, r312, r313
add r109, r108, r311
ldr r110, [r109]
cmp r110, 2
cset r111, eq
cmp r111, 0
mov r120, r108
bne checkWinner_lab81
b checkWinner_lab89

checkWinner_lab81:
mov r318, 4
mov r319, 8
mul r317, r318, r319
add r113, r108, r317
ldr r114, [r113]
cmp r114, 2
cset r115, eq
cmp r115, 0
mov r120, r108
bne checkWinner_lab82
b checkWinner_lab89

checkWinner_lab82:
mov r324, 7
mov r325, 8
mul r323, r324, r325
add r117, r108, r323
ldr r118, [r117]
cmp r118, 2
cset r119, eq
cmp r119, 0
mov r120, r108
mov r145, 1
bne checkWinner_returnLabel
b checkWinner_lab89

checkWinner_lab89:
mov r330, 2
mov r331, 8
mul r329, r330, r331
add r121, r120, r329
ldr r122, [r121]
cmp r122, 1
cset r123, eq
cmp r123, 0
mov r132, r120
bne checkWinner_lab90
b checkWinner_lab98

checkWinner_lab90:
mov r336, 5
mov r337, 8
mul r335, r336, r337
add r125, r120, r335
ldr r126, [r125]
cmp r126, 1
cset r127, eq
cmp r127, 0
mov r132, r120
bne checkWinner_lab91
b checkWinner_lab98

checkWinner_lab91:
mov r342, 8
mov r343, 8
mul r341, r342, r343
add r129, r120, r341
ldr r130, [r129]
cmp r130, 1
cset r131, eq
cmp r131, 0
mov r132, r120
mov r145, 0
bne checkWinner_returnLabel
b checkWinner_lab98

checkWinner_lab98:
mov r348, 2
mov r349, 8
mul r347, r348, r349
add r133, r132, r347
ldr r134, [r133]
cmp r134, 2
cset r135, eq
cmp r135, 0
mov r145, -1
bne checkWinner_lab99
b checkWinner_returnLabel

checkWinner_lab99:
mov r354, 5
mov r355, 8
mul r353, r354, r355
add r137, r132, r353
ldr r138, [r137]
cmp r138, 2
cset r139, eq
cmp r139, 0
mov r145, -1
bne checkWinner_lab100
b checkWinner_returnLabel

checkWinner_lab100:
mov r360, 8
mov r361, 8
mul r359, r360, r361
add r141, r132, r359
ldr r142, [r141]
cmp r142, 2
cset r143, eq
cmp r143, 0
mov r145, 1
bne checkWinner_returnLabel
b checkWinner_lab102

checkWinner_lab102:
mov r145, -1
b checkWinner_returnLabel

checkWinner_returnLabel:
mov x0, r145
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

mov x0, 72
bl malloc
mov r1, x0
mov r2, r1
mov x0, r2
bl cleanBoard
mov r43, 1
cmp r43, 0
mov r7, 0
mov r9, 0
mov r11, r2
mov r33, -1
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov r7, r29
mov r9, r24
mov r11, r25
b main_lab0

main_lab0:
mov x0, r11
bl printBoard
cmp r9, 0
cset r12, eq
cmp r12, 0
bne main_lab1
b main_lab2

main_lab1:
mov r45, 1
add r14, r9, r45
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r15, x0
ldr r16, =read_scratch
ldr r16, [r16]
mov x0, r11
mov x1, 1
mov x2, r16
bl placePiece
mov r24, r14
mov r25, r11
mov r28, r7
b main_lab3

main_lab2:
mov r47, 1
sub r19, r9, r47
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r20, x0
ldr r21, =read_scratch
ldr r21, [r21]
mov x0, r11
mov x1, 2
mov x2, r21
bl placePiece
mov r24, r19
mov r25, r11
mov r28, r7
b main_lab3

main_lab3:
mov x0, r25
bl checkWinner
mov r27, x0
mov r49, 1
add r29, r28, r49
cmp r27, 0
cset r30, lt
cmp r29, 8
cset r31, ne
and r32, r30, r31
cmp r32, 0
mov r33, r27
bne main_lab0
b main_returnLabel

main_returnLabel:
mov r51, 1
add r39, r33, r51
ldr x0, =println
mov x1, r39
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

