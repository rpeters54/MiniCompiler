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
.global gi1
gi1:
    .xword 0x0
.global gb1
gb1:
    .xword 0x0
.global gs1
gs1:
    .xword 0x0
.global counter
counter:
    .xword 0x0

.text
.global printgroup
printgroup:
printgroup_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
ldr x0, =print
mov x1, 1
bl printf
mov r1, x0
ldr x0, =print
mov x1, 0
bl printf
mov r2, x0
ldr x0, =print
mov x1, 1
bl printf
mov r3, x0
ldr x0, =print
mov x1, 0
bl printf
mov r4, x0
ldr x0, =print
mov x1, 1
bl printf
mov r5, x0
ldr x0, =print
mov x1, 0
bl printf
mov r6, x0
ldr x0, =println
mov x1, r0
bl printf
mov r7, x0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global setcounter
setcounter:
setcounter_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
ldr r3, =counter
str r0, [r3]
mov x0, 1
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global takealltypes
takealltypes:
takealltypes_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
mov r2, x2
cmp r0, 3
cset r3, eq
cmp r3, 0
bne takealltypes_lab0
b takealltypes_lab1

takealltypes_lab0:
ldr x0, =println
mov x1, 1
bl printf
mov r4, x0
mov r6, r1
b takealltypes_lab2

takealltypes_lab1:
ldr x0, =println
mov x1, 0
bl printf
mov r5, x0
mov r6, r1
b takealltypes_lab2

takealltypes_lab2:
cmp r6, 0
bne takealltypes_lab3
b takealltypes_lab4

takealltypes_lab3:
ldr x0, =println
mov x1, 1
bl printf
mov r7, x0
mov r9, r2
b takealltypes_lab5

takealltypes_lab4:
ldr x0, =println
mov x1, 0
bl printf
mov r8, x0
mov r9, r2
b takealltypes_lab5

takealltypes_lab5:
mov r18, 1
mov r19, 8
mul r17, r18, r19
add r10, r9, r17
ldr r11, [r10]
cmp r11, 0
bne takealltypes_lab6
b takealltypes_lab7

takealltypes_lab6:
ldr x0, =println
mov x1, 1
bl printf
mov r12, x0
b takealltypes_returnLabel

takealltypes_lab7:
ldr x0, =println
mov x1, 0
bl printf
mov r13, x0
b takealltypes_returnLabel

takealltypes_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global tonofargs
tonofargs:
tonofargs_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r4, x4
mov r5, x5
mov r6, x6
mov r7, x7
cmp r4, 5
cset r8, eq
cmp r8, 0
bne tonofargs_lab0
b tonofargs_lab1

tonofargs_lab0:
ldr x0, =println
mov x1, 1
bl printf
mov r9, x0
mov r14, r5
b tonofargs_lab2

tonofargs_lab1:
ldr x0, =print
mov x1, 0
bl printf
mov r10, x0
ldr x0, =println
mov x1, r4
bl printf
mov r12, x0
mov r14, r5
b tonofargs_lab2

tonofargs_lab2:
cmp r14, 6
cset r15, eq
cmp r15, 0
bne tonofargs_lab3
b tonofargs_lab4

tonofargs_lab3:
ldr x0, =println
mov x1, 1
bl printf
mov r16, x0
mov r21, r6
b tonofargs_lab5

tonofargs_lab4:
ldr x0, =print
mov x1, 0
bl printf
mov r17, x0
ldr x0, =println
mov x1, r14
bl printf
mov r19, x0
mov r21, r6
b tonofargs_lab5

tonofargs_lab5:
cmp r21, 7
cset r22, eq
cmp r22, 0
bne tonofargs_lab6
b tonofargs_lab7

tonofargs_lab6:
ldr x0, =println
mov x1, 1
bl printf
mov r23, x0
mov r28, r7
b tonofargs_lab8

tonofargs_lab7:
ldr x0, =print
mov x1, 0
bl printf
mov r24, x0
ldr x0, =println
mov x1, r21
bl printf
mov r26, x0
mov r28, r7
b tonofargs_lab8

tonofargs_lab8:
cmp r28, 8
cset r29, eq
cmp r29, 0
bne tonofargs_lab9
b tonofargs_lab10

tonofargs_lab9:
ldr x0, =println
mov x1, 1
bl printf
mov r30, x0
b tonofargs_returnLabel

tonofargs_lab10:
ldr x0, =print
mov x1, 0
bl printf
mov r31, x0
ldr x0, =println
mov x1, r28
bl printf
mov r33, x0
b tonofargs_returnLabel

tonofargs_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global returnint
returnint:
returnint_returnLabel:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov x0, r0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global returnbool
returnbool:
returnbool_returnLabel:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov x0, r0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global returnstruct
returnstruct:
returnstruct_returnLabel:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov x0, r0
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

ldr r276, =counter
str 0, [r276]
mov x0, 1
bl printgroup
mov r278, 0
cmp r278, 0
bne main_lab0
b main_lab1

main_lab0:
ldr x0, =println
mov x1, 0
bl printf
mov r1, x0
mov r280, 0
cmp r280, 0
bne main_lab3
b main_lab4

main_lab1:
ldr x0, =println
mov x1, 1
bl printf
mov r2, x0
mov r282, 0
cmp r282, 0
bne main_lab3
b main_lab4

main_lab3:
ldr x0, =println
mov x1, 0
bl printf
mov r4, x0
mov r284, 0
cmp r284, 0
bne main_lab6
b main_lab7

main_lab4:
ldr x0, =println
mov x1, 1
bl printf
mov r5, x0
mov r286, 0
cmp r286, 0
bne main_lab6
b main_lab7

main_lab6:
ldr x0, =println
mov x1, 0
bl printf
mov r7, x0
mov r288, 1
cmp r288, 0
bne main_lab9
b main_lab10

main_lab7:
ldr x0, =println
mov x1, 1
bl printf
mov r8, x0
mov r290, 1
cmp r290, 0
bne main_lab9
b main_lab10

main_lab9:
ldr x0, =println
mov x1, 1
bl printf
mov r10, x0
b main_lab11

main_lab10:
ldr x0, =println
mov x1, 0
bl printf
mov r11, x0
b main_lab11

main_lab11:
ldr r292, =counter
str 0, [r292]
mov x0, 2
bl printgroup
mov r294, 1
cmp r294, 0
bne main_lab12
b main_lab13

main_lab12:
ldr x0, =println
mov x1, 1
bl printf
mov r13, x0
mov r296, 1
cmp r296, 0
bne main_lab15
b main_lab16

main_lab13:
ldr x0, =println
mov x1, 0
bl printf
mov r14, x0
mov r298, 1
cmp r298, 0
bne main_lab15
b main_lab16

main_lab15:
ldr x0, =println
mov x1, 1
bl printf
mov r16, x0
mov r300, 1
cmp r300, 0
bne main_lab18
b main_lab19

main_lab16:
ldr x0, =println
mov x1, 0
bl printf
mov r17, x0
mov r302, 1
cmp r302, 0
bne main_lab18
b main_lab19

main_lab18:
ldr x0, =println
mov x1, 1
bl printf
mov r19, x0
mov r304, 0
cmp r304, 0
bne main_lab21
b main_lab22

main_lab19:
ldr x0, =println
mov x1, 0
bl printf
mov r20, x0
mov r306, 0
cmp r306, 0
bne main_lab21
b main_lab22

main_lab21:
ldr x0, =println
mov x1, 0
bl printf
mov r22, x0
b main_lab23

main_lab22:
ldr x0, =println
mov x1, 1
bl printf
mov r23, x0
b main_lab23

main_lab23:
mov x0, 3
bl printgroup
mov r308, 1
cmp r308, 0
bne main_lab24
b main_lab25

main_lab24:
ldr x0, =println
mov x1, 1
bl printf
mov r25, x0
mov r310, 1
cmp r310, 0
bne main_lab27
b main_lab28

main_lab25:
ldr x0, =println
mov x1, 0
bl printf
mov r26, x0
mov r312, 1
cmp r312, 0
bne main_lab27
b main_lab28

main_lab27:
ldr x0, =println
mov x1, 1
bl printf
mov r28, x0
mov r314, 0
cmp r314, 0
bne main_lab30
b main_lab31

main_lab28:
ldr x0, =println
mov x1, 0
bl printf
mov r29, x0
mov r316, 0
cmp r316, 0
bne main_lab30
b main_lab31

main_lab30:
ldr x0, =println
mov x1, 0
bl printf
mov r31, x0
mov r318, 0
cmp r318, 0
bne main_lab33
b main_lab34

main_lab31:
ldr x0, =println
mov x1, 1
bl printf
mov r32, x0
mov r320, 0
cmp r320, 0
bne main_lab33
b main_lab34

main_lab33:
ldr x0, =println
mov x1, 0
bl printf
mov r34, x0
mov r322, 0
cmp r322, 0
bne main_lab36
b main_lab37

main_lab34:
ldr x0, =println
mov x1, 1
bl printf
mov r35, x0
mov r324, 0
cmp r324, 0
bne main_lab36
b main_lab37

main_lab36:
ldr x0, =println
mov x1, 0
bl printf
mov r37, x0
mov r326, 1
cmp r326, 0
bne main_lab39
b main_lab40

main_lab37:
ldr x0, =println
mov x1, 1
bl printf
mov r38, x0
mov r328, 1
cmp r328, 0
bne main_lab39
b main_lab40

main_lab39:
ldr x0, =println
mov x1, 1
bl printf
mov r40, x0
mov r330, 1
cmp r330, 0
bne main_lab42
b main_lab43

main_lab40:
ldr x0, =println
mov x1, 0
bl printf
mov r41, x0
mov r332, 1
cmp r332, 0
bne main_lab42
b main_lab43

main_lab42:
ldr x0, =println
mov x1, 1
bl printf
mov r42, x0
mov r334, 0
cmp r334, 0
bne main_lab45
b main_lab46

main_lab43:
ldr x0, =println
mov x1, 0
bl printf
mov r43, x0
mov r336, 0
cmp r336, 0
bne main_lab45
b main_lab46

main_lab45:
ldr x0, =println
mov x1, 0
bl printf
mov r45, x0
mov r338, 0
cmp r338, 0
bne main_lab48
b main_lab49

main_lab46:
ldr x0, =println
mov x1, 1
bl printf
mov r46, x0
mov r340, 0
cmp r340, 0
bne main_lab48
b main_lab49

main_lab48:
ldr x0, =println
mov x1, 0
bl printf
mov r47, x0
mov r342, 1
cmp r342, 0
bne main_lab51
b main_lab52

main_lab49:
ldr x0, =println
mov x1, 1
bl printf
mov r48, x0
mov r344, 1
cmp r344, 0
bne main_lab51
b main_lab52

main_lab51:
ldr x0, =println
mov x1, 1
bl printf
mov r50, x0
mov r346, 1
cmp r346, 0
bne main_lab54
b main_lab55

main_lab52:
ldr x0, =println
mov x1, 0
bl printf
mov r51, x0
mov r348, 1
cmp r348, 0
bne main_lab54
b main_lab55

main_lab54:
ldr x0, =println
mov x1, 1
bl printf
mov r53, x0
b main_lab56

main_lab55:
ldr x0, =println
mov x1, 0
bl printf
mov r54, x0
b main_lab56

main_lab56:
mov x0, 4
bl printgroup
mov r350, 1
cmp r350, 0
bne main_lab57
b main_lab58

main_lab57:
ldr x0, =println
mov x1, 1
bl printf
mov r57, x0
mov r352, 1
cmp r352, 0
bne main_lab60
b main_lab61

main_lab58:
ldr x0, =print
mov x1, 0
bl printf
mov r58, x0
ldr x0, =println
mov x1, 5
bl printf
mov r60, x0
mov r354, 1
cmp r354, 0
bne main_lab60
b main_lab61

main_lab60:
ldr x0, =println
mov x1, 1
bl printf
mov r63, x0
mov r356, 1
cmp r356, 0
bne main_lab63
b main_lab64

main_lab61:
ldr x0, =print
mov x1, 0
bl printf
mov r64, x0
ldr x0, =println
mov x1, 6
bl printf
mov r66, x0
mov r358, 1
cmp r358, 0
bne main_lab63
b main_lab64

main_lab63:
ldr x0, =println
mov x1, 1
bl printf
mov r69, x0
mov r360, 1
cmp r360, 0
bne main_lab66
b main_lab67

main_lab64:
ldr x0, =print
mov x1, 0
bl printf
mov r70, x0
ldr x0, =println
mov x1, 1
bl printf
mov r72, x0
mov r362, 1
cmp r362, 0
bne main_lab66
b main_lab67

main_lab66:
ldr x0, =println
mov x1, 1
bl printf
mov r75, x0
mov r364, 1
cmp r364, 0
bne main_lab69
b main_lab70

main_lab67:
ldr x0, =print
mov x1, 0
bl printf
mov r76, x0
ldr x0, =println
mov x1, 2
bl printf
mov r78, x0
mov r366, 1
cmp r366, 0
bne main_lab69
b main_lab70

main_lab69:
ldr x0, =println
mov x1, 1
bl printf
mov r81, x0
b main_lab71

main_lab70:
ldr x0, =println
mov x1, 0
bl printf
mov r82, x0
b main_lab71

main_lab71:
mov x0, 5
bl printgroup
mov r368, 1
cmp r368, 0
bne main_lab72
b main_lab73

main_lab72:
ldr x0, =println
mov x1, 1
bl printf
mov r84, x0
mov r370, 1
cmp r370, 0
bne main_lab75
b main_lab76

main_lab73:
ldr x0, =println
mov x1, 0
bl printf
mov r85, x0
mov r372, 1
cmp r372, 0
bne main_lab75
b main_lab76

main_lab75:
ldr x0, =println
mov x1, 1
bl printf
mov r88, x0
mov r374, 1
cmp r374, 0
bne main_lab78
b main_lab79

main_lab76:
ldr x0, =println
mov x1, 0
bl printf
mov r89, x0
mov r376, 1
cmp r376, 0
bne main_lab78
b main_lab79

main_lab78:
ldr x0, =println
mov x1, 1
bl printf
mov r90, x0
mov r92, 1
b main_lab80

main_lab79:
ldr x0, =println
mov x1, 0
bl printf
mov r91, x0
mov r92, 1
b main_lab80

main_lab80:
mov r378, 1
xor r93, r378, r92
cmp r93, 0
bne main_lab81
b main_lab82

main_lab81:
ldr x0, =println
mov x1, 0
bl printf
mov r94, x0
mov r380, 0
cmp r380, 0
bne main_lab84
b main_lab85

main_lab82:
ldr x0, =println
mov x1, 1
bl printf
mov r95, x0
mov r382, 0
cmp r382, 0
bne main_lab84
b main_lab85

main_lab84:
ldr x0, =println
mov x1, 0
bl printf
mov r96, x0
mov r98, 0
b main_lab86

main_lab85:
ldr x0, =println
mov x1, 1
bl printf
mov r97, x0
mov r98, 0
b main_lab86

main_lab86:
mov r384, 1
xor r99, r384, r98
cmp r99, 0
bne main_lab87
b main_lab88

main_lab87:
ldr x0, =println
mov x1, 1
bl printf
mov r100, x0
mov r102, r98
b main_lab89

main_lab88:
ldr x0, =println
mov x1, 0
bl printf
mov r101, x0
mov r102, r98
b main_lab89

main_lab89:
cmp r102, 0
bne main_lab90
b main_lab91

main_lab90:
ldr x0, =println
mov x1, 0
bl printf
mov r103, x0
b main_lab92

main_lab91:
ldr x0, =println
mov x1, 1
bl printf
mov r104, x0
b main_lab92

main_lab92:
mov x0, 6
bl printgroup
mov r386, 1
cmp r386, 0
mov r106, 0
mov r112, 0
bne main_lab93
b main_lab97

inter_main_lab93:
mov r106, r110
b main_lab93

main_lab93:
cmp r106, 5
cset r107, ge
cmp r107, 0
mov r109, r106
bne main_lab94
b main_lab96

main_lab94:
ldr x0, =println
mov x1, 0
bl printf
mov r108, x0
mov r109, r106
b main_lab96

main_lab96:
mov r388, 5
add r110, r109, r388
cmp r110, 5
cset r111, lt
cmp r111, 0
mov r112, r110
bne main_lab93
b main_lab97

main_lab97:
cmp r112, 5
cset r113, eq
cmp r113, 0
bne main_lab98
b main_lab99

main_lab98:
ldr x0, =println
mov x1, 1
bl printf
mov r114, x0
b main_lab100

main_lab99:
ldr x0, =print
mov x1, 0
bl printf
mov r115, x0
ldr x0, =println
mov x1, r112
bl printf
mov r117, x0
b main_lab100

main_lab100:
mov x0, 7
bl printgroup
mov x0, 17
bl malloc
mov r119, x0
mov r120, r119
mov r393, 0
mov r394, 8
mul r392, r393, r394
add r121, r120, r392
str 42, [r121]
mov r399, 1
mov r400, 8
mul r398, r399, r400
add r122, r120, r398
str 1, [r122]
mov r405, 0
mov r406, 8
mul r404, r405, r406
add r123, r120, r404
ldr r124, [r123]
cmp r124, 42
cset r125, eq
cmp r125, 0
bne main_lab101
b main_lab102

main_lab101:
ldr x0, =println
mov x1, 1
bl printf
mov r126, x0
mov r132, r120
b main_lab103

main_lab102:
ldr x0, =print
mov x1, 0
bl printf
mov r127, x0
mov r411, 0
mov r412, 8
mul r410, r411, r412
add r129, r120, r410
ldr r130, [r129]
ldr x0, =println
mov x1, r130
bl printf
mov r131, x0
mov r132, r120
b main_lab103

main_lab103:
mov r417, 1
mov r418, 8
mul r416, r417, r418
add r133, r132, r416
ldr r134, [r133]
cmp r134, 0
bne main_lab104
b main_lab105

main_lab104:
ldr x0, =println
mov x1, 1
bl printf
mov r135, x0
mov r137, r132
b main_lab106

main_lab105:
ldr x0, =println
mov x1, 0
bl printf
mov r136, x0
mov r137, r132
b main_lab106

main_lab106:
mov r423, 2
mov r424, 8
mul r422, r423, r424
add r138, r137, r422
mov x0, 17
bl malloc
mov r139, x0
mov r140, r139
str r140, [r138]
mov r429, 2
mov r430, 8
mul r428, r429, r430
add r141, r137, r428
ldr r142, [r141]
mov r435, 0
mov r436, 8
mul r434, r435, r436
add r143, r142, r434
str 13, [r143]
mov r441, 2
mov r442, 8
mul r440, r441, r442
add r144, r137, r440
ldr r145, [r144]
mov r447, 1
mov r448, 8
mul r446, r447, r448
add r146, r145, r446
str 0, [r146]
mov r453, 2
mov r454, 8
mul r452, r453, r454
add r147, r137, r452
ldr r148, [r147]
mov r459, 0
mov r460, 8
mul r458, r459, r460
add r149, r148, r458
ldr r150, [r149]
cmp r150, 13
cset r151, eq
cmp r151, 0
bne main_lab107
b main_lab108

main_lab107:
ldr x0, =println
mov x1, 1
bl printf
mov r152, x0
mov r160, r137
b main_lab109

main_lab108:
ldr x0, =print
mov x1, 0
bl printf
mov r153, x0
mov r465, 2
mov r466, 8
mul r464, r465, r466
add r155, r137, r464
ldr r156, [r155]
mov r471, 0
mov r472, 8
mul r470, r471, r472
add r157, r156, r470
ldr r158, [r157]
ldr x0, =println
mov x1, r158
bl printf
mov r159, x0
mov r160, r137
b main_lab109

main_lab109:
mov r477, 2
mov r478, 8
mul r476, r477, r478
add r161, r160, r476
ldr r162, [r161]
mov r483, 1
mov r484, 8
mul r482, r483, r484
add r163, r162, r482
ldr r164, [r163]
mov r486, 1
xor r165, r486, r164
cmp r165, 0
bne main_lab110
b main_lab111

main_lab110:
ldr x0, =println
mov x1, 1
bl printf
mov r166, x0
mov r168, r160
b main_lab112

main_lab111:
ldr x0, =println
mov x1, 0
bl printf
mov r167, x0
mov r168, r160
b main_lab112

main_lab112:
cmp r168, r168
cset r169, eq
cmp r169, 0
bne main_lab113
b main_lab114

main_lab113:
ldr x0, =println
mov x1, 1
bl printf
mov r170, x0
mov r172, r168
b main_lab115

main_lab114:
ldr x0, =println
mov x1, 0
bl printf
mov r171, x0
mov r172, r168
b main_lab115

main_lab115:
mov r491, 2
mov r492, 8
mul r490, r491, r492
add r173, r172, r490
ldr r174, [r173]
cmp r172, r174
cset r175, ne
cmp r175, 0
bne main_lab116
b main_lab117

main_lab116:
ldr x0, =println
mov x1, 1
bl printf
mov r176, x0
mov r178, r172
b main_lab118

main_lab117:
ldr x0, =println
mov x1, 0
bl printf
mov r177, x0
mov r178, r172
b main_lab118

main_lab118:
mov r497, 2
mov r498, 8
mul r496, r497, r498
add r179, r178, r496
ldr r180, [r179]
mov x0, 8
bl printgroup
ldr r500, =gi1
str 7, [r500]
ldr r183, =gi1
ldr r183, [r183]
cmp r183, 7
cset r184, eq
cmp r184, 0
bne main_lab119
b main_lab120

main_lab119:
ldr x0, =println
mov x1, 1
bl printf
mov r185, x0
b main_lab121

main_lab120:
ldr x0, =print
mov x1, 0
bl printf
mov r186, x0
ldr r187, =gi1
ldr r187, [r187]
ldr x0, =println
mov x1, r187
bl printf
mov r188, x0
b main_lab121

main_lab121:
ldr r502, =gb1
str 1, [r502]
ldr r189, =gb1
ldr r189, [r189]
cmp r189, 0
bne main_lab122
b main_lab123

main_lab122:
ldr x0, =println
mov x1, 1
bl printf
mov r190, x0
b main_lab124

main_lab123:
ldr x0, =println
mov x1, 0
bl printf
mov r191, x0
b main_lab124

main_lab124:
mov x0, 17
bl malloc
mov r192, x0
mov r193, r192
ldr r504, =gs1
str r193, [r504]
ldr r194, =gs1
ldr r194, [r194]
mov r509, 0
mov r510, 8
mul r508, r509, r510
add r195, r194, r508
str 34, [r195]
ldr r196, =gs1
ldr r196, [r196]
mov r515, 1
mov r516, 8
mul r514, r515, r516
add r197, r196, r514
str 0, [r197]
ldr r198, =gs1
ldr r198, [r198]
mov r521, 0
mov r522, 8
mul r520, r521, r522
add r199, r198, r520
ldr r200, [r199]
cmp r200, 34
cset r201, eq
cmp r201, 0
bne main_lab125
b main_lab126

main_lab125:
ldr x0, =println
mov x1, 1
bl printf
mov r202, x0
b main_lab127

main_lab126:
ldr x0, =print
mov x1, 0
bl printf
mov r203, x0
ldr r204, =gs1
ldr r204, [r204]
mov r527, 0
mov r528, 8
mul r526, r527, r528
add r205, r204, r526
ldr r206, [r205]
ldr x0, =println
mov x1, r206
bl printf
mov r207, x0
b main_lab127

main_lab127:
ldr r208, =gs1
ldr r208, [r208]
mov r533, 1
mov r534, 8
mul r532, r533, r534
add r209, r208, r532
ldr r210, [r209]
mov r536, 1
xor r211, r536, r210
cmp r211, 0
bne main_lab128
b main_lab129

main_lab128:
ldr x0, =println
mov x1, 1
bl printf
mov r212, x0
b main_lab130

main_lab129:
ldr x0, =println
mov x1, 0
bl printf
mov r213, x0
b main_lab130

main_lab130:
ldr r214, =gs1
ldr r214, [r214]
mov r541, 2
mov r542, 8
mul r540, r541, r542
add r215, r214, r540
mov x0, 17
bl malloc
mov r216, x0
mov r217, r216
str r217, [r215]
ldr r218, =gs1
ldr r218, [r218]
mov r547, 2
mov r548, 8
mul r546, r547, r548
add r219, r218, r546
ldr r220, [r219]
mov r553, 0
mov r554, 8
mul r552, r553, r554
add r221, r220, r552
str 16, [r221]
ldr r222, =gs1
ldr r222, [r222]
mov r559, 2
mov r560, 8
mul r558, r559, r560
add r223, r222, r558
ldr r224, [r223]
mov r565, 1
mov r566, 8
mul r564, r565, r566
add r225, r224, r564
str 1, [r225]
ldr r226, =gs1
ldr r226, [r226]
mov r571, 2
mov r572, 8
mul r570, r571, r572
add r227, r226, r570
ldr r228, [r227]
mov r577, 0
mov r578, 8
mul r576, r577, r578
add r229, r228, r576
ldr r230, [r229]
cmp r230, 16
cset r231, eq
cmp r231, 0
bne main_lab131
b main_lab132

main_lab131:
ldr x0, =println
mov x1, 1
bl printf
mov r232, x0
b main_lab133

main_lab132:
ldr x0, =print
mov x1, 0
bl printf
mov r233, x0
ldr r234, =gs1
ldr r234, [r234]
mov r583, 2
mov r584, 8
mul r582, r583, r584
add r235, r234, r582
ldr r236, [r235]
mov r589, 0
mov r590, 8
mul r588, r589, r590
add r237, r236, r588
ldr r238, [r237]
ldr x0, =println
mov x1, r238
bl printf
mov r239, x0
b main_lab133

main_lab133:
ldr r240, =gs1
ldr r240, [r240]
mov r595, 2
mov r596, 8
mul r594, r595, r596
add r241, r240, r594
ldr r242, [r241]
mov r601, 1
mov r602, 8
mul r600, r601, r602
add r243, r242, r600
ldr r244, [r243]
cmp r244, 0
bne main_lab134
b main_lab135

main_lab134:
ldr x0, =println
mov x1, 1
bl printf
mov r245, x0
b main_lab136

main_lab135:
ldr x0, =println
mov x1, 0
bl printf
mov r246, x0
b main_lab136

main_lab136:
ldr r247, =gs1
ldr r247, [r247]
mov r607, 2
mov r608, 8
mul r606, r607, r608
add r248, r247, r606
ldr r249, [r248]
ldr r251, =gs1
ldr r251, [r251]
mov x0, 9
bl printgroup
mov x0, 17
bl malloc
mov r253, x0
mov r254, r253
mov r613, 1
mov r614, 8
mul r612, r613, r614
add r255, r254, r612
str 1, [r255]
mov x0, 3
mov x1, 1
mov x2, r254
bl takealltypes
ldr x0, =println
mov x1, 2
bl printf
mov r256, x0
mov x0, 1
mov x1, 2
mov x2, 3
mov x3, 4
mov x4, 5
mov x5, 6
mov x6, 7
mov x7, 8
bl tonofargs
ldr x0, =println
mov x1, 3
bl printf
mov r257, x0
mov x0, 3
bl returnint
mov r258, x0
cmp r258, 3
cset r259, eq
cmp r259, 0
bne main_lab137
b main_lab138

main_lab137:
ldr x0, =println
mov x1, 1
bl printf
mov r260, x0
b main_lab139

main_lab138:
ldr x0, =print
mov x1, 0
bl printf
mov r261, x0
ldr x0, =println
mov x1, r258
bl printf
mov r263, x0
b main_lab139

main_lab139:
mov x0, 1
bl returnbool
mov r265, x0
cmp r265, 0
bne main_lab140
b main_lab141

main_lab140:
ldr x0, =println
mov x1, 1
bl printf
mov r266, x0
b main_lab142

main_lab141:
ldr x0, =println
mov x1, 0
bl printf
mov r267, x0
b main_lab142

main_lab142:
mov x0, 17
bl malloc
mov r268, x0
mov r269, r268
mov x0, r269
bl returnstruct
mov r270, x0
cmp r269, r270
cset r271, eq
cmp r271, 0
bne main_lab143
b main_lab144

main_lab143:
ldr x0, =println
mov x1, 1
bl printf
mov r272, x0
b main_returnLabel

main_lab144:
ldr x0, =println
mov x1, 0
bl printf
mov r273, x0
b main_returnLabel

main_returnLabel:
mov x0, 10
bl printgroup
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

