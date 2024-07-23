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
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
str x11, [x24]
ldr x0, =print
mov x1, 1
bl printf
mov x11, x0
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x0, =print
mov x1, 1
bl printf
mov x11, x0
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x0, =print
mov x1, 1
bl printf
mov x11, x0
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b printgroup_returnLabel

printgroup_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
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

mov x4, x0
add x24, sp, 96
add x11, sp, 104
str x4, [x11]
ldr x4, [x11]
ldr x11, =counter
str x4, [x11]
mov x11, 1
str x11, [x24]
b setcounter_returnLabel

setcounter_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global takealltypes
takealltypes:
takealltypes_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x6, x0
mov x11, x1
mov x4, x2
add x24, sp, 96
add x25, sp, 104
add x22, sp, 112
str x6, [x24]
str x11, [x25]
str x4, [x22]
ldr x11, [x24]
cmp x11, 3
cset x11, eq
cmp x11, 0
bne takealltypes_lab0
b takealltypes_lab1

takealltypes_lab0:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b takealltypes_lab2

takealltypes_lab1:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b takealltypes_lab2

takealltypes_lab2:
ldr x11, [x25]
cmp x11, 0
bne takealltypes_lab3
b takealltypes_lab4

takealltypes_lab3:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b takealltypes_lab5

takealltypes_lab4:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b takealltypes_lab5

takealltypes_lab5:
ldr x4, [x22]
mov x11, 1
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x11, [x11]
cmp x11, 0
bne takealltypes_lab6
b takealltypes_lab7

takealltypes_lab6:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b takealltypes_lab8

takealltypes_lab7:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b takealltypes_lab8

takealltypes_lab8:
b takealltypes_returnLabel

takealltypes_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
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

mov x21, x0
mov x10, x1
mov x9, x2
mov x11, x3
mov x4, x4
mov x2, x5
mov x14, x6
mov x5, x7
add x23, sp, 96
add x0, sp, 104
add x12, sp, 112
add x6, sp, 120
add x24, sp, 128
add x27, sp, 136
add x25, sp, 144
add x22, sp, 152
str x21, [x23]
str x10, [x0]
str x9, [x12]
str x11, [x6]
str x4, [x24]
str x2, [x27]
str x14, [x25]
str x5, [x22]
ldr x11, [x24]
cmp x11, 5
cset x11, eq
cmp x11, 0
bne tonofargs_lab0
b tonofargs_lab1

tonofargs_lab0:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b tonofargs_lab2

tonofargs_lab1:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x11, [x24]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b tonofargs_lab2

tonofargs_lab2:
ldr x11, [x27]
cmp x11, 6
cset x11, eq
cmp x11, 0
bne tonofargs_lab3
b tonofargs_lab4

tonofargs_lab3:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b tonofargs_lab5

tonofargs_lab4:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x11, [x27]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b tonofargs_lab5

tonofargs_lab5:
ldr x11, [x25]
cmp x11, 7
cset x11, eq
cmp x11, 0
bne tonofargs_lab6
b tonofargs_lab7

tonofargs_lab6:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b tonofargs_lab8

tonofargs_lab7:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x11, [x25]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b tonofargs_lab8

tonofargs_lab8:
ldr x11, [x22]
cmp x11, 8
cset x11, eq
cmp x11, 0
bne tonofargs_lab9
b tonofargs_lab10

tonofargs_lab9:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b tonofargs_lab11

tonofargs_lab10:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x11, [x22]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b tonofargs_lab11

tonofargs_lab11:
b tonofargs_returnLabel

tonofargs_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x24, x0
add x4, sp, 96
add x11, sp, 104
str x24, [x11]
ldr x11, [x11]
str x11, [x4]
b returnint_returnLabel

returnint_returnLabel:
ldr x11, [x4]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x11, x0
add x24, sp, 96
add x4, sp, 104
str x11, [x4]
ldr x11, [x4]
str x11, [x24]
b returnbool_returnLabel

returnbool_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
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

mov x24, x0
add x11, sp, 96
add x4, sp, 104
str x24, [x4]
ldr x4, [x4]
str x4, [x11]
b returnstruct_returnLabel

returnstruct_returnLabel:
ldr x11, [x11]
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

add x21, sp, 96
add x22, sp, 104
add x24, sp, 112
add x27, sp, 120
add x25, sp, 128
add x23, sp, 136
add x26, sp, 144
add x28, sp, 152
mov x11, 0
ldr x4, =counter
str x11, [x4]
mov x0, 1
bl printgroup
mov x11, 0
str x11, [x22]
mov x11, 0
str x11, [x24]
ldr x4, [x22]
ldr x11, [x24]
and x11, x4, x11
cmp x11, 0
bne main_lab0
b main_lab1

main_lab0:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab2

main_lab1:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab2

main_lab2:
mov x11, 1
str x11, [x22]
mov x11, 0
str x11, [x24]
ldr x4, [x22]
ldr x11, [x24]
and x11, x4, x11
cmp x11, 0
bne main_lab3
b main_lab4

main_lab3:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab5

main_lab4:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab5

main_lab5:
mov x11, 0
str x11, [x22]
mov x11, 1
str x11, [x24]
ldr x11, [x22]
ldr x4, [x24]
and x11, x11, x4
cmp x11, 0
bne main_lab6
b main_lab7

main_lab6:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab8

main_lab7:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab8

main_lab8:
mov x11, 1
str x11, [x22]
mov x11, 1
str x11, [x24]
ldr x11, [x22]
ldr x4, [x24]
and x11, x11, x4
cmp x11, 0
bne main_lab9
b main_lab10

main_lab9:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab11

main_lab10:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab11

main_lab11:
mov x4, 0
ldr x11, =counter
str x4, [x11]
mov x0, 2
bl printgroup
mov x11, 1
str x11, [x22]
mov x11, 1
str x11, [x24]
ldr x11, [x22]
ldr x4, [x24]
orr x11, x11, x4
cmp x11, 0
bne main_lab12
b main_lab13

main_lab12:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab14

main_lab13:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab14

main_lab14:
mov x11, 1
str x11, [x22]
mov x11, 0
str x11, [x24]
ldr x11, [x22]
ldr x4, [x24]
orr x11, x11, x4
cmp x11, 0
bne main_lab15
b main_lab16

main_lab15:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab17

main_lab16:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab17

main_lab17:
mov x11, 0
str x11, [x22]
mov x11, 1
str x11, [x24]
ldr x11, [x22]
ldr x4, [x24]
orr x11, x11, x4
cmp x11, 0
bne main_lab18
b main_lab19

main_lab18:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab20

main_lab19:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab20

main_lab20:
mov x11, 0
str x11, [x22]
mov x11, 0
str x11, [x24]
ldr x11, [x22]
ldr x4, [x24]
orr x11, x11, x4
cmp x11, 0
bne main_lab21
b main_lab22

main_lab21:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab23

main_lab22:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab23

main_lab23:
mov x0, 3
bl printgroup
mov x11, 42
cmp x11, 1
cset x11, gt
cmp x11, 0
bne main_lab24
b main_lab25

main_lab24:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab26

main_lab25:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab26

main_lab26:
mov x11, 42
cmp x11, 1
cset x11, ge
cmp x11, 0
bne main_lab27
b main_lab28

main_lab27:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab29

main_lab28:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab29

main_lab29:
mov x11, 42
cmp x11, 1
cset x11, lt
cmp x11, 0
bne main_lab30
b main_lab31

main_lab30:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab32

main_lab31:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab32

main_lab32:
mov x11, 42
cmp x11, 1
cset x11, le
cmp x11, 0
bne main_lab33
b main_lab34

main_lab33:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab35

main_lab34:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab35

main_lab35:
mov x11, 42
cmp x11, 1
cset x11, eq
cmp x11, 0
bne main_lab36
b main_lab37

main_lab36:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab38

main_lab37:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab38

main_lab38:
mov x11, 42
cmp x11, 1
cset x11, ne
cmp x11, 0
bne main_lab39
b main_lab40

main_lab39:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab41

main_lab40:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab41

main_lab41:
mov x11, 1
cmp x11, 0
bne main_lab42
b main_lab43

main_lab42:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab44

main_lab43:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab44

main_lab44:
mov x11, 1
mov x4, 1
eor x11, x11, x4
cmp x11, 0
bne main_lab45
b main_lab46

main_lab45:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab47

main_lab46:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab47

main_lab47:
mov x11, 0
cmp x11, 0
bne main_lab48
b main_lab49

main_lab48:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab50

main_lab49:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab50

main_lab50:
mov x4, 1
mov x11, 0
eor x11, x4, x11
cmp x11, 0
bne main_lab51
b main_lab52

main_lab51:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab53

main_lab52:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab53

main_lab53:
mov x11, 1
mov x4, 0
eor x11, x11, x4
cmp x11, 0
bne main_lab54
b main_lab55

main_lab54:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab56

main_lab55:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab56

main_lab56:
mov x0, 4
bl printgroup
mov x4, 2
mov x11, 3
add x11, x4, x11
cmp x11, 5
cset x11, eq
cmp x11, 0
bne main_lab57
b main_lab58

main_lab57:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab59

main_lab58:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
mov x11, 2
mov x4, 3
add x11, x11, x4
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b main_lab59

main_lab59:
mov x11, 2
mov x4, 3
mul x11, x11, x4
cmp x11, 6
cset x11, eq
cmp x11, 0
bne main_lab60
b main_lab61

main_lab60:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab62

main_lab61:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
mov x11, 2
mov x4, 3
mul x11, x11, x4
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b main_lab62

main_lab62:
mov x11, 3
mov x4, 2
sub x11, x11, x4
cmp x11, 1
cset x11, eq
cmp x11, 0
bne main_lab63
b main_lab64

main_lab63:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab65

main_lab64:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
mov x4, 3
mov x11, 2
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b main_lab65

main_lab65:
mov x4, 6
mov x11, 3
sdiv x11, x4, x11
cmp x11, 2
cset x11, eq
cmp x11, 0
bne main_lab66
b main_lab67

main_lab66:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab68

main_lab67:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
mov x4, 6
mov x11, 3
sdiv x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b main_lab68

main_lab68:
mov x11, 0
mov x4, 6
sub x11, x11, x4
cmp x11, 0
cset x11, lt
cmp x11, 0
bne main_lab69
b main_lab70

main_lab69:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab71

main_lab70:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab71

main_lab71:
mov x0, 5
bl printgroup
mov x11, 42
str x11, [x27]
ldr x11, [x27]
cmp x11, 42
cset x11, eq
cmp x11, 0
bne main_lab72
b main_lab73

main_lab72:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab74

main_lab73:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab74

main_lab74:
mov x11, 3
str x11, [x27]
mov x11, 2
str x11, [x25]
ldr x4, [x27]
ldr x11, [x25]
add x11, x4, x11
str x11, [x23]
ldr x11, [x23]
cmp x11, 5
cset x11, eq
cmp x11, 0
bne main_lab75
b main_lab76

main_lab75:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab77

main_lab76:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab77

main_lab77:
mov x11, 1
str x11, [x22]
ldr x11, [x22]
cmp x11, 0
bne main_lab78
b main_lab79

main_lab78:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab80

main_lab79:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab80

main_lab80:
ldr x4, [x22]
mov x11, 1
eor x11, x11, x4
cmp x11, 0
bne main_lab81
b main_lab82

main_lab81:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab83

main_lab82:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab83

main_lab83:
mov x11, 0
str x11, [x22]
ldr x11, [x22]
cmp x11, 0
bne main_lab84
b main_lab85

main_lab84:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab86

main_lab85:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab86

main_lab86:
ldr x4, [x22]
mov x11, 1
eor x11, x11, x4
cmp x11, 0
bne main_lab87
b main_lab88

main_lab87:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab89

main_lab88:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab89

main_lab89:
ldr x11, [x22]
cmp x11, 0
bne main_lab90
b main_lab91

main_lab90:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab92

main_lab91:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab92

main_lab92:
mov x0, 6
bl printgroup
mov x11, 0
str x11, [x27]
ldr x11, [x27]
cmp x11, 5
cset x11, lt
cmp x11, 0
bne main_lab93
b main_lab97

main_lab93:
ldr x11, [x27]
cmp x11, 5
cset x11, ge
cmp x11, 0
bne main_lab94
b main_lab95

main_lab94:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab96

main_lab95:
b main_lab96

main_lab96:
ldr x4, [x27]
mov x11, 5
add x11, x4, x11
str x11, [x27]
ldr x11, [x27]
cmp x11, 5
cset x11, lt
cmp x11, 0
bne main_lab93
b main_lab97

main_lab97:
ldr x11, [x27]
cmp x11, 5
cset x11, eq
cmp x11, 0
bne main_lab98
b main_lab99

main_lab98:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab100

main_lab99:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x11, [x27]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b main_lab100

main_lab100:
mov x0, 7
bl printgroup
mov x0, 17
bl malloc
mov x11, x0
mov x11, x11
str x11, [x26]
ldr x11, [x26]
mov x24, 0
mov x4, 8
mul x4, x24, x4
add x4, x11, x4
mov x11, 42
str x11, [x4]
ldr x24, [x26]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x4, x24, x11
mov x11, 1
str x11, [x4]
ldr x24, [x26]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
cmp x11, 42
cset x11, eq
cmp x11, 0
bne main_lab101
b main_lab102

main_lab101:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab103

main_lab102:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x24, [x26]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b main_lab103

main_lab103:
ldr x11, [x26]
mov x24, 1
mov x4, 8
mul x4, x24, x4
add x11, x11, x4
ldr x11, [x11]
cmp x11, 0
bne main_lab104
b main_lab105

main_lab104:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab106

main_lab105:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab106

main_lab106:
ldr x4, [x26]
mov x24, 2
mov x11, 8
mul x11, x24, x11
add x24, x4, x11
mov x0, 17
bl malloc
mov x11, x0
mov x11, x11
str x11, [x24]
ldr x4, [x26]
mov x11, 2
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x4, [x11]
mov x11, 0
mov x24, 8
mul x11, x11, x24
add x4, x4, x11
mov x11, 13
str x11, [x4]
ldr x11, [x26]
mov x4, 2
mov x24, 8
mul x4, x4, x24
add x11, x11, x4
ldr x24, [x11]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x4, x24, x11
mov x11, 0
str x11, [x4]
ldr x24, [x26]
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x4, [x11]
mov x11, 0
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x11, [x11]
cmp x11, 13
cset x11, eq
cmp x11, 0
bne main_lab107
b main_lab108

main_lab107:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab109

main_lab108:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x11, [x26]
mov x4, 2
mov x24, 8
mul x4, x4, x24
add x11, x11, x4
ldr x24, [x11]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b main_lab109

main_lab109:
ldr x24, [x26]
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x4, 1
mov x24, 8
mul x4, x4, x24
add x11, x11, x4
ldr x11, [x11]
mov x4, 1
eor x11, x4, x11
cmp x11, 0
bne main_lab110
b main_lab111

main_lab110:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab112

main_lab111:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab112

main_lab112:
ldr x4, [x26]
ldr x11, [x26]
cmp x4, x11
cset x11, eq
cmp x11, 0
bne main_lab113
b main_lab114

main_lab113:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab115

main_lab114:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab115

main_lab115:
ldr x6, [x26]
ldr x4, [x26]
mov x24, 2
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
cmp x6, x11
cset x11, ne
cmp x11, 0
bne main_lab116
b main_lab117

main_lab116:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab118

main_lab117:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab118

main_lab118:
ldr x24, [x26]
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x11, x11
mov x0, x11
bl free
ldr x11, [x26]
mov x11, x11
mov x0, x11
bl free
mov x0, 8
bl printgroup
mov x11, 7
ldr x4, =gi1
str x11, [x4]
ldr x11, =gi1
ldr x11, [x11]
cmp x11, 7
cset x11, eq
cmp x11, 0
bne main_lab119
b main_lab120

main_lab119:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab121

main_lab120:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x11, =gi1
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b main_lab121

main_lab121:
mov x4, 1
ldr x11, =gb1
str x4, [x11]
ldr x11, =gb1
ldr x11, [x11]
cmp x11, 0
bne main_lab122
b main_lab123

main_lab122:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab124

main_lab123:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab124

main_lab124:
mov x0, 17
bl malloc
mov x11, x0
mov x11, x11
ldr x4, =gs1
str x11, [x4]
ldr x4, =gs1
ldr x4, [x4]
mov x11, 0
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
mov x4, 34
str x4, [x11]
ldr x24, =gs1
ldr x24, [x24]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x4, x24, x11
mov x11, 0
str x11, [x4]
ldr x4, =gs1
ldr x4, [x4]
mov x24, 0
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
cmp x11, 34
cset x11, eq
cmp x11, 0
bne main_lab125
b main_lab126

main_lab125:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab127

main_lab126:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x11, =gs1
ldr x11, [x11]
mov x24, 0
mov x4, 8
mul x4, x24, x4
add x11, x11, x4
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b main_lab127

main_lab127:
ldr x4, =gs1
ldr x4, [x4]
mov x11, 1
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x4, [x11]
mov x11, 1
eor x11, x11, x4
cmp x11, 0
bne main_lab128
b main_lab129

main_lab128:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab130

main_lab129:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab130

main_lab130:
ldr x4, =gs1
ldr x4, [x4]
mov x11, 2
mov x24, 8
mul x11, x11, x24
add x24, x4, x11
mov x0, 17
bl malloc
mov x11, x0
mov x11, x11
str x11, [x24]
ldr x24, =gs1
ldr x24, [x24]
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
mov x24, 0
mov x4, 8
mul x4, x24, x4
add x4, x11, x4
mov x11, 16
str x11, [x4]
ldr x4, =gs1
ldr x4, [x4]
mov x24, 2
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
mov x4, 1
mov x24, 8
mul x4, x4, x24
add x11, x11, x4
mov x4, 1
str x4, [x11]
ldr x4, =gs1
ldr x4, [x4]
mov x11, 2
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x24, [x11]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
cmp x11, 16
cset x11, eq
cmp x11, 0
bne main_lab131
b main_lab132

main_lab131:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab133

main_lab132:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x11, =gs1
ldr x11, [x11]
mov x4, 2
mov x24, 8
mul x4, x4, x24
add x11, x11, x4
ldr x24, [x11]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b main_lab133

main_lab133:
ldr x4, =gs1
ldr x4, [x4]
mov x24, 2
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x24, [x11]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
cmp x11, 0
bne main_lab134
b main_lab135

main_lab134:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab136

main_lab135:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab136

main_lab136:
ldr x11, =gs1
ldr x11, [x11]
mov x4, 2
mov x24, 8
mul x4, x4, x24
add x11, x11, x4
ldr x11, [x11]
mov x11, x11
mov x0, x11
bl free
ldr x11, =gs1
ldr x11, [x11]
mov x11, x11
mov x0, x11
bl free
mov x0, 9
bl printgroup
mov x0, 17
bl malloc
mov x11, x0
mov x11, x11
str x11, [x26]
ldr x4, [x26]
mov x24, 1
mov x11, 8
mul x11, x24, x11
add x4, x4, x11
mov x11, 1
str x11, [x4]
ldr x11, [x26]
mov x0, 3
mov x1, 1
mov x2, x11
bl takealltypes
ldr x0, =println
mov x1, 2
bl printf
mov x11, x0
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
mov x11, x0
mov x0, 3
bl returnint
mov x11, x0
str x11, [x27]
ldr x11, [x27]
cmp x11, 3
cset x11, eq
cmp x11, 0
bne main_lab137
b main_lab138

main_lab137:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab139

main_lab138:
ldr x0, =print
mov x1, 0
bl printf
mov x11, x0
ldr x11, [x27]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
b main_lab139

main_lab139:
mov x0, 1
bl returnbool
mov x11, x0
str x11, [x22]
ldr x11, [x22]
cmp x11, 0
bne main_lab140
b main_lab141

main_lab140:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab142

main_lab141:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab142

main_lab142:
mov x0, 17
bl malloc
mov x11, x0
mov x11, x11
str x11, [x26]
ldr x11, [x26]
mov x0, x11
bl returnstruct
mov x11, x0
str x11, [x28]
ldr x4, [x26]
ldr x11, [x28]
cmp x4, x11
cset x11, eq
cmp x11, 0
bne main_lab143
b main_lab144

main_lab143:
ldr x0, =println
mov x1, 1
bl printf
mov x11, x0
b main_lab145

main_lab144:
ldr x0, =println
mov x1, 0
bl printf
mov x11, x0
b main_lab145

main_lab145:
mov x0, 10
bl printgroup
mov x11, 0
str x11, [x21]
b main_returnLabel

main_returnLabel:
ldr x11, [x21]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 160
ret

