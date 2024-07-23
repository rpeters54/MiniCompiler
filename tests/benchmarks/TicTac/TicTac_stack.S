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
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
str x11, [x24]
ldr x6, [x24]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x4, x6, x11
mov x11, 0
str x11, [x4]
ldr x6, [x24]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
mov x4, 0
str x4, [x11]
ldr x6, [x24]
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x4, x6, x11
mov x11, 0
str x11, [x4]
ldr x11, [x24]
mov x4, 3
mov x6, 8
mul x4, x4, x6
add x4, x11, x4
mov x11, 0
str x11, [x4]
ldr x6, [x24]
mov x11, 4
mov x4, 8
mul x11, x11, x4
add x4, x6, x11
mov x11, 0
str x11, [x4]
ldr x11, [x24]
mov x6, 5
mov x4, 8
mul x4, x6, x4
add x4, x11, x4
mov x11, 0
str x11, [x4]
ldr x11, [x24]
mov x6, 6
mov x4, 8
mul x4, x6, x4
add x4, x11, x4
mov x11, 0
str x11, [x4]
ldr x4, [x24]
mov x6, 7
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
mov x4, 0
str x4, [x11]
ldr x4, [x24]
mov x11, 8
mov x24, 8
mul x11, x11, x24
add x4, x4, x11
mov x11, 0
str x11, [x4]
b cleanBoard_returnLabel

cleanBoard_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global printBoard
printBoard:
printBoard_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
str x11, [x24]
ldr x11, [x24]
mov x4, 0
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x4, 1
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
ldr x6, [x24]
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x6, 3
mov x4, 8
mul x4, x6, x4
add x11, x11, x4
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
ldr x4, [x24]
mov x11, 4
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
ldr x6, [x24]
mov x4, 5
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x4, 6
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x4, 7
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
ldr x24, [x24]
mov x4, 8
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b printBoard_returnLabel

printBoard_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
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
mov x11, x0
ldr x0, =println
mov x1, 456
bl printf
mov x11, x0
ldr x0, =println
mov x1, 789
bl printf
mov x11, x0
b printMoveBoard_returnLabel

printMoveBoard_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global placePiece
placePiece:
placePiece_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x6, x0
mov x24, x1
mov x11, x2
add x22, sp, 96
add x9, sp, 104
add x4, sp, 112
str x6, [x22]
str x24, [x9]
str x11, [x4]
ldr x11, [x4]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne placePiece_lab0
b placePiece_lab1

placePiece_lab0:
ldr x24, [x22]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x4, [x9]
str x4, [x11]
b placePiece_lab26

placePiece_lab1:
ldr x11, [x4]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne placePiece_lab2
b placePiece_lab3

placePiece_lab2:
ldr x4, [x22]
mov x11, 1
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x4, [x9]
str x4, [x11]
b placePiece_lab25

placePiece_lab3:
ldr x11, [x4]
cmp x11, 3
cset x11, eq
cmp x11, 0
bne placePiece_lab4
b placePiece_lab5

placePiece_lab4:
ldr x24, [x22]
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x4, x24, x11
ldr x11, [x9]
str x11, [x4]
b placePiece_lab24

placePiece_lab5:
ldr x11, [x4]
cmp x11, 4
cset x11, eq
cmp x11, 0
bne placePiece_lab6
b placePiece_lab7

placePiece_lab6:
ldr x24, [x22]
mov x11, 3
mov x4, 8
mul x11, x11, x4
add x4, x24, x11
ldr x11, [x9]
str x11, [x4]
b placePiece_lab23

placePiece_lab7:
ldr x11, [x4]
cmp x11, 5
cset x11, eq
cmp x11, 0
bne placePiece_lab8
b placePiece_lab9

placePiece_lab8:
ldr x4, [x22]
mov x24, 4
mov x11, 8
mul x11, x24, x11
add x4, x4, x11
ldr x11, [x9]
str x11, [x4]
b placePiece_lab22

placePiece_lab9:
ldr x11, [x4]
cmp x11, 6
cset x11, eq
cmp x11, 0
bne placePiece_lab10
b placePiece_lab11

placePiece_lab10:
ldr x24, [x22]
mov x11, 5
mov x4, 8
mul x11, x11, x4
add x4, x24, x11
ldr x11, [x9]
str x11, [x4]
b placePiece_lab21

placePiece_lab11:
ldr x11, [x4]
cmp x11, 7
cset x11, eq
cmp x11, 0
bne placePiece_lab12
b placePiece_lab13

placePiece_lab12:
ldr x11, [x22]
mov x24, 6
mov x4, 8
mul x4, x24, x4
add x11, x11, x4
ldr x4, [x9]
str x4, [x11]
b placePiece_lab20

placePiece_lab13:
ldr x11, [x4]
cmp x11, 8
cset x11, eq
cmp x11, 0
bne placePiece_lab14
b placePiece_lab15

placePiece_lab14:
ldr x24, [x22]
mov x11, 7
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x4, [x9]
str x4, [x11]
b placePiece_lab19

placePiece_lab15:
ldr x11, [x4]
cmp x11, 9
cset x11, eq
cmp x11, 0
bne placePiece_lab16
b placePiece_lab17

placePiece_lab16:
ldr x24, [x22]
mov x4, 8
mov x11, 8
mul x11, x4, x11
add x4, x24, x11
ldr x11, [x9]
str x11, [x4]
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
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
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

mov x11, x0
add x24, sp, 96
add x6, sp, 104
str x11, [x6]
ldr x9, [x6]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x9, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab0
b checkWinner_lab7

checkWinner_lab0:
ldr x11, [x6]
mov x4, 1
mov x9, 8
mul x4, x4, x9
add x11, x11, x4
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab1
b checkWinner_lab5

checkWinner_lab1:
ldr x4, [x6]
mov x9, 2
mov x11, 8
mul x11, x9, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab2
b checkWinner_lab3

checkWinner_lab2:
mov x11, 0
str x11, [x24]
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
ldr x4, [x6]
mov x9, 0
mov x11, 8
mul x11, x9, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab9
b checkWinner_lab16

checkWinner_lab9:
ldr x9, [x6]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab10
b checkWinner_lab14

checkWinner_lab10:
ldr x9, [x6]
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab11
b checkWinner_lab12

checkWinner_lab11:
mov x11, 1
str x11, [x24]
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
ldr x9, [x6]
mov x11, 3
mov x4, 8
mul x11, x11, x4
add x11, x9, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab18
b checkWinner_lab25

checkWinner_lab18:
ldr x4, [x6]
mov x9, 4
mov x11, 8
mul x11, x9, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab19
b checkWinner_lab23

checkWinner_lab19:
ldr x4, [x6]
mov x9, 5
mov x11, 8
mul x11, x9, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab20
b checkWinner_lab21

checkWinner_lab20:
mov x11, 0
str x11, [x24]
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
ldr x4, [x6]
mov x11, 3
mov x9, 8
mul x11, x11, x9
add x11, x4, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab27
b checkWinner_lab34

checkWinner_lab27:
ldr x9, [x6]
mov x11, 4
mov x4, 8
mul x11, x11, x4
add x11, x9, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab28
b checkWinner_lab32

checkWinner_lab28:
ldr x9, [x6]
mov x11, 5
mov x4, 8
mul x11, x11, x4
add x11, x9, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab29
b checkWinner_lab30

checkWinner_lab29:
mov x11, 1
str x11, [x24]
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
ldr x4, [x6]
mov x9, 6
mov x11, 8
mul x11, x9, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab36
b checkWinner_lab43

checkWinner_lab36:
ldr x11, [x6]
mov x9, 7
mov x4, 8
mul x4, x9, x4
add x11, x11, x4
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab37
b checkWinner_lab41

checkWinner_lab37:
ldr x9, [x6]
mov x4, 8
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab38
b checkWinner_lab39

checkWinner_lab38:
mov x11, 0
str x11, [x24]
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
ldr x4, [x6]
mov x9, 6
mov x11, 8
mul x11, x9, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab45
b checkWinner_lab52

checkWinner_lab45:
ldr x9, [x6]
mov x4, 7
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab46
b checkWinner_lab50

checkWinner_lab46:
ldr x4, [x6]
mov x11, 8
mov x9, 8
mul x11, x11, x9
add x11, x4, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab47
b checkWinner_lab48

checkWinner_lab47:
mov x11, 1
str x11, [x24]
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
ldr x4, [x6]
mov x11, 0
mov x9, 8
mul x11, x11, x9
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab54
b checkWinner_lab61

checkWinner_lab54:
ldr x9, [x6]
mov x11, 3
mov x4, 8
mul x11, x11, x4
add x11, x9, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab55
b checkWinner_lab59

checkWinner_lab55:
ldr x11, [x6]
mov x9, 6
mov x4, 8
mul x4, x9, x4
add x11, x11, x4
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab56
b checkWinner_lab57

checkWinner_lab56:
mov x11, 0
str x11, [x24]
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
ldr x4, [x6]
mov x11, 0
mov x9, 8
mul x11, x11, x9
add x11, x4, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab63
b checkWinner_lab70

checkWinner_lab63:
ldr x11, [x6]
mov x4, 3
mov x9, 8
mul x4, x4, x9
add x11, x11, x4
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab64
b checkWinner_lab68

checkWinner_lab64:
ldr x11, [x6]
mov x9, 6
mov x4, 8
mul x4, x9, x4
add x11, x11, x4
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab65
b checkWinner_lab66

checkWinner_lab65:
mov x11, 1
str x11, [x24]
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
ldr x11, [x6]
mov x4, 1
mov x9, 8
mul x4, x4, x9
add x11, x11, x4
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab72
b checkWinner_lab79

checkWinner_lab72:
ldr x9, [x6]
mov x4, 4
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab73
b checkWinner_lab77

checkWinner_lab73:
ldr x4, [x6]
mov x9, 7
mov x11, 8
mul x11, x9, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab74
b checkWinner_lab75

checkWinner_lab74:
mov x11, 0
str x11, [x24]
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
ldr x4, [x6]
mov x9, 1
mov x11, 8
mul x11, x9, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab81
b checkWinner_lab88

checkWinner_lab81:
ldr x9, [x6]
mov x4, 4
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab82
b checkWinner_lab86

checkWinner_lab82:
ldr x9, [x6]
mov x4, 7
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab83
b checkWinner_lab84

checkWinner_lab83:
mov x11, 1
str x11, [x24]
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
ldr x11, [x6]
mov x4, 2
mov x9, 8
mul x4, x4, x9
add x11, x11, x4
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab90
b checkWinner_lab97

checkWinner_lab90:
ldr x11, [x6]
mov x9, 5
mov x4, 8
mul x4, x9, x4
add x11, x11, x4
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab91
b checkWinner_lab95

checkWinner_lab91:
ldr x4, [x6]
mov x11, 8
mov x9, 8
mul x11, x11, x9
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
bne checkWinner_lab92
b checkWinner_lab93

checkWinner_lab92:
mov x11, 0
str x11, [x24]
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
ldr x4, [x6]
mov x9, 2
mov x11, 8
mul x11, x9, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab99
b checkWinner_lab106

checkWinner_lab99:
ldr x11, [x6]
mov x9, 5
mov x4, 8
mul x4, x9, x4
add x11, x11, x4
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab100
b checkWinner_lab104

checkWinner_lab100:
ldr x11, [x6]
mov x4, 8
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
bne checkWinner_lab101
b checkWinner_lab102

checkWinner_lab101:
mov x11, 1
str x11, [x24]
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
mov x11, 0
mov x4, 1
sub x11, x11, x4
str x11, [x24]
b checkWinner_returnLabel

checkWinner_returnLabel:
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
stp x29, x30, [sp, -160]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

add x24, sp, 96
add x27, sp, 104
add x23, sp, 112
add x21, sp, 120
add x22, sp, 128
add x25, sp, 136
add x26, sp, 144
mov x11, 0
str x11, [x25]
mov x11, 0
str x11, [x27]
mov x11, 0
str x11, [x23]
mov x11, 0
str x11, [x21]
mov x4, 0
mov x11, 1
sub x11, x4, x11
str x11, [x22]
mov x0, 72
bl malloc
mov x11, x0
mov x11, x11
str x11, [x26]
ldr x11, [x26]
mov x0, x11
bl cleanBoard
ldr x11, [x22]
cmp x11, 0
cset x11, lt
ldr x4, [x25]
cmp x4, 8
cset x4, ne
and x11, x11, x4
cmp x11, 0
bne main_lab0
b main_lab4

main_lab0:
ldr x11, [x26]
mov x0, x11
bl printBoard
ldr x11, [x27]
cmp x11, 0
cset x11, eq
cmp x11, 0
bne main_lab1
b main_lab2

main_lab1:
ldr x4, [x27]
mov x11, 1
add x11, x4, x11
str x11, [x27]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x23]
ldr x11, [x26]
ldr x4, [x23]
mov x0, x11
mov x1, 1
mov x2, x4
bl placePiece
b main_lab3

main_lab2:
ldr x11, [x27]
mov x4, 1
sub x11, x11, x4
str x11, [x27]
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x21]
ldr x11, [x26]
ldr x4, [x21]
mov x0, x11
mov x1, 2
mov x2, x4
bl placePiece
b main_lab3

main_lab3:
ldr x11, [x26]
mov x0, x11
bl checkWinner
mov x11, x0
str x11, [x22]
ldr x11, [x25]
mov x4, 1
add x11, x11, x4
str x11, [x25]
ldr x11, [x22]
cmp x11, 0
cset x4, lt
ldr x11, [x25]
cmp x11, 8
cset x11, ne
and x11, x4, x11
cmp x11, 0
bne main_lab0
b main_lab4

main_lab4:
ldr x11, [x22]
mov x4, 1
add x11, x11, x4
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 0
str x11, [x24]
b main_returnLabel

main_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 160
ret

