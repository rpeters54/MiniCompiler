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
stp x29, x30, [sp, -104]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r10, x13, 96
str r0, [r10]
ldr x0, =print
mov x1, 1
bl printf
mov r2, x0
ldr x0, =print
mov x1, 0
bl printf
mov r3, x0
ldr x0, =print
mov x1, 1
bl printf
mov r4, x0
ldr x0, =print
mov x1, 0
bl printf
mov r5, x0
ldr x0, =print
mov x1, 1
bl printf
mov r6, x0
ldr x0, =print
mov x1, 0
bl printf
mov r7, x0
ldr r8, [r10]
ldr x0, =println
mov x1, r8
bl printf
mov r9, x0
b printgroup_returnLabel

printgroup_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 104
ret

.global setcounter
setcounter:
setcounter_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r7, x13, 96
add r8, x13, 104
str r0, [r8]
ldr r3, [r8]
ldr r6, =counter
str r3, [r6]
str 1, [r7]
b setcounter_returnLabel

setcounter_returnLabel:
ldr r4, [r7]
mov x0, r4
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global takealltypes
takealltypes:
takealltypes_prologue:
stp x29, x30, [sp, -120]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
mov r2, x2
add r24, x13, 96
add r25, x13, 104
add r26, x13, 112
str r0, [r24]
str r1, [r25]
str r2, [r26]
ldr r6, [r24]
cmp r6, 3
cset r7, eq
cmp r7, 0
bne takealltypes_lab0
b takealltypes_lab1

takealltypes_lab0:
ldr x0, =println
mov x1, 1
bl printf
mov r8, x0
b takealltypes_lab2

takealltypes_lab1:
ldr x0, =println
mov x1, 0
bl printf
mov r9, x0
b takealltypes_lab2

takealltypes_lab2:
ldr r10, [r25]
cmp r10, 0
bne takealltypes_lab3
b takealltypes_lab4

takealltypes_lab3:
ldr x0, =println
mov x1, 1
bl printf
mov r11, x0
b takealltypes_lab5

takealltypes_lab4:
ldr x0, =println
mov x1, 0
bl printf
mov r12, x0
b takealltypes_lab5

takealltypes_lab5:
ldr r13, [r26]
mov r22, 1
mov r23, 8
mul r21, r22, r23
add r14, r13, r21
ldr r15, [r14]
cmp r15, 0
bne takealltypes_lab6
b takealltypes_lab7

takealltypes_lab6:
ldr x0, =println
mov x1, 1
bl printf
mov r16, x0
b takealltypes_lab8

takealltypes_lab7:
ldr x0, =println
mov x1, 0
bl printf
mov r17, x0
b takealltypes_lab8

takealltypes_lab8:
b takealltypes_returnLabel

takealltypes_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 120
ret

.global tonofargs
tonofargs:
tonofargs_prologue:
stp x29, x30, [sp, -160]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
mov r1, x1
mov r2, x2
mov r3, x3
mov r4, x4
mov r5, x5
mov r6, x6
mov r7, x7
add r40, x13, 96
add r41, x13, 104
add r42, x13, 112
add r43, x13, 120
add r44, x13, 128
add r45, x13, 136
add r46, x13, 144
add r47, x13, 152
str r0, [r40]
str r1, [r41]
str r2, [r42]
str r3, [r43]
str r4, [r44]
str r5, [r45]
str r6, [r46]
str r7, [r47]
ldr r16, [r44]
cmp r16, 5
cset r17, eq
cmp r17, 0
bne tonofargs_lab0
b tonofargs_lab1

tonofargs_lab0:
ldr x0, =println
mov x1, 1
bl printf
mov r18, x0
b tonofargs_lab2

tonofargs_lab1:
ldr x0, =print
mov x1, 0
bl printf
mov r19, x0
ldr r20, [r44]
ldr x0, =println
mov x1, r20
bl printf
mov r21, x0
b tonofargs_lab2

tonofargs_lab2:
ldr r22, [r45]
cmp r22, 6
cset r23, eq
cmp r23, 0
bne tonofargs_lab3
b tonofargs_lab4

tonofargs_lab3:
ldr x0, =println
mov x1, 1
bl printf
mov r24, x0
b tonofargs_lab5

tonofargs_lab4:
ldr x0, =print
mov x1, 0
bl printf
mov r25, x0
ldr r26, [r45]
ldr x0, =println
mov x1, r26
bl printf
mov r27, x0
b tonofargs_lab5

tonofargs_lab5:
ldr r28, [r46]
cmp r28, 7
cset r29, eq
cmp r29, 0
bne tonofargs_lab6
b tonofargs_lab7

tonofargs_lab6:
ldr x0, =println
mov x1, 1
bl printf
mov r30, x0
b tonofargs_lab8

tonofargs_lab7:
ldr x0, =print
mov x1, 0
bl printf
mov r31, x0
ldr r32, [r46]
ldr x0, =println
mov x1, r32
bl printf
mov r33, x0
b tonofargs_lab8

tonofargs_lab8:
ldr r34, [r47]
cmp r34, 8
cset r35, eq
cmp r35, 0
bne tonofargs_lab9
b tonofargs_lab10

tonofargs_lab9:
ldr x0, =println
mov x1, 1
bl printf
mov r36, x0
b tonofargs_lab11

tonofargs_lab10:
ldr x0, =print
mov x1, 0
bl printf
mov r37, x0
ldr r38, [r47]
ldr x0, =println
mov x1, r38
bl printf
mov r39, x0
b tonofargs_lab11

tonofargs_lab11:
b tonofargs_returnLabel

tonofargs_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 160
ret

.global returnint
returnint:
returnint_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r5, x13, 96
add r6, x13, 104
str r0, [r6]
ldr r3, [r6]
str r3, [r5]
b returnint_returnLabel

returnint_returnLabel:
ldr r4, [r5]
mov x0, r4
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global returnbool
returnbool:
returnbool_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r5, x13, 96
add r6, x13, 104
str r0, [r6]
ldr r3, [r6]
str r3, [r5]
b returnbool_returnLabel

returnbool_returnLabel:
ldr r4, [r5]
mov x0, r4
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global returnstruct
returnstruct:
returnstruct_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov r0, x0
add r5, x13, 96
add r6, x13, 104
str r0, [r6]
ldr r3, [r6]
str r3, [r5]
b returnstruct_returnLabel

returnstruct_returnLabel:
ldr r4, [r5]
mov x0, r4
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
stp x29, x30, [sp, -160]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add r621, x13, 96
add r622, x13, 104
add r623, x13, 112
add r624, x13, 120
add r625, x13, 128
add r626, x13, 136
add r627, x13, 144
add r628, x13, 152
ldr r322, =counter
str 0, [r322]
mov x0, 1
bl printgroup
str 0, [r622]
str 0, [r623]
ldr r8, [r622]
ldr r9, [r623]
and r10, r8, r9
cmp r10, 0
bne main_lab0
b main_lab1

main_lab0:
ldr x0, =println
mov x1, 0
bl printf
mov r11, x0
b main_lab2

main_lab1:
ldr x0, =println
mov x1, 1
bl printf
mov r12, x0
b main_lab2

main_lab2:
str 1, [r622]
str 0, [r623]
ldr r13, [r622]
ldr r14, [r623]
and r15, r13, r14
cmp r15, 0
bne main_lab3
b main_lab4

main_lab3:
ldr x0, =println
mov x1, 0
bl printf
mov r16, x0
b main_lab5

main_lab4:
ldr x0, =println
mov x1, 1
bl printf
mov r17, x0
b main_lab5

main_lab5:
str 0, [r622]
str 1, [r623]
ldr r18, [r622]
ldr r19, [r623]
and r20, r18, r19
cmp r20, 0
bne main_lab6
b main_lab7

main_lab6:
ldr x0, =println
mov x1, 0
bl printf
mov r21, x0
b main_lab8

main_lab7:
ldr x0, =println
mov x1, 1
bl printf
mov r22, x0
b main_lab8

main_lab8:
str 1, [r622]
str 1, [r623]
ldr r23, [r622]
ldr r24, [r623]
and r25, r23, r24
cmp r25, 0
bne main_lab9
b main_lab10

main_lab9:
ldr x0, =println
mov x1, 1
bl printf
mov r26, x0
b main_lab11

main_lab10:
ldr x0, =println
mov x1, 0
bl printf
mov r27, x0
b main_lab11

main_lab11:
ldr r324, =counter
str 0, [r324]
mov x0, 2
bl printgroup
str 1, [r622]
str 1, [r623]
ldr r28, [r622]
ldr r29, [r623]
or r30, r28, r29
cmp r30, 0
bne main_lab12
b main_lab13

main_lab12:
ldr x0, =println
mov x1, 1
bl printf
mov r31, x0
b main_lab14

main_lab13:
ldr x0, =println
mov x1, 0
bl printf
mov r32, x0
b main_lab14

main_lab14:
str 1, [r622]
str 0, [r623]
ldr r33, [r622]
ldr r34, [r623]
or r35, r33, r34
cmp r35, 0
bne main_lab15
b main_lab16

main_lab15:
ldr x0, =println
mov x1, 1
bl printf
mov r36, x0
b main_lab17

main_lab16:
ldr x0, =println
mov x1, 0
bl printf
mov r37, x0
b main_lab17

main_lab17:
str 0, [r622]
str 1, [r623]
ldr r38, [r622]
ldr r39, [r623]
or r40, r38, r39
cmp r40, 0
bne main_lab18
b main_lab19

main_lab18:
ldr x0, =println
mov x1, 1
bl printf
mov r41, x0
b main_lab20

main_lab19:
ldr x0, =println
mov x1, 0
bl printf
mov r42, x0
b main_lab20

main_lab20:
str 0, [r622]
str 0, [r623]
ldr r43, [r622]
ldr r44, [r623]
or r45, r43, r44
cmp r45, 0
bne main_lab21
b main_lab22

main_lab21:
ldr x0, =println
mov x1, 0
bl printf
mov r46, x0
b main_lab23

main_lab22:
ldr x0, =println
mov x1, 1
bl printf
mov r47, x0
b main_lab23

main_lab23:
mov x0, 3
bl printgroup
mov r326, 42
cmp r326, 1
cset r48, gt
cmp r48, 0
bne main_lab24
b main_lab25

main_lab24:
ldr x0, =println
mov x1, 1
bl printf
mov r49, x0
b main_lab26

main_lab25:
ldr x0, =println
mov x1, 0
bl printf
mov r50, x0
b main_lab26

main_lab26:
mov r328, 42
cmp r328, 1
cset r51, ge
cmp r51, 0
bne main_lab27
b main_lab28

main_lab27:
ldr x0, =println
mov x1, 1
bl printf
mov r52, x0
b main_lab29

main_lab28:
ldr x0, =println
mov x1, 0
bl printf
mov r53, x0
b main_lab29

main_lab29:
mov r330, 42
cmp r330, 1
cset r54, lt
cmp r54, 0
bne main_lab30
b main_lab31

main_lab30:
ldr x0, =println
mov x1, 0
bl printf
mov r55, x0
b main_lab32

main_lab31:
ldr x0, =println
mov x1, 1
bl printf
mov r56, x0
b main_lab32

main_lab32:
mov r332, 42
cmp r332, 1
cset r57, le
cmp r57, 0
bne main_lab33
b main_lab34

main_lab33:
ldr x0, =println
mov x1, 0
bl printf
mov r58, x0
b main_lab35

main_lab34:
ldr x0, =println
mov x1, 1
bl printf
mov r59, x0
b main_lab35

main_lab35:
mov r334, 42
cmp r334, 1
cset r60, eq
cmp r60, 0
bne main_lab36
b main_lab37

main_lab36:
ldr x0, =println
mov x1, 0
bl printf
mov r61, x0
b main_lab38

main_lab37:
ldr x0, =println
mov x1, 1
bl printf
mov r62, x0
b main_lab38

main_lab38:
mov r336, 42
cmp r336, 1
cset r63, ne
cmp r63, 0
bne main_lab39
b main_lab40

main_lab39:
ldr x0, =println
mov x1, 1
bl printf
mov r64, x0
b main_lab41

main_lab40:
ldr x0, =println
mov x1, 0
bl printf
mov r65, x0
b main_lab41

main_lab41:
mov r338, 1
cmp r338, 0
bne main_lab42
b main_lab43

main_lab42:
ldr x0, =println
mov x1, 1
bl printf
mov r66, x0
b main_lab44

main_lab43:
ldr x0, =println
mov x1, 0
bl printf
mov r67, x0
b main_lab44

main_lab44:
mov r341, 1
mov r342, 1
xor r68, r341, r342
cmp r68, 0
bne main_lab45
b main_lab46

main_lab45:
ldr x0, =println
mov x1, 0
bl printf
mov r69, x0
b main_lab47

main_lab46:
ldr x0, =println
mov x1, 1
bl printf
mov r70, x0
b main_lab47

main_lab47:
mov r344, 0
cmp r344, 0
bne main_lab48
b main_lab49

main_lab48:
ldr x0, =println
mov x1, 0
bl printf
mov r71, x0
b main_lab50

main_lab49:
ldr x0, =println
mov x1, 1
bl printf
mov r72, x0
b main_lab50

main_lab50:
mov r347, 1
mov r348, 0
xor r73, r347, r348
cmp r73, 0
bne main_lab51
b main_lab52

main_lab51:
ldr x0, =println
mov x1, 1
bl printf
mov r74, x0
b main_lab53

main_lab52:
ldr x0, =println
mov x1, 0
bl printf
mov r75, x0
b main_lab53

main_lab53:
mov r351, 1
mov r352, 0
xor r76, r351, r352
cmp r76, 0
bne main_lab54
b main_lab55

main_lab54:
ldr x0, =println
mov x1, 1
bl printf
mov r77, x0
b main_lab56

main_lab55:
ldr x0, =println
mov x1, 0
bl printf
mov r78, x0
b main_lab56

main_lab56:
mov x0, 4
bl printgroup
mov r355, 2
mov r356, 3
add r79, r355, r356
cmp r79, 5
cset r80, eq
cmp r80, 0
bne main_lab57
b main_lab58

main_lab57:
ldr x0, =println
mov x1, 1
bl printf
mov r81, x0
b main_lab59

main_lab58:
ldr x0, =print
mov x1, 0
bl printf
mov r82, x0
mov r359, 2
mov r360, 3
add r83, r359, r360
ldr x0, =println
mov x1, r83
bl printf
mov r84, x0
b main_lab59

main_lab59:
mov r363, 2
mov r364, 3
mul r85, r363, r364
cmp r85, 6
cset r86, eq
cmp r86, 0
bne main_lab60
b main_lab61

main_lab60:
ldr x0, =println
mov x1, 1
bl printf
mov r87, x0
b main_lab62

main_lab61:
ldr x0, =print
mov x1, 0
bl printf
mov r88, x0
mov r367, 2
mov r368, 3
mul r89, r367, r368
ldr x0, =println
mov x1, r89
bl printf
mov r90, x0
b main_lab62

main_lab62:
mov r371, 3
mov r372, 2
sub r91, r371, r372
cmp r91, 1
cset r92, eq
cmp r92, 0
bne main_lab63
b main_lab64

main_lab63:
ldr x0, =println
mov x1, 1
bl printf
mov r93, x0
b main_lab65

main_lab64:
ldr x0, =print
mov x1, 0
bl printf
mov r94, x0
mov r375, 3
mov r376, 2
sub r95, r375, r376
ldr x0, =println
mov x1, r95
bl printf
mov r96, x0
b main_lab65

main_lab65:
mov r379, 6
mov r380, 3
sdiv r97, r379, r380
cmp r97, 2
cset r98, eq
cmp r98, 0
bne main_lab66
b main_lab67

main_lab66:
ldr x0, =println
mov x1, 1
bl printf
mov r99, x0
b main_lab68

main_lab67:
ldr x0, =print
mov x1, 0
bl printf
mov r100, x0
mov r383, 6
mov r384, 3
sdiv r101, r383, r384
ldr x0, =println
mov x1, r101
bl printf
mov r102, x0
b main_lab68

main_lab68:
mov r387, 0
mov r388, 6
sub r103, r387, r388
cmp r103, 0
cset r104, lt
cmp r104, 0
bne main_lab69
b main_lab70

main_lab69:
ldr x0, =println
mov x1, 1
bl printf
mov r105, x0
b main_lab71

main_lab70:
ldr x0, =println
mov x1, 0
bl printf
mov r106, x0
b main_lab71

main_lab71:
mov x0, 5
bl printgroup
str 42, [r624]
ldr r107, [r624]
cmp r107, 42
cset r108, eq
cmp r108, 0
bne main_lab72
b main_lab73

main_lab72:
ldr x0, =println
mov x1, 1
bl printf
mov r109, x0
b main_lab74

main_lab73:
ldr x0, =println
mov x1, 0
bl printf
mov r110, x0
b main_lab74

main_lab74:
str 3, [r624]
str 2, [r625]
ldr r111, [r624]
ldr r112, [r625]
add r113, r111, r112
str r113, [r626]
ldr r114, [r626]
cmp r114, 5
cset r115, eq
cmp r115, 0
bne main_lab75
b main_lab76

main_lab75:
ldr x0, =println
mov x1, 1
bl printf
mov r116, x0
b main_lab77

main_lab76:
ldr x0, =println
mov x1, 0
bl printf
mov r117, x0
b main_lab77

main_lab77:
str 1, [r622]
ldr r118, [r622]
cmp r118, 0
bne main_lab78
b main_lab79

main_lab78:
ldr x0, =println
mov x1, 1
bl printf
mov r119, x0
b main_lab80

main_lab79:
ldr x0, =println
mov x1, 0
bl printf
mov r120, x0
b main_lab80

main_lab80:
ldr r121, [r622]
mov r390, 1
xor r122, r390, r121
cmp r122, 0
bne main_lab81
b main_lab82

main_lab81:
ldr x0, =println
mov x1, 0
bl printf
mov r123, x0
b main_lab83

main_lab82:
ldr x0, =println
mov x1, 1
bl printf
mov r124, x0
b main_lab83

main_lab83:
str 0, [r622]
ldr r125, [r622]
cmp r125, 0
bne main_lab84
b main_lab85

main_lab84:
ldr x0, =println
mov x1, 0
bl printf
mov r126, x0
b main_lab86

main_lab85:
ldr x0, =println
mov x1, 1
bl printf
mov r127, x0
b main_lab86

main_lab86:
ldr r128, [r622]
mov r392, 1
xor r129, r392, r128
cmp r129, 0
bne main_lab87
b main_lab88

main_lab87:
ldr x0, =println
mov x1, 1
bl printf
mov r130, x0
b main_lab89

main_lab88:
ldr x0, =println
mov x1, 0
bl printf
mov r131, x0
b main_lab89

main_lab89:
ldr r132, [r622]
cmp r132, 0
bne main_lab90
b main_lab91

main_lab90:
ldr x0, =println
mov x1, 0
bl printf
mov r133, x0
b main_lab92

main_lab91:
ldr x0, =println
mov x1, 1
bl printf
mov r134, x0
b main_lab92

main_lab92:
mov x0, 6
bl printgroup
str 0, [r624]
ldr r135, [r624]
cmp r135, 5
cset r136, lt
cmp r136, 0
bne main_lab93
b main_lab97

main_lab93:
ldr r137, [r624]
cmp r137, 5
cset r138, ge
cmp r138, 0
bne main_lab94
b main_lab95

main_lab94:
ldr x0, =println
mov x1, 0
bl printf
mov r139, x0
b main_lab96

main_lab95:
b main_lab96

main_lab96:
ldr r140, [r624]
mov r394, 5
add r141, r140, r394
str r141, [r624]
ldr r142, [r624]
cmp r142, 5
cset r143, lt
cmp r143, 0
bne main_lab93
b main_lab97

main_lab97:
ldr r144, [r624]
cmp r144, 5
cset r145, eq
cmp r145, 0
bne main_lab98
b main_lab99

main_lab98:
ldr x0, =println
mov x1, 1
bl printf
mov r146, x0
b main_lab100

main_lab99:
ldr x0, =print
mov x1, 0
bl printf
mov r147, x0
ldr r148, [r624]
ldr x0, =println
mov x1, r148
bl printf
mov r149, x0
b main_lab100

main_lab100:
mov x0, 7
bl printgroup
mov x0, 17
bl malloc
mov r150, x0
mov r151, r150
str r151, [r627]
ldr r152, [r627]
mov r399, 0
mov r400, 8
mul r398, r399, r400
add r153, r152, r398
str 42, [r153]
ldr r154, [r627]
mov r405, 1
mov r406, 8
mul r404, r405, r406
add r155, r154, r404
str 1, [r155]
ldr r156, [r627]
mov r411, 0
mov r412, 8
mul r410, r411, r412
add r157, r156, r410
ldr r158, [r157]
cmp r158, 42
cset r159, eq
cmp r159, 0
bne main_lab101
b main_lab102

main_lab101:
ldr x0, =println
mov x1, 1
bl printf
mov r160, x0
b main_lab103

main_lab102:
ldr x0, =print
mov x1, 0
bl printf
mov r161, x0
ldr r162, [r627]
mov r417, 0
mov r418, 8
mul r416, r417, r418
add r163, r162, r416
ldr r164, [r163]
ldr x0, =println
mov x1, r164
bl printf
mov r165, x0
b main_lab103

main_lab103:
ldr r166, [r627]
mov r423, 1
mov r424, 8
mul r422, r423, r424
add r167, r166, r422
ldr r168, [r167]
cmp r168, 0
bne main_lab104
b main_lab105

main_lab104:
ldr x0, =println
mov x1, 1
bl printf
mov r169, x0
b main_lab106

main_lab105:
ldr x0, =println
mov x1, 0
bl printf
mov r170, x0
b main_lab106

main_lab106:
ldr r171, [r627]
mov r429, 2
mov r430, 8
mul r428, r429, r430
add r172, r171, r428
mov x0, 17
bl malloc
mov r173, x0
mov r174, r173
str r174, [r172]
ldr r175, [r627]
mov r435, 2
mov r436, 8
mul r434, r435, r436
add r176, r175, r434
ldr r177, [r176]
mov r441, 0
mov r442, 8
mul r440, r441, r442
add r178, r177, r440
str 13, [r178]
ldr r179, [r627]
mov r447, 2
mov r448, 8
mul r446, r447, r448
add r180, r179, r446
ldr r181, [r180]
mov r453, 1
mov r454, 8
mul r452, r453, r454
add r182, r181, r452
str 0, [r182]
ldr r183, [r627]
mov r459, 2
mov r460, 8
mul r458, r459, r460
add r184, r183, r458
ldr r185, [r184]
mov r465, 0
mov r466, 8
mul r464, r465, r466
add r186, r185, r464
ldr r187, [r186]
cmp r187, 13
cset r188, eq
cmp r188, 0
bne main_lab107
b main_lab108

main_lab107:
ldr x0, =println
mov x1, 1
bl printf
mov r189, x0
b main_lab109

main_lab108:
ldr x0, =print
mov x1, 0
bl printf
mov r190, x0
ldr r191, [r627]
mov r471, 2
mov r472, 8
mul r470, r471, r472
add r192, r191, r470
ldr r193, [r192]
mov r477, 0
mov r478, 8
mul r476, r477, r478
add r194, r193, r476
ldr r195, [r194]
ldr x0, =println
mov x1, r195
bl printf
mov r196, x0
b main_lab109

main_lab109:
ldr r197, [r627]
mov r483, 2
mov r484, 8
mul r482, r483, r484
add r198, r197, r482
ldr r199, [r198]
mov r489, 1
mov r490, 8
mul r488, r489, r490
add r200, r199, r488
ldr r201, [r200]
mov r492, 1
xor r202, r492, r201
cmp r202, 0
bne main_lab110
b main_lab111

main_lab110:
ldr x0, =println
mov x1, 1
bl printf
mov r203, x0
b main_lab112

main_lab111:
ldr x0, =println
mov x1, 0
bl printf
mov r204, x0
b main_lab112

main_lab112:
ldr r205, [r627]
ldr r206, [r627]
cmp r205, r206
cset r207, eq
cmp r207, 0
bne main_lab113
b main_lab114

main_lab113:
ldr x0, =println
mov x1, 1
bl printf
mov r208, x0
b main_lab115

main_lab114:
ldr x0, =println
mov x1, 0
bl printf
mov r209, x0
b main_lab115

main_lab115:
ldr r210, [r627]
ldr r211, [r627]
mov r497, 2
mov r498, 8
mul r496, r497, r498
add r212, r211, r496
ldr r213, [r212]
cmp r210, r213
cset r214, ne
cmp r214, 0
bne main_lab116
b main_lab117

main_lab116:
ldr x0, =println
mov x1, 1
bl printf
mov r215, x0
b main_lab118

main_lab117:
ldr x0, =println
mov x1, 0
bl printf
mov r216, x0
b main_lab118

main_lab118:
ldr r217, [r627]
mov r503, 2
mov r504, 8
mul r502, r503, r504
add r218, r217, r502
ldr r219, [r218]
mov r220, r219
mov x0, r220
bl free
ldr r221, [r627]
mov r222, r221
mov x0, r222
bl free
mov x0, 8
bl printgroup
ldr r506, =gi1
str 7, [r506]
ldr r223, =gi1
ldr r223, [r223]
cmp r223, 7
cset r224, eq
cmp r224, 0
bne main_lab119
b main_lab120

main_lab119:
ldr x0, =println
mov x1, 1
bl printf
mov r225, x0
b main_lab121

main_lab120:
ldr x0, =print
mov x1, 0
bl printf
mov r226, x0
ldr r227, =gi1
ldr r227, [r227]
ldr x0, =println
mov x1, r227
bl printf
mov r228, x0
b main_lab121

main_lab121:
ldr r508, =gb1
str 1, [r508]
ldr r229, =gb1
ldr r229, [r229]
cmp r229, 0
bne main_lab122
b main_lab123

main_lab122:
ldr x0, =println
mov x1, 1
bl printf
mov r230, x0
b main_lab124

main_lab123:
ldr x0, =println
mov x1, 0
bl printf
mov r231, x0
b main_lab124

main_lab124:
mov x0, 17
bl malloc
mov r232, x0
mov r233, r232
ldr r510, =gs1
str r233, [r510]
ldr r234, =gs1
ldr r234, [r234]
mov r515, 0
mov r516, 8
mul r514, r515, r516
add r235, r234, r514
str 34, [r235]
ldr r236, =gs1
ldr r236, [r236]
mov r521, 1
mov r522, 8
mul r520, r521, r522
add r237, r236, r520
str 0, [r237]
ldr r238, =gs1
ldr r238, [r238]
mov r527, 0
mov r528, 8
mul r526, r527, r528
add r239, r238, r526
ldr r240, [r239]
cmp r240, 34
cset r241, eq
cmp r241, 0
bne main_lab125
b main_lab126

main_lab125:
ldr x0, =println
mov x1, 1
bl printf
mov r242, x0
b main_lab127

main_lab126:
ldr x0, =print
mov x1, 0
bl printf
mov r243, x0
ldr r244, =gs1
ldr r244, [r244]
mov r533, 0
mov r534, 8
mul r532, r533, r534
add r245, r244, r532
ldr r246, [r245]
ldr x0, =println
mov x1, r246
bl printf
mov r247, x0
b main_lab127

main_lab127:
ldr r248, =gs1
ldr r248, [r248]
mov r539, 1
mov r540, 8
mul r538, r539, r540
add r249, r248, r538
ldr r250, [r249]
mov r542, 1
xor r251, r542, r250
cmp r251, 0
bne main_lab128
b main_lab129

main_lab128:
ldr x0, =println
mov x1, 1
bl printf
mov r252, x0
b main_lab130

main_lab129:
ldr x0, =println
mov x1, 0
bl printf
mov r253, x0
b main_lab130

main_lab130:
ldr r254, =gs1
ldr r254, [r254]
mov r547, 2
mov r548, 8
mul r546, r547, r548
add r255, r254, r546
mov x0, 17
bl malloc
mov r256, x0
mov r257, r256
str r257, [r255]
ldr r258, =gs1
ldr r258, [r258]
mov r553, 2
mov r554, 8
mul r552, r553, r554
add r259, r258, r552
ldr r260, [r259]
mov r559, 0
mov r560, 8
mul r558, r559, r560
add r261, r260, r558
str 16, [r261]
ldr r262, =gs1
ldr r262, [r262]
mov r565, 2
mov r566, 8
mul r564, r565, r566
add r263, r262, r564
ldr r264, [r263]
mov r571, 1
mov r572, 8
mul r570, r571, r572
add r265, r264, r570
str 1, [r265]
ldr r266, =gs1
ldr r266, [r266]
mov r577, 2
mov r578, 8
mul r576, r577, r578
add r267, r266, r576
ldr r268, [r267]
mov r583, 0
mov r584, 8
mul r582, r583, r584
add r269, r268, r582
ldr r270, [r269]
cmp r270, 16
cset r271, eq
cmp r271, 0
bne main_lab131
b main_lab132

main_lab131:
ldr x0, =println
mov x1, 1
bl printf
mov r272, x0
b main_lab133

main_lab132:
ldr x0, =print
mov x1, 0
bl printf
mov r273, x0
ldr r274, =gs1
ldr r274, [r274]
mov r589, 2
mov r590, 8
mul r588, r589, r590
add r275, r274, r588
ldr r276, [r275]
mov r595, 0
mov r596, 8
mul r594, r595, r596
add r277, r276, r594
ldr r278, [r277]
ldr x0, =println
mov x1, r278
bl printf
mov r279, x0
b main_lab133

main_lab133:
ldr r280, =gs1
ldr r280, [r280]
mov r601, 2
mov r602, 8
mul r600, r601, r602
add r281, r280, r600
ldr r282, [r281]
mov r607, 1
mov r608, 8
mul r606, r607, r608
add r283, r282, r606
ldr r284, [r283]
cmp r284, 0
bne main_lab134
b main_lab135

main_lab134:
ldr x0, =println
mov x1, 1
bl printf
mov r285, x0
b main_lab136

main_lab135:
ldr x0, =println
mov x1, 0
bl printf
mov r286, x0
b main_lab136

main_lab136:
ldr r287, =gs1
ldr r287, [r287]
mov r613, 2
mov r614, 8
mul r612, r613, r614
add r288, r287, r612
ldr r289, [r288]
mov r290, r289
mov x0, r290
bl free
ldr r291, =gs1
ldr r291, [r291]
mov r292, r291
mov x0, r292
bl free
mov x0, 9
bl printgroup
mov x0, 17
bl malloc
mov r293, x0
mov r294, r293
str r294, [r627]
ldr r295, [r627]
mov r619, 1
mov r620, 8
mul r618, r619, r620
add r296, r295, r618
str 1, [r296]
ldr r297, [r627]
mov x0, 3
mov x1, 1
mov x2, r297
bl takealltypes
ldr x0, =println
mov x1, 2
bl printf
mov r298, x0
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
mov r299, x0
mov x0, 3
bl returnint
mov r300, x0
str r300, [r624]
ldr r301, [r624]
cmp r301, 3
cset r302, eq
cmp r302, 0
bne main_lab137
b main_lab138

main_lab137:
ldr x0, =println
mov x1, 1
bl printf
mov r303, x0
b main_lab139

main_lab138:
ldr x0, =print
mov x1, 0
bl printf
mov r304, x0
ldr r305, [r624]
ldr x0, =println
mov x1, r305
bl printf
mov r306, x0
b main_lab139

main_lab139:
mov x0, 1
bl returnbool
mov r307, x0
str r307, [r622]
ldr r308, [r622]
cmp r308, 0
bne main_lab140
b main_lab141

main_lab140:
ldr x0, =println
mov x1, 1
bl printf
mov r309, x0
b main_lab142

main_lab141:
ldr x0, =println
mov x1, 0
bl printf
mov r310, x0
b main_lab142

main_lab142:
mov x0, 17
bl malloc
mov r311, x0
mov r312, r311
str r312, [r627]
ldr r313, [r627]
mov x0, r313
bl returnstruct
mov r314, x0
str r314, [r628]
ldr r315, [r627]
ldr r316, [r628]
cmp r315, r316
cset r317, eq
cmp r317, 0
bne main_lab143
b main_lab144

main_lab143:
ldr x0, =println
mov x1, 1
bl printf
mov r318, x0
b main_lab145

main_lab144:
ldr x0, =println
mov x1, 0
bl printf
mov r319, x0
b main_lab145

main_lab145:
mov x0, 10
bl printgroup
str 0, [r621]
b main_returnLabel

main_returnLabel:
ldr r320, [r621]
mov x0, r320
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 160
ret

