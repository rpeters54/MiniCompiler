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
.global a
a:
    .xword 0x0
.global b
b:
    .xword 0x0
.global i
i:
    .xword 0x0

.text
.global concatLists
concatLists:
concatLists_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
mov x11, x1
add x9, sp, 96
add x4, sp, 104
add x22, sp, 112
add x2, sp, 120
str x24, [x4]
str x11, [x22]
ldr x11, [x4]
str x11, [x2]
ldr x11, [x4]
cmp x11, null
cset x11, eq
cmp x11, 0
bne concatLists_lab0
b concatLists_lab1

concatLists_lab0:
ldr x11, [x22]
str x11, [x9]
b concatLists_returnLabel

concatLists_lab1:
b concatLists_lab2

concatLists_lab2:
ldr x6, [x2]
mov x24, 1
mov x11, 8
mul x11, x24, x11
add x11, x6, x11
ldr x11, [x11]
cmp x11, null
cset x11, ne
cmp x11, 0
bne concatLists_lab3
b concatLists_lab4

concatLists_lab3:
ldr x6, [x2]
mov x11, 1
mov x24, 8
mul x11, x11, x24
add x11, x6, x11
ldr x11, [x11]
str x11, [x2]
ldr x11, [x2]
mov x6, 1
mov x24, 8
mul x24, x6, x24
add x11, x11, x24
ldr x11, [x11]
cmp x11, null
cset x11, ne
cmp x11, 0
bne concatLists_lab3
b concatLists_lab4

concatLists_lab4:
ldr x24, [x2]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x11, x24, x11
ldr x24, [x22]
str x24, [x11]
ldr x11, [x4]
str x11, [x9]
b concatLists_returnLabel

concatLists_returnLabel:
ldr x11, [x9]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global add
add:
add_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
mov x11, x1
add x24, sp, 96
add x22, sp, 104
add x27, sp, 112
add x25, sp, 120
str x4, [x22]
str x11, [x27]
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x25]
ldr x6, [x25]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x4, x6, x11
ldr x11, [x27]
str x11, [x4]
ldr x11, [x25]
mov x6, 1
mov x4, 8
mul x4, x6, x4
add x4, x11, x4
ldr x11, [x22]
str x11, [x4]
ldr x11, [x25]
str x11, [x24]
b add_returnLabel

add_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global size
size:
size_prologue:
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
cmp x11, null
cset x11, eq
cmp x11, 0
bne size_lab0
b size_lab1

size_lab0:
mov x11, 0
str x11, [x24]
b size_returnLabel

size_lab1:
b size_lab2

size_lab2:
ldr x11, [x4]
mov x6, 1
mov x4, 8
mul x4, x6, x4
add x11, x11, x4
ldr x11, [x11]
mov x0, x11
bl size
mov x11, x0
mov x4, 1
add x11, x4, x11
str x11, [x24]
b size_returnLabel

size_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global get
get:
get_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x9, x0
mov x4, x1
add x24, sp, 96
add x6, sp, 104
add x11, sp, 112
str x9, [x6]
str x4, [x11]
ldr x4, [x11]
cmp x4, 0
cset x4, eq
cmp x4, 0
bne get_lab0
b get_lab1

get_lab0:
ldr x6, [x6]
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
str x11, [x24]
b get_returnLabel

get_lab1:
b get_lab2

get_lab2:
ldr x9, [x6]
mov x4, 1
mov x6, 8
mul x4, x4, x6
add x4, x9, x4
ldr x4, [x4]
ldr x6, [x11]
mov x11, 1
sub x11, x6, x11
mov x0, x4
mov x1, x11
bl get
mov x11, x0
str x11, [x24]
b get_returnLabel

get_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global pop
pop:
pop_prologue:
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
ldr x9, [x4]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x11, x9, x11
ldr x11, [x11]
str x11, [x4]
ldr x11, [x4]
str x11, [x24]
b pop_returnLabel

pop_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global printList
printList:
printList_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x22, sp, 96
str x11, [x22]
ldr x11, [x22]
cmp x11, null
cset x11, ne
cmp x11, 0
bne printList_lab0
b printList_lab1

printList_lab0:
ldr x11, [x22]
mov x4, 0
mov x24, 8
mul x4, x4, x24
add x11, x11, x4
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x24, [x22]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
bl printList
b printList_lab2

printList_lab1:
b printList_lab2

printList_lab2:
b printList_returnLabel

printList_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global treeprint
treeprint:
treeprint_prologue:
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
cmp x11, null
cset x11, ne
cmp x11, 0
bne treeprint_lab0
b treeprint_lab1

treeprint_lab0:
ldr x4, [x24]
mov x11, 1
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x11, [x11]
mov x0, x11
bl treeprint
ldr x6, [x24]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x4, [x24]
mov x11, 2
mov x24, 8
mul x11, x11, x24
add x11, x4, x11
ldr x11, [x11]
mov x0, x11
bl treeprint
b treeprint_lab2

treeprint_lab1:
b treeprint_lab2

treeprint_lab2:
b treeprint_returnLabel

treeprint_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global freeList
freeList:
freeList_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x22, sp, 96
str x11, [x22]
ldr x11, [x22]
cmp x11, null
cset x11, ne
cmp x11, 0
bne freeList_lab0
b freeList_lab1

freeList_lab0:
ldr x24, [x22]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
bl freeList
ldr x11, [x22]
mov x11, x11
mov x0, x11
bl free
b freeList_lab2

freeList_lab1:
b freeList_lab2

freeList_lab2:
b freeList_returnLabel

freeList_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global freeTree
freeTree:
freeTree_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x22, sp, 96
str x11, [x22]
ldr x11, [x22]
cmp x11, null
cset x11, eq
mov x4, 1
eor x11, x4, x11
cmp x11, 0
bne freeTree_lab0
b freeTree_lab1

freeTree_lab0:
ldr x4, [x22]
mov x24, 1
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
mov x0, x11
bl freeTree
ldr x24, [x22]
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
bl freeTree
ldr x11, [x22]
mov x11, x11
mov x0, x11
bl free
b freeTree_lab2

freeTree_lab1:
b freeTree_lab2

freeTree_lab2:
b freeTree_returnLabel

freeTree_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global postOrder
postOrder:
postOrder_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
add x22, sp, 104
add x25, sp, 112
str x11, [x22]
ldr x11, [x22]
cmp x11, null
cset x11, ne
cmp x11, 0
bne postOrder_lab0
b postOrder_lab1

postOrder_lab0:
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x25]
ldr x6, [x25]
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x4, x6, x11
ldr x6, [x22]
mov x11, 0
mov x9, 8
mul x11, x11, x9
add x11, x6, x11
ldr x11, [x11]
str x11, [x4]
ldr x4, [x25]
mov x11, 1
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
mov x4, null
str x4, [x11]
ldr x4, [x22]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
mov x0, x11
bl postOrder
mov x27, x0
ldr x11, [x22]
mov x4, 2
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x11, [x11]
mov x0, x11
bl postOrder
mov x11, x0
mov x0, x27
mov x1, x11
bl concatLists
mov x4, x0
ldr x11, [x25]
mov x0, x4
mov x1, x11
bl concatLists
mov x11, x0
str x11, [x24]
b postOrder_returnLabel

postOrder_lab1:
b postOrder_lab2

postOrder_lab2:
mov x11, null
str x11, [x24]
b postOrder_returnLabel

postOrder_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global treeadd
treeadd:
treeadd_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x4, x1
add x22, sp, 96
add x27, sp, 104
add x25, sp, 112
add x24, sp, 120
str x11, [x27]
str x4, [x25]
ldr x11, [x27]
cmp x11, null
cset x11, eq
cmp x11, 0
bne treeadd_lab0
b treeadd_lab1

treeadd_lab0:
mov x0, 24
bl malloc
mov x11, x0
mov x11, x11
str x11, [x24]
ldr x4, [x24]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x4, x4, x11
ldr x11, [x25]
str x11, [x4]
ldr x4, [x24]
mov x6, 1
mov x11, 8
mul x11, x6, x11
add x4, x4, x11
mov x11, null
str x11, [x4]
ldr x4, [x24]
mov x6, 2
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
mov x4, null
str x4, [x11]
ldr x11, [x24]
str x11, [x22]
b treeadd_returnLabel

treeadd_lab1:
b treeadd_lab2

treeadd_lab2:
ldr x4, [x25]
ldr x6, [x27]
mov x11, 0
mov x24, 8
mul x11, x11, x24
add x11, x6, x11
ldr x11, [x11]
cmp x4, x11
cset x11, lt
cmp x11, 0
bne treeadd_lab3
b treeadd_lab4

treeadd_lab3:
ldr x24, [x27]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x23, x24, x11
ldr x24, [x27]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x4, [x25]
mov x0, x11
mov x1, x4
bl treeadd
mov x11, x0
str x11, [x23]
b treeadd_lab5

treeadd_lab4:
ldr x11, [x27]
mov x24, 2
mov x4, 8
mul x4, x24, x4
add x24, x11, x4
ldr x4, [x27]
mov x11, 2
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
ldr x4, [x11]
ldr x11, [x25]
mov x0, x4
mov x1, x11
bl treeadd
mov x11, x0
str x11, [x24]
b treeadd_lab5

treeadd_lab5:
ldr x11, [x27]
str x11, [x22]
b treeadd_returnLabel

treeadd_returnLabel:
ldr x11, [x22]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global quickSort
quickSort:
quickSort_prologue:
stp x29, x30, [sp, -160]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x25, sp, 96
add x23, sp, 104
add x26, sp, 112
add x22, sp, 120
add x24, sp, 128
add x27, sp, 136
add x21, sp, 144
str x11, [x23]
mov x11, null
str x11, [x24]
mov x11, null
str x11, [x27]
ldr x11, [x23]
mov x0, x11
bl size
mov x11, x0
cmp x11, 1
cset x11, le
cmp x11, 0
bne quickSort_lab0
b quickSort_lab1

quickSort_lab0:
ldr x11, [x23]
str x11, [x25]
b quickSort_returnLabel

quickSort_lab1:
b quickSort_lab2

quickSort_lab2:
ldr x11, [x23]
mov x0, x11
mov x1, 0
bl get
mov x28, x0
ldr x19, [x23]
str x19, [sp, 160]
ldr x11, [x23]
mov x0, x11
bl size
mov x4, x0
mov x11, 1
sub x11, x4, x11
ldr x19, [sp, 160]
mov x0, x19
mov x1, x11
bl get
mov x11, x0
add x11, x28, x11
mov x4, 2
sdiv x11, x11, x4
str x11, [x26]
ldr x11, [x23]
str x11, [x21]
mov x11, 0
str x11, [x22]
ldr x11, [x21]
cmp x11, null
cset x11, ne
cmp x11, 0
bne quickSort_lab3
b quickSort_lab7

quickSort_lab3:
ldr x4, [x23]
ldr x11, [x22]
mov x0, x4
mov x1, x11
bl get
mov x4, x0
ldr x11, [x26]
cmp x4, x11
cset x11, gt
cmp x11, 0
bne quickSort_lab4
b quickSort_lab5

quickSort_lab4:
ldr x26, [x27]
ldr x4, [x23]
ldr x11, [x22]
mov x0, x4
mov x1, x11
bl get
mov x11, x0
mov x0, x26
mov x1, x11
bl add
mov x11, x0
str x11, [x27]
b quickSort_lab6

quickSort_lab5:
ldr x26, [x24]
ldr x4, [x23]
ldr x11, [x22]
mov x0, x4
mov x1, x11
bl get
mov x11, x0
mov x0, x26
mov x1, x11
bl add
mov x11, x0
str x11, [x24]
b quickSort_lab6

quickSort_lab6:
ldr x6, [x21]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
str x11, [x21]
ldr x4, [x22]
mov x11, 1
add x11, x4, x11
str x11, [x22]
ldr x11, [x21]
cmp x11, null
cset x11, ne
cmp x11, 0
bne quickSort_lab3
b quickSort_lab7

quickSort_lab7:
ldr x11, [x23]
mov x0, x11
bl freeList
ldr x11, [x24]
mov x0, x11
bl quickSort
mov x24, x0
ldr x11, [x27]
mov x0, x11
bl quickSort
mov x11, x0
mov x0, x24
mov x1, x11
bl concatLists
mov x11, x0
str x11, [x25]
b quickSort_returnLabel

quickSort_returnLabel:
ldr x11, [x25]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 160
ret

.global quickSortMain
quickSortMain:
quickSortMain_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x22, sp, 96
add x24, sp, 104
str x11, [x24]
ldr x11, [x24]
mov x0, x11
bl printList
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
bl printList
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
bl printList
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, null
str x11, [x22]
b quickSortMain_returnLabel

quickSortMain_returnLabel:
ldr x11, [x22]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 112
ret

.global treesearch
treesearch:
treesearch_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x4, x1
add x24, sp, 96
add x25, sp, 104
add x22, sp, 112
str x11, [x25]
str x4, [x22]
mov x4, 0
mov x11, 1
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x25]
cmp x11, null
cset x11, ne
cmp x11, 0
bne treesearch_lab0
b treesearch_lab9

treesearch_lab0:
ldr x4, [x25]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
ldr x4, [x22]
cmp x11, x4
cset x11, eq
cmp x11, 0
bne treesearch_lab1
b treesearch_lab2

treesearch_lab1:
mov x11, 1
str x11, [x24]
b treesearch_returnLabel

treesearch_lab2:
b treesearch_lab3

treesearch_lab3:
ldr x6, [x25]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
ldr x4, [x22]
mov x0, x11
mov x1, x4
bl treesearch
mov x11, x0
cmp x11, 1
cset x11, eq
cmp x11, 0
bne treesearch_lab4
b treesearch_lab5

treesearch_lab4:
mov x11, 1
str x11, [x24]
b treesearch_returnLabel

treesearch_lab5:
b treesearch_lab6

treesearch_lab6:
ldr x11, [x25]
mov x6, 2
mov x4, 8
mul x4, x6, x4
add x11, x11, x4
ldr x4, [x11]
ldr x11, [x22]
mov x0, x4
mov x1, x11
bl treesearch
mov x11, x0
cmp x11, 1
cset x11, eq
cmp x11, 0
bne treesearch_lab7
b treesearch_lab8

treesearch_lab7:
mov x11, 1
str x11, [x24]
b treesearch_returnLabel

treesearch_lab8:
mov x11, 0
str x11, [x24]
b treesearch_returnLabel

treesearch_lab9:
b treesearch_lab10

treesearch_lab10:
mov x11, 0
str x11, [x24]
b treesearch_returnLabel

treesearch_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global inOrder
inOrder:
inOrder_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x24, sp, 96
add x22, sp, 104
add x25, sp, 112
str x11, [x22]
ldr x11, [x22]
cmp x11, null
cset x11, ne
cmp x11, 0
bne inOrder_lab0
b inOrder_lab1

inOrder_lab0:
mov x0, 16
bl malloc
mov x11, x0
mov x11, x11
str x11, [x25]
ldr x4, [x25]
mov x11, 0
mov x6, 8
mul x11, x11, x6
add x9, x4, x11
ldr x4, [x22]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
str x11, [x9]
ldr x6, [x25]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x4, x6, x11
mov x11, null
str x11, [x4]
ldr x11, [x22]
mov x4, 1
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x11, [x11]
mov x0, x11
bl inOrder
mov x27, x0
ldr x25, [x25]
ldr x6, [x22]
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x6, x11
ldr x11, [x11]
mov x0, x11
bl inOrder
mov x11, x0
mov x0, x25
mov x1, x11
bl concatLists
mov x11, x0
mov x0, x27
mov x1, x11
bl concatLists
mov x11, x0
str x11, [x24]
b inOrder_returnLabel

inOrder_lab1:
mov x11, null
str x11, [x24]
b inOrder_returnLabel

inOrder_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global bintreesearch
bintreesearch:
bintreesearch_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
mov x11, x1
add x24, sp, 96
add x25, sp, 104
add x22, sp, 112
str x4, [x25]
str x11, [x22]
mov x11, 0
mov x4, 1
sub x11, x11, x4
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x25]
cmp x11, null
cset x11, ne
cmp x11, 0
bne bintreesearch_lab0
b bintreesearch_lab6

bintreesearch_lab0:
ldr x4, [x25]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x4, [x11]
ldr x11, [x22]
cmp x4, x11
cset x11, eq
cmp x11, 0
bne bintreesearch_lab1
b bintreesearch_lab2

bintreesearch_lab1:
mov x11, 1
str x11, [x24]
b bintreesearch_returnLabel

bintreesearch_lab2:
b bintreesearch_lab3

bintreesearch_lab3:
ldr x9, [x22]
ldr x4, [x25]
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
cmp x9, x11
cset x11, lt
cmp x11, 0
bne bintreesearch_lab4
b bintreesearch_lab5

bintreesearch_lab4:
ldr x11, [x25]
mov x4, 1
mov x6, 8
mul x4, x4, x6
add x11, x11, x4
ldr x11, [x11]
ldr x4, [x22]
mov x0, x11
mov x1, x4
bl bintreesearch
mov x11, x0
str x11, [x24]
b bintreesearch_returnLabel

bintreesearch_lab5:
ldr x4, [x25]
mov x6, 2
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
ldr x11, [x11]
ldr x4, [x22]
mov x0, x11
mov x1, x4
bl bintreesearch
mov x11, x0
str x11, [x24]
b bintreesearch_returnLabel

bintreesearch_lab6:
b bintreesearch_lab7

bintreesearch_lab7:
mov x11, 0
str x11, [x24]
b bintreesearch_returnLabel

bintreesearch_returnLabel:
ldr x11, [x24]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global buildTree
buildTree:
buildTree_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x25, sp, 96
add x27, sp, 104
add x23, sp, 112
add x22, sp, 120
str x11, [x27]
mov x11, null
str x11, [x22]
mov x11, 0
str x11, [x23]
ldr x24, [x23]
ldr x11, [x27]
mov x0, x11
bl size
mov x11, x0
cmp x24, x11
cset x11, lt
cmp x11, 0
bne buildTree_lab0
b buildTree_lab1

buildTree_lab0:
ldr x24, [x22]
ldr x4, [x27]
ldr x11, [x23]
mov x0, x4
mov x1, x11
bl get
mov x11, x0
mov x0, x24
mov x1, x11
bl treeadd
mov x11, x0
str x11, [x22]
ldr x11, [x23]
mov x4, 1
add x11, x11, x4
str x11, [x23]
ldr x24, [x23]
ldr x11, [x27]
mov x0, x11
bl size
mov x11, x0
cmp x24, x11
cset x11, lt
cmp x11, 0
bne buildTree_lab0
b buildTree_lab1

buildTree_lab1:
ldr x11, [x22]
str x11, [x25]
b buildTree_returnLabel

buildTree_returnLabel:
ldr x11, [x25]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global treeMain
treeMain:
treeMain_prologue:
stp x29, x30, [sp, -128]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
add x11, sp, 96
add x24, sp, 104
add x25, sp, 112
add x22, sp, 120
str x4, [x11]
ldr x11, [x11]
mov x0, x11
bl buildTree
mov x11, x0
str x11, [x24]
ldr x11, [x24]
mov x0, x11
bl treeprint
mov x11, 0
mov x4, 999
sub x11, x11, x4
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
bl inOrder
mov x11, x0
str x11, [x25]
ldr x11, [x25]
mov x0, x11
bl printList
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x25]
mov x0, x11
bl freeList
ldr x11, [x24]
mov x0, x11
bl postOrder
mov x11, x0
str x11, [x22]
ldr x11, [x22]
mov x0, x11
bl printList
mov x11, 0
mov x4, 999
sub x11, x11, x4
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x22]
mov x0, x11
bl freeList
ldr x11, [x24]
mov x0, x11
mov x1, 0
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 0
mov x4, 999
sub x11, x11, x4
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
mov x1, 10
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 0
mov x4, 999
sub x11, x11, x4
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x6, [x24]
mov x11, 0
mov x4, 2
sub x11, x11, x4
mov x0, x6
mov x1, x11
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 0
mov x4, 999
sub x11, x11, x4
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
mov x1, 2
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
mov x1, 3
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
mov x1, 9
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
mov x1, 1
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
mov x1, 0
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
mov x1, 10
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x6, [x24]
mov x4, 0
mov x11, 2
sub x11, x4, x11
mov x0, x6
mov x1, x11
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
mov x1, 2
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
mov x1, 3
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
mov x1, 9
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 0
mov x11, 999
sub x11, x4, x11
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
mov x1, 1
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x11, 0
mov x4, 999
sub x11, x11, x4
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x11, [x24]
mov x0, x11
bl freeTree
b treeMain_returnLabel

treeMain_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 128
ret

.global myCopy
myCopy:
myCopy_prologue:
stp x29, x30, [sp, -112]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
add x22, sp, 96
add x24, sp, 104
str x11, [x24]
ldr x11, [x24]
cmp x11, null
cset x11, eq
cmp x11, 0
bne myCopy_lab0
b myCopy_lab1

myCopy_lab0:
mov x11, null
str x11, [x22]
b myCopy_returnLabel

myCopy_lab1:
b myCopy_lab2

myCopy_lab2:
ldr x11, [x24]
mov x6, 0
mov x4, 8
mul x4, x6, x4
add x11, x11, x4
ldr x11, [x11]
mov x0, null
mov x1, x11
bl add
mov x25, x0
ldr x4, [x24]
mov x24, 1
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
mov x0, x11
bl myCopy
mov x11, x0
mov x0, x25
mov x1, x11
bl concatLists
mov x11, x0
str x11, [x22]
b myCopy_returnLabel

myCopy_returnLabel:
ldr x11, [x22]
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

add x25, sp, 96
add x21, sp, 104
add x26, sp, 112
add x23, sp, 120
add x24, sp, 128
add x22, sp, 136
add x27, sp, 144
mov x11, null
str x11, [x23]
mov x11, null
str x11, [x24]
mov x11, null
str x11, [x22]
mov x11, 0
str x11, [x21]
ldr x11, [x21]
cmp x11, 10
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab0:
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
str x11, [x26]
ldr x11, [x23]
ldr x4, [x26]
mov x0, x11
mov x1, x4
bl add
mov x11, x0
str x11, [x23]
ldr x11, [x23]
mov x0, x11
bl myCopy
mov x11, x0
str x11, [x24]
ldr x11, [x23]
mov x0, x11
bl myCopy
mov x11, x0
str x11, [x22]
ldr x11, [x24]
mov x0, x11
bl quickSortMain
mov x11, x0
str x11, [x27]
ldr x11, [x27]
mov x0, x11
bl freeList
ldr x11, [x22]
mov x0, x11
bl treeMain
ldr x4, [x21]
mov x11, 1
add x11, x4, x11
str x11, [x21]
ldr x11, [x21]
cmp x11, 10
cset x11, lt
cmp x11, 0
bne main_lab0
b main_lab1

main_lab1:
ldr x11, [x23]
mov x0, x11
bl freeList
ldr x11, [x24]
mov x0, x11
bl freeList
ldr x11, [x22]
mov x0, x11
bl freeList
mov x11, 0
str x11, [x25]
b main_returnLabel

main_returnLabel:
ldr x11, [x25]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 160
ret

