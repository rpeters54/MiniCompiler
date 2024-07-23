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

mov x24, x0
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x4, x24, x11
mov x11, 0
str x11, [x4]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x4, x24, x11
mov x11, 0
str x11, [x4]
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
mov x4, 0
str x4, [x11]
mov x4, 3
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
mov x4, 0
str x4, [x11]
mov x4, 4
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
mov x4, 0
str x4, [x11]
mov x4, 5
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
mov x4, 0
str x4, [x11]
mov x4, 6
mov x11, 8
mul x11, x4, x11
add x4, x24, x11
mov x11, 0
str x11, [x4]
mov x11, 7
mov x4, 8
mul x11, x11, x4
add x4, x24, x11
mov x11, 0
str x11, [x4]
mov x11, 8
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
mov x4, 0
str x4, [x11]
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x24, x0
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 3
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
mov x11, 4
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
mov x4, 5
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 6
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
mov x4, 7
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x0, =print
mov x1, x11
bl printf
mov x11, x0
mov x11, 8
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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
mov x11, x0
ldr x0, =println
mov x1, 456
bl printf
mov x11, x0
ldr x0, =println
mov x1, 789
bl printf
mov x11, x0
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
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x6, x0
mov x24, x1
mov x11, x2
cmp x11, 1
cset x4, eq
cmp x4, 0
bne placePiece_lab0
b placePiece_lab1

placePiece_lab0:
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
str x24, [x11]
b placePiece_returnLabel

placePiece_lab1:
cmp x11, 2
cset x4, eq
cmp x4, 0
bne placePiece_lab2
b placePiece_lab3

placePiece_lab2:
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
str x24, [x11]
b placePiece_returnLabel

placePiece_lab3:
cmp x11, 3
cset x4, eq
cmp x4, 0
bne placePiece_lab4
b placePiece_lab5

placePiece_lab4:
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
str x24, [x11]
b placePiece_returnLabel

placePiece_lab5:
cmp x11, 4
cset x4, eq
cmp x4, 0
bne placePiece_lab6
b placePiece_lab7

placePiece_lab6:
mov x4, 3
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
str x24, [x11]
b placePiece_returnLabel

placePiece_lab7:
cmp x11, 5
cset x4, eq
cmp x4, 0
bne placePiece_lab8
b placePiece_lab9

placePiece_lab8:
mov x11, 4
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
str x24, [x11]
b placePiece_returnLabel

placePiece_lab9:
cmp x11, 6
cset x4, eq
cmp x4, 0
bne placePiece_lab10
b placePiece_lab11

placePiece_lab10:
mov x4, 5
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
str x24, [x11]
b placePiece_returnLabel

placePiece_lab11:
cmp x11, 7
cset x4, eq
cmp x4, 0
bne placePiece_lab12
b placePiece_lab13

placePiece_lab12:
mov x4, 6
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
str x24, [x11]
b placePiece_returnLabel

placePiece_lab13:
cmp x11, 8
cset x4, eq
cmp x4, 0
bne placePiece_lab14
b placePiece_lab15

placePiece_lab14:
mov x11, 7
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
str x24, [x11]
b placePiece_returnLabel

placePiece_lab15:
cmp x11, 9
cset x11, eq
cmp x11, 0
bne placePiece_lab16
b placePiece_returnLabel

placePiece_lab16:
mov x11, 8
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
str x24, [x11]
b placePiece_returnLabel

placePiece_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x4, x0
mov x11, 0
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x24, x4
bne checkWinner_lab0
b checkWinner_lab8

checkWinner_lab0:
mov x11, 1
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x24, x4
bne checkWinner_lab1
b checkWinner_lab8

checkWinner_lab1:
mov x11, 2
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x24, x4
mov x11, 0
bne checkWinner_returnLabel
b checkWinner_lab8

checkWinner_lab8:
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x6, x24
bne checkWinner_lab9
b checkWinner_lab17

checkWinner_lab9:
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x6, x24
bne checkWinner_lab10
b checkWinner_lab17

checkWinner_lab10:
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x6, x24
mov x11, 1
bne checkWinner_returnLabel
b checkWinner_lab17

checkWinner_lab17:
mov x4, 3
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x24, x6
bne checkWinner_lab18
b checkWinner_lab26

checkWinner_lab18:
mov x11, 4
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x24, x6
bne checkWinner_lab19
b checkWinner_lab26

checkWinner_lab19:
mov x11, 5
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x24, x6
mov x11, 0
bne checkWinner_returnLabel
b checkWinner_lab26

checkWinner_lab26:
mov x4, 3
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x4, x24
bne checkWinner_lab27
b checkWinner_lab35

checkWinner_lab27:
mov x11, 4
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x4, x24
bne checkWinner_lab28
b checkWinner_lab35

checkWinner_lab28:
mov x4, 5
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x4, x24
mov x11, 1
bne checkWinner_returnLabel
b checkWinner_lab35

checkWinner_lab35:
mov x11, 6
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x24, x4
bne checkWinner_lab36
b checkWinner_lab44

checkWinner_lab36:
mov x24, 7
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x24, x4
bne checkWinner_lab37
b checkWinner_lab44

checkWinner_lab37:
mov x11, 8
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x24, x4
mov x11, 0
bne checkWinner_returnLabel
b checkWinner_lab44

checkWinner_lab44:
mov x11, 6
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x6, x24
bne checkWinner_lab45
b checkWinner_lab53

checkWinner_lab45:
mov x4, 7
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x6, x24
bne checkWinner_lab46
b checkWinner_lab53

checkWinner_lab46:
mov x4, 8
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x6, x24
mov x11, 1
bne checkWinner_returnLabel
b checkWinner_lab53

checkWinner_lab53:
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x9, x6
bne checkWinner_lab54
b checkWinner_lab62

checkWinner_lab54:
mov x11, 3
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x9, x6
bne checkWinner_lab55
b checkWinner_lab62

checkWinner_lab55:
mov x4, 6
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x9, x6
mov x11, 0
bne checkWinner_returnLabel
b checkWinner_lab62

checkWinner_lab62:
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x24, x9
bne checkWinner_lab63
b checkWinner_lab71

checkWinner_lab63:
mov x11, 3
mov x4, 8
mul x11, x11, x4
add x11, x9, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x24, x9
bne checkWinner_lab64
b checkWinner_lab71

checkWinner_lab64:
mov x11, 6
mov x4, 8
mul x11, x11, x4
add x11, x9, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x24, x9
mov x11, 1
bne checkWinner_returnLabel
b checkWinner_lab71

checkWinner_lab71:
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x6, x24
bne checkWinner_lab72
b checkWinner_lab80

checkWinner_lab72:
mov x11, 4
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x6, x24
bne checkWinner_lab73
b checkWinner_lab80

checkWinner_lab73:
mov x4, 7
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x6, x24
mov x11, 0
bne checkWinner_returnLabel
b checkWinner_lab80

checkWinner_lab80:
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x24, x6
bne checkWinner_lab81
b checkWinner_lab89

checkWinner_lab81:
mov x4, 4
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x24, x6
bne checkWinner_lab82
b checkWinner_lab89

checkWinner_lab82:
mov x11, 7
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x24, x6
mov x11, 1
bne checkWinner_returnLabel
b checkWinner_lab89

checkWinner_lab89:
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x4, x24
bne checkWinner_lab90
b checkWinner_lab98

checkWinner_lab90:
mov x4, 5
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x4, x24
bne checkWinner_lab91
b checkWinner_lab98

checkWinner_lab91:
mov x11, 8
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x4, x24
mov x11, 0
bne checkWinner_returnLabel
b checkWinner_lab98

checkWinner_lab98:
mov x24, 2
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x11, -1
bne checkWinner_lab99
b checkWinner_returnLabel

checkWinner_lab99:
mov x11, 5
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x11, -1
bne checkWinner_lab100
b checkWinner_returnLabel

checkWinner_lab100:
mov x24, 8
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 2
cset x11, eq
cmp x11, 0
mov x11, 1
bne checkWinner_returnLabel
b checkWinner_lab102

checkWinner_lab102:
mov x11, -1
b checkWinner_returnLabel

checkWinner_returnLabel:
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

mov x0, 72
bl malloc
mov x11, x0
mov x22, x11
mov x0, x22
bl cleanBoard
mov x11, 1
cmp x11, 0
mov x25, 0
mov x24, 0
mov x27, x22
mov x6, -1
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov x25, x4
mov x24, x22
mov x27, x27
b main_lab0

main_lab0:
mov x0, x27
bl printBoard
cmp x24, 0
cset x11, eq
cmp x11, 0
bne main_lab1
b main_lab2

main_lab1:
mov x11, 1
add x24, x24, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
mov x0, x27
mov x1, 1
mov x2, x11
bl placePiece
mov x22, x24
mov x27, x27
mov x24, x25
b main_lab3

main_lab2:
mov x11, 1
sub x24, x24, x11
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
mov x0, x27
mov x1, 2
mov x2, x11
bl placePiece
mov x22, x24
mov x27, x27
mov x24, x25
b main_lab3

main_lab3:
mov x0, x27
bl checkWinner
mov x6, x0
mov x11, 1
add x4, x24, x11
cmp x6, 0
cset x11, lt
cmp x4, 8
cset x24, ne
and x11, x11, x24
cmp x11, 0
mov x6, x6
bne inter_main_lab0
b main_returnLabel

main_returnLabel:
mov x11, 1
add x11, x6, x11
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

