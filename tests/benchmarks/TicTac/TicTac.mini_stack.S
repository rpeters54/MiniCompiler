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
stp x29, x30, [sp, -104]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r74, x13, 96
str r0, [r74]
ldr r2, [r74]
mov r24, 0
mov r25, 8
mul r23, r24, r25
add r3, r2, r23
str 0, [r3]
ldr r4, [r74]
mov r30, 1
mov r31, 8
mul r29, r30, r31
add r5, r4, r29
str 0, [r5]
ldr r6, [r74]
mov r36, 2
mov r37, 8
mul r35, r36, r37
add r7, r6, r35
str 0, [r7]
ldr r8, [r74]
mov r42, 3
mov r43, 8
mul r41, r42, r43
add r9, r8, r41
str 0, [r9]
ldr r10, [r74]
mov r48, 4
mov r49, 8
mul r47, r48, r49
add r11, r10, r47
str 0, [r11]
ldr r12, [r74]
mov r54, 5
mov r55, 8
mul r53, r54, r55
add r13, r12, r53
str 0, [r13]
ldr r14, [r74]
mov r60, 6
mov r61, 8
mul r59, r60, r61
add r15, r14, r59
str 0, [r15]
ldr r16, [r74]
mov r66, 7
mov r67, 8
mul r65, r66, r67
add r17, r16, r65
str 0, [r17]
ldr r18, [r74]
mov r72, 8
mov r73, 8
mul r71, r72, r73
add r19, r18, r71
str 0, [r19]
b cleanBoard_returnLabel

cleanBoard_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 104
ret

.global printBoard
printBoard:
printBoard_prologue:
stp x29, x30, [sp, -104]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r92, x13, 96
str r0, [r92]
ldr r2, [r92]
mov r42, 0
mov r43, 8
mul r41, r42, r43
add r3, r2, r41
ldr r4, [r3]
ldr x0, =print
mov x1, r4
bl printf
mov r5, x0
ldr r6, [r92]
mov r48, 1
mov r49, 8
mul r47, r48, r49
add r7, r6, r47
ldr r8, [r7]
ldr x0, =print
mov x1, r8
bl printf
mov r9, x0
ldr r10, [r92]
mov r54, 2
mov r55, 8
mul r53, r54, r55
add r11, r10, r53
ldr r12, [r11]
ldr x0, =println
mov x1, r12
bl printf
mov r13, x0
ldr r14, [r92]
mov r60, 3
mov r61, 8
mul r59, r60, r61
add r15, r14, r59
ldr r16, [r15]
ldr x0, =print
mov x1, r16
bl printf
mov r17, x0
ldr r18, [r92]
mov r66, 4
mov r67, 8
mul r65, r66, r67
add r19, r18, r65
ldr r20, [r19]
ldr x0, =print
mov x1, r20
bl printf
mov r21, x0
ldr r22, [r92]
mov r72, 5
mov r73, 8
mul r71, r72, r73
add r23, r22, r71
ldr r24, [r23]
ldr x0, =println
mov x1, r24
bl printf
mov r25, x0
ldr r26, [r92]
mov r78, 6
mov r79, 8
mul r77, r78, r79
add r27, r26, r77
ldr r28, [r27]
ldr x0, =print
mov x1, r28
bl printf
mov r29, x0
ldr r30, [r92]
mov r84, 7
mov r85, 8
mul r83, r84, r85
add r31, r30, r83
ldr r32, [r31]
ldr x0, =print
mov x1, r32
bl printf
mov r33, x0
ldr r34, [r92]
mov r90, 8
mov r91, 8
mul r89, r90, r91
add r35, r34, r89
ldr r36, [r35]
ldr x0, =println
mov x1, r36
bl printf
mov r37, x0
b printBoard_returnLabel

printBoard_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 104
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
b printMoveBoard_returnLabel

printMoveBoard_returnLabel:
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
stp x29, x30, [sp, -120]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
mov r2, x2
add r105, x13, 96
add r106, x13, 104
add r107, x13, 112
str r0, [r105]
str r1, [r106]
str r2, [r107]
ldr r6, [r107]
cmp r6, 1
cset r7, eq
cmp r7, 0
bne placePiece_lab0
b placePiece_lab1

placePiece_lab0:
ldr r8, [r105]
mov r55, 0
mov r56, 8
mul r54, r55, r56
add r9, r8, r54
ldr r10, [r106]
str r10, [r9]
b placePiece_lab26

placePiece_lab1:
ldr r11, [r107]
cmp r11, 2
cset r12, eq
cmp r12, 0
bne placePiece_lab2
b placePiece_lab3

placePiece_lab2:
ldr r13, [r105]
mov r61, 1
mov r62, 8
mul r60, r61, r62
add r14, r13, r60
ldr r15, [r106]
str r15, [r14]
b placePiece_lab25

placePiece_lab3:
ldr r16, [r107]
cmp r16, 3
cset r17, eq
cmp r17, 0
bne placePiece_lab4
b placePiece_lab5

placePiece_lab4:
ldr r18, [r105]
mov r67, 2
mov r68, 8
mul r66, r67, r68
add r19, r18, r66
ldr r20, [r106]
str r20, [r19]
b placePiece_lab24

placePiece_lab5:
ldr r21, [r107]
cmp r21, 4
cset r22, eq
cmp r22, 0
bne placePiece_lab6
b placePiece_lab7

placePiece_lab6:
ldr r23, [r105]
mov r73, 3
mov r74, 8
mul r72, r73, r74
add r24, r23, r72
ldr r25, [r106]
str r25, [r24]
b placePiece_lab23

placePiece_lab7:
ldr r26, [r107]
cmp r26, 5
cset r27, eq
cmp r27, 0
bne placePiece_lab8
b placePiece_lab9

placePiece_lab8:
ldr r28, [r105]
mov r79, 4
mov r80, 8
mul r78, r79, r80
add r29, r28, r78
ldr r30, [r106]
str r30, [r29]
b placePiece_lab22

placePiece_lab9:
ldr r31, [r107]
cmp r31, 6
cset r32, eq
cmp r32, 0
bne placePiece_lab10
b placePiece_lab11

placePiece_lab10:
ldr r33, [r105]
mov r85, 5
mov r86, 8
mul r84, r85, r86
add r34, r33, r84
ldr r35, [r106]
str r35, [r34]
b placePiece_lab21

placePiece_lab11:
ldr r36, [r107]
cmp r36, 7
cset r37, eq
cmp r37, 0
bne placePiece_lab12
b placePiece_lab13

placePiece_lab12:
ldr r38, [r105]
mov r91, 6
mov r92, 8
mul r90, r91, r92
add r39, r38, r90
ldr r40, [r106]
str r40, [r39]
b placePiece_lab20

placePiece_lab13:
ldr r41, [r107]
cmp r41, 8
cset r42, eq
cmp r42, 0
bne placePiece_lab14
b placePiece_lab15

placePiece_lab14:
ldr r43, [r105]
mov r97, 7
mov r98, 8
mul r96, r97, r98
add r44, r43, r96
ldr r45, [r106]
str r45, [r44]
b placePiece_lab19

placePiece_lab15:
ldr r46, [r107]
cmp r46, 9
cset r47, eq
cmp r47, 0
bne placePiece_lab16
b placePiece_lab17

placePiece_lab16:
ldr r48, [r105]
mov r103, 8
mov r104, 8
mul r102, r103, r104
add r49, r48, r102
ldr r50, [r106]
str r50, [r49]
b placePiece_lab18

placePiece_lab17:
b placePiece_lab18

placePiece_lab18:
b placePiece_lab19

placePiece_lab19:
b placePiece_lab20

placePiece_lab20:
b placePiece_lab21

placePiece_lab21:
b placePiece_lab22

placePiece_lab22:
b placePiece_lab23

placePiece_lab23:
b placePiece_lab24

placePiece_lab24:
b placePiece_lab25

placePiece_lab25:
b placePiece_lab26

placePiece_lab26:
b placePiece_returnLabel

placePiece_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 120
ret

.global checkWinner
checkWinner:
checkWinner_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r369, x13, 96
add r370, x13, 104
str r0, [r370]
ldr r3, [r370]
mov r153, 0
mov r154, 8
mul r152, r153, r154
add r4, r3, r152
ldr r5, [r4]
cmp r5, 1
cset r6, eq
cmp r6, 0
bne checkWinner_lab0
b checkWinner_lab7

checkWinner_lab0:
ldr r7, [r370]
mov r159, 1
mov r160, 8
mul r158, r159, r160
add r8, r7, r158
ldr r9, [r8]
cmp r9, 1
cset r10, eq
cmp r10, 0
bne checkWinner_lab1
b checkWinner_lab5

checkWinner_lab1:
ldr r11, [r370]
mov r165, 2
mov r166, 8
mul r164, r165, r166
add r12, r11, r164
ldr r13, [r12]
cmp r13, 1
cset r14, eq
cmp r14, 0
bne checkWinner_lab2
b checkWinner_lab3

checkWinner_lab2:
str 0, [r369]
b checkWinner_returnLabel

checkWinner_lab3:
b checkWinner_lab4

checkWinner_lab4:
b checkWinner_lab6

checkWinner_lab5:
b checkWinner_lab6

checkWinner_lab6:
b checkWinner_lab8

checkWinner_lab7:
b checkWinner_lab8

checkWinner_lab8:
ldr r15, [r370]
mov r171, 0
mov r172, 8
mul r170, r171, r172
add r16, r15, r170
ldr r17, [r16]
cmp r17, 2
cset r18, eq
cmp r18, 0
bne checkWinner_lab9
b checkWinner_lab16

checkWinner_lab9:
ldr r19, [r370]
mov r177, 1
mov r178, 8
mul r176, r177, r178
add r20, r19, r176
ldr r21, [r20]
cmp r21, 2
cset r22, eq
cmp r22, 0
bne checkWinner_lab10
b checkWinner_lab14

checkWinner_lab10:
ldr r23, [r370]
mov r183, 2
mov r184, 8
mul r182, r183, r184
add r24, r23, r182
ldr r25, [r24]
cmp r25, 2
cset r26, eq
cmp r26, 0
bne checkWinner_lab11
b checkWinner_lab12

checkWinner_lab11:
str 1, [r369]
b checkWinner_returnLabel

checkWinner_lab12:
b checkWinner_lab13

checkWinner_lab13:
b checkWinner_lab15

checkWinner_lab14:
b checkWinner_lab15

checkWinner_lab15:
b checkWinner_lab17

checkWinner_lab16:
b checkWinner_lab17

checkWinner_lab17:
ldr r27, [r370]
mov r189, 3
mov r190, 8
mul r188, r189, r190
add r28, r27, r188
ldr r29, [r28]
cmp r29, 1
cset r30, eq
cmp r30, 0
bne checkWinner_lab18
b checkWinner_lab25

checkWinner_lab18:
ldr r31, [r370]
mov r195, 4
mov r196, 8
mul r194, r195, r196
add r32, r31, r194
ldr r33, [r32]
cmp r33, 1
cset r34, eq
cmp r34, 0
bne checkWinner_lab19
b checkWinner_lab23

checkWinner_lab19:
ldr r35, [r370]
mov r201, 5
mov r202, 8
mul r200, r201, r202
add r36, r35, r200
ldr r37, [r36]
cmp r37, 1
cset r38, eq
cmp r38, 0
bne checkWinner_lab20
b checkWinner_lab21

checkWinner_lab20:
str 0, [r369]
b checkWinner_returnLabel

checkWinner_lab21:
b checkWinner_lab22

checkWinner_lab22:
b checkWinner_lab24

checkWinner_lab23:
b checkWinner_lab24

checkWinner_lab24:
b checkWinner_lab26

checkWinner_lab25:
b checkWinner_lab26

checkWinner_lab26:
ldr r39, [r370]
mov r207, 3
mov r208, 8
mul r206, r207, r208
add r40, r39, r206
ldr r41, [r40]
cmp r41, 2
cset r42, eq
cmp r42, 0
bne checkWinner_lab27
b checkWinner_lab34

checkWinner_lab27:
ldr r43, [r370]
mov r213, 4
mov r214, 8
mul r212, r213, r214
add r44, r43, r212
ldr r45, [r44]
cmp r45, 2
cset r46, eq
cmp r46, 0
bne checkWinner_lab28
b checkWinner_lab32

checkWinner_lab28:
ldr r47, [r370]
mov r219, 5
mov r220, 8
mul r218, r219, r220
add r48, r47, r218
ldr r49, [r48]
cmp r49, 2
cset r50, eq
cmp r50, 0
bne checkWinner_lab29
b checkWinner_lab30

checkWinner_lab29:
str 1, [r369]
b checkWinner_returnLabel

checkWinner_lab30:
b checkWinner_lab31

checkWinner_lab31:
b checkWinner_lab33

checkWinner_lab32:
b checkWinner_lab33

checkWinner_lab33:
b checkWinner_lab35

checkWinner_lab34:
b checkWinner_lab35

checkWinner_lab35:
ldr r51, [r370]
mov r225, 6
mov r226, 8
mul r224, r225, r226
add r52, r51, r224
ldr r53, [r52]
cmp r53, 1
cset r54, eq
cmp r54, 0
bne checkWinner_lab36
b checkWinner_lab43

checkWinner_lab36:
ldr r55, [r370]
mov r231, 7
mov r232, 8
mul r230, r231, r232
add r56, r55, r230
ldr r57, [r56]
cmp r57, 1
cset r58, eq
cmp r58, 0
bne checkWinner_lab37
b checkWinner_lab41

checkWinner_lab37:
ldr r59, [r370]
mov r237, 8
mov r238, 8
mul r236, r237, r238
add r60, r59, r236
ldr r61, [r60]
cmp r61, 1
cset r62, eq
cmp r62, 0
bne checkWinner_lab38
b checkWinner_lab39

checkWinner_lab38:
str 0, [r369]
b checkWinner_returnLabel

checkWinner_lab39:
b checkWinner_lab40

checkWinner_lab40:
b checkWinner_lab42

checkWinner_lab41:
b checkWinner_lab42

checkWinner_lab42:
b checkWinner_lab44

checkWinner_lab43:
b checkWinner_lab44

checkWinner_lab44:
ldr r63, [r370]
mov r243, 6
mov r244, 8
mul r242, r243, r244
add r64, r63, r242
ldr r65, [r64]
cmp r65, 2
cset r66, eq
cmp r66, 0
bne checkWinner_lab45
b checkWinner_lab52

checkWinner_lab45:
ldr r67, [r370]
mov r249, 7
mov r250, 8
mul r248, r249, r250
add r68, r67, r248
ldr r69, [r68]
cmp r69, 2
cset r70, eq
cmp r70, 0
bne checkWinner_lab46
b checkWinner_lab50

checkWinner_lab46:
ldr r71, [r370]
mov r255, 8
mov r256, 8
mul r254, r255, r256
add r72, r71, r254
ldr r73, [r72]
cmp r73, 2
cset r74, eq
cmp r74, 0
bne checkWinner_lab47
b checkWinner_lab48

checkWinner_lab47:
str 1, [r369]
b checkWinner_returnLabel

checkWinner_lab48:
b checkWinner_lab49

checkWinner_lab49:
b checkWinner_lab51

checkWinner_lab50:
b checkWinner_lab51

checkWinner_lab51:
b checkWinner_lab53

checkWinner_lab52:
b checkWinner_lab53

checkWinner_lab53:
ldr r75, [r370]
mov r261, 0
mov r262, 8
mul r260, r261, r262
add r76, r75, r260
ldr r77, [r76]
cmp r77, 1
cset r78, eq
cmp r78, 0
bne checkWinner_lab54
b checkWinner_lab61

checkWinner_lab54:
ldr r79, [r370]
mov r267, 3
mov r268, 8
mul r266, r267, r268
add r80, r79, r266
ldr r81, [r80]
cmp r81, 1
cset r82, eq
cmp r82, 0
bne checkWinner_lab55
b checkWinner_lab59

checkWinner_lab55:
ldr r83, [r370]
mov r273, 6
mov r274, 8
mul r272, r273, r274
add r84, r83, r272
ldr r85, [r84]
cmp r85, 1
cset r86, eq
cmp r86, 0
bne checkWinner_lab56
b checkWinner_lab57

checkWinner_lab56:
str 0, [r369]
b checkWinner_returnLabel

checkWinner_lab57:
b checkWinner_lab58

checkWinner_lab58:
b checkWinner_lab60

checkWinner_lab59:
b checkWinner_lab60

checkWinner_lab60:
b checkWinner_lab62

checkWinner_lab61:
b checkWinner_lab62

checkWinner_lab62:
ldr r87, [r370]
mov r279, 0
mov r280, 8
mul r278, r279, r280
add r88, r87, r278
ldr r89, [r88]
cmp r89, 2
cset r90, eq
cmp r90, 0
bne checkWinner_lab63
b checkWinner_lab70

checkWinner_lab63:
ldr r91, [r370]
mov r285, 3
mov r286, 8
mul r284, r285, r286
add r92, r91, r284
ldr r93, [r92]
cmp r93, 2
cset r94, eq
cmp r94, 0
bne checkWinner_lab64
b checkWinner_lab68

checkWinner_lab64:
ldr r95, [r370]
mov r291, 6
mov r292, 8
mul r290, r291, r292
add r96, r95, r290
ldr r97, [r96]
cmp r97, 2
cset r98, eq
cmp r98, 0
bne checkWinner_lab65
b checkWinner_lab66

checkWinner_lab65:
str 1, [r369]
b checkWinner_returnLabel

checkWinner_lab66:
b checkWinner_lab67

checkWinner_lab67:
b checkWinner_lab69

checkWinner_lab68:
b checkWinner_lab69

checkWinner_lab69:
b checkWinner_lab71

checkWinner_lab70:
b checkWinner_lab71

checkWinner_lab71:
ldr r99, [r370]
mov r297, 1
mov r298, 8
mul r296, r297, r298
add r100, r99, r296
ldr r101, [r100]
cmp r101, 1
cset r102, eq
cmp r102, 0
bne checkWinner_lab72
b checkWinner_lab79

checkWinner_lab72:
ldr r103, [r370]
mov r303, 4
mov r304, 8
mul r302, r303, r304
add r104, r103, r302
ldr r105, [r104]
cmp r105, 1
cset r106, eq
cmp r106, 0
bne checkWinner_lab73
b checkWinner_lab77

checkWinner_lab73:
ldr r107, [r370]
mov r309, 7
mov r310, 8
mul r308, r309, r310
add r108, r107, r308
ldr r109, [r108]
cmp r109, 1
cset r110, eq
cmp r110, 0
bne checkWinner_lab74
b checkWinner_lab75

checkWinner_lab74:
str 0, [r369]
b checkWinner_returnLabel

checkWinner_lab75:
b checkWinner_lab76

checkWinner_lab76:
b checkWinner_lab78

checkWinner_lab77:
b checkWinner_lab78

checkWinner_lab78:
b checkWinner_lab80

checkWinner_lab79:
b checkWinner_lab80

checkWinner_lab80:
ldr r111, [r370]
mov r315, 1
mov r316, 8
mul r314, r315, r316
add r112, r111, r314
ldr r113, [r112]
cmp r113, 2
cset r114, eq
cmp r114, 0
bne checkWinner_lab81
b checkWinner_lab88

checkWinner_lab81:
ldr r115, [r370]
mov r321, 4
mov r322, 8
mul r320, r321, r322
add r116, r115, r320
ldr r117, [r116]
cmp r117, 2
cset r118, eq
cmp r118, 0
bne checkWinner_lab82
b checkWinner_lab86

checkWinner_lab82:
ldr r119, [r370]
mov r327, 7
mov r328, 8
mul r326, r327, r328
add r120, r119, r326
ldr r121, [r120]
cmp r121, 2
cset r122, eq
cmp r122, 0
bne checkWinner_lab83
b checkWinner_lab84

checkWinner_lab83:
str 1, [r369]
b checkWinner_returnLabel

checkWinner_lab84:
b checkWinner_lab85

checkWinner_lab85:
b checkWinner_lab87

checkWinner_lab86:
b checkWinner_lab87

checkWinner_lab87:
b checkWinner_lab89

checkWinner_lab88:
b checkWinner_lab89

checkWinner_lab89:
ldr r123, [r370]
mov r333, 2
mov r334, 8
mul r332, r333, r334
add r124, r123, r332
ldr r125, [r124]
cmp r125, 1
cset r126, eq
cmp r126, 0
bne checkWinner_lab90
b checkWinner_lab97

checkWinner_lab90:
ldr r127, [r370]
mov r339, 5
mov r340, 8
mul r338, r339, r340
add r128, r127, r338
ldr r129, [r128]
cmp r129, 1
cset r130, eq
cmp r130, 0
bne checkWinner_lab91
b checkWinner_lab95

checkWinner_lab91:
ldr r131, [r370]
mov r345, 8
mov r346, 8
mul r344, r345, r346
add r132, r131, r344
ldr r133, [r132]
cmp r133, 1
cset r134, eq
cmp r134, 0
bne checkWinner_lab92
b checkWinner_lab93

checkWinner_lab92:
str 0, [r369]
b checkWinner_returnLabel

checkWinner_lab93:
b checkWinner_lab94

checkWinner_lab94:
b checkWinner_lab96

checkWinner_lab95:
b checkWinner_lab96

checkWinner_lab96:
b checkWinner_lab98

checkWinner_lab97:
b checkWinner_lab98

checkWinner_lab98:
ldr r135, [r370]
mov r351, 2
mov r352, 8
mul r350, r351, r352
add r136, r135, r350
ldr r137, [r136]
cmp r137, 2
cset r138, eq
cmp r138, 0
bne checkWinner_lab99
b checkWinner_lab106

checkWinner_lab99:
ldr r139, [r370]
mov r357, 5
mov r358, 8
mul r356, r357, r358
add r140, r139, r356
ldr r141, [r140]
cmp r141, 2
cset r142, eq
cmp r142, 0
bne checkWinner_lab100
b checkWinner_lab104

checkWinner_lab100:
ldr r143, [r370]
mov r363, 8
mov r364, 8
mul r362, r363, r364
add r144, r143, r362
ldr r145, [r144]
cmp r145, 2
cset r146, eq
cmp r146, 0
bne checkWinner_lab101
b checkWinner_lab102

checkWinner_lab101:
str 1, [r369]
b checkWinner_returnLabel

checkWinner_lab102:
b checkWinner_lab103

checkWinner_lab103:
b checkWinner_lab105

checkWinner_lab104:
b checkWinner_lab105

checkWinner_lab105:
b checkWinner_lab107

checkWinner_lab106:
b checkWinner_lab107

checkWinner_lab107:
mov r367, 0
mov r368, 1
sub r147, r367, r368
str r147, [r369]
b checkWinner_returnLabel

checkWinner_returnLabel:
ldr r148, [r369]
mov x0, r148
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global main
main:
main_prologue:
stp x29, x30, [sp, -152]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add r56, x13, 96
add r57, x13, 104
add r58, x13, 112
add r59, x13, 120
add r60, x13, 128
add r61, x13, 136
add r62, x13, 144
str 0, [r61]
str 0, [r57]
str 0, [r58]
str 0, [r59]
mov r46, 0
mov r47, 1
sub r7, r46, r47
str r7, [r60]
mov x0, 72
bl malloc
mov r8, x0
mov r9, r8
str r9, [r62]
ldr r10, [r62]
mov x0, r10
bl cleanBoard
ldr r11, [r60]
cmp r11, 0
cset r12, lt
ldr r13, [r61]
cmp r13, 8
cset r14, ne
and r15, r12, r14
cmp r15, 0
bne main_lab0
b main_lab4

main_lab0:
ldr r16, [r62]
mov x0, r16
bl printBoard
ldr r17, [r57]
cmp r17, 0
cset r18, eq
cmp r18, 0
bne main_lab1
b main_lab2

main_lab1:
ldr r19, [r57]
mov r49, 1
add r20, r19, r49
str r20, [r57]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r21, x0
ldr r22, =read_scratch
ldr r22, [r22]
str r22, [r58]
ldr r23, [r62]
ldr r24, [r58]
mov x0, r23
mov x1, 1
mov x2, r24
bl placePiece
b main_lab3

main_lab2:
ldr r25, [r57]
mov r51, 1
sub r26, r25, r51
str r26, [r57]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r27, x0
ldr r28, =read_scratch
ldr r28, [r28]
str r28, [r59]
ldr r29, [r62]
ldr r30, [r59]
mov x0, r29
mov x1, 2
mov x2, r30
bl placePiece
b main_lab3

main_lab3:
ldr r31, [r62]
mov x0, r31
bl checkWinner
mov r32, x0
str r32, [r60]
ldr r33, [r61]
mov r53, 1
add r34, r33, r53
str r34, [r61]
ldr r35, [r60]
cmp r35, 0
cset r36, lt
ldr r37, [r61]
cmp r37, 8
cset r38, ne
and r39, r36, r38
cmp r39, 0
bne main_lab0
b main_lab4

main_lab4:
ldr r40, [r60]
mov r55, 1
add r41, r40, r55
ldr x0, =println
mov x1, r41
bl printf
mov r42, x0
str 0, [r56]
b main_returnLabel

main_returnLabel:
ldr r43, [r56]
mov x0, r43
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 152
ret

