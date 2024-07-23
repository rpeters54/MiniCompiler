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
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x22, x0
mov x6, x1
cmp x22, null
cset x11, eq
cmp x11, 0
mov x11, x6
bne concatLists_returnLabel
b concatLists_lab2

concatLists_lab2:
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
cmp x11, null
cset x11, ne
cmp x11, 0
mov x4, x22
mov x24, x22
mov x2, x6
mov x11, x22
bne concatLists_lab3
b concatLists_lab4

inter_concatLists_lab3:
mov x4, x9
b concatLists_lab3

concatLists_lab3:
mov x24, 1
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x9, [x11]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x9, x11
ldr x11, [x11]
cmp x11, null
cset x11, ne
cmp x11, 0
mov x24, x9
mov x2, x6
mov x11, x22
bne inter_concatLists_lab3
b concatLists_lab4

concatLists_lab4:
mov x6, 1
mov x4, 8
mul x4, x6, x4
add x4, x24, x4
str x2, [x4]
mov x11, x11
b concatLists_returnLabel

concatLists_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global add
add:
add_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
mov x22, x1
mov x0, 16
bl malloc
mov x11, x0
mov x4, x11
mov x6, 0
mov x11, 8
mul x11, x6, x11
add x11, x4, x11
str x22, [x11]
mov x11, 1
mov x6, 8
mul x11, x11, x6
add x11, x4, x11
str x24, [x11]
mov x0, x4
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global size
size:
size_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x4, x0
cmp x4, null
cset x11, eq
cmp x11, 0
mov x11, 0
bne size_returnLabel
b size_lab2

size_lab2:
mov x24, 1
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
ldr x11, [x11]
mov x0, x11
bl size
mov x4, x0
mov x11, 1
add x11, x11, x4
mov x11, x11
b size_returnLabel

size_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global get
get:
get_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x6, x0
mov x11, x1
cmp x11, 0
cset x4, eq
cmp x4, 0
bne get_lab0
b get_lab2

get_lab0:
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x6, x11
ldr x11, [x11]
mov x11, x11
b get_returnLabel

get_lab2:
mov x4, 1
mov x24, 8
mul x4, x4, x24
add x4, x6, x4
ldr x4, [x4]
mov x24, 1
sub x11, x11, x24
mov x0, x4
mov x1, x11
bl get
mov x11, x0
mov x11, x11
b get_returnLabel

get_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global pop
pop:
pop_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global printList
printList:
printList_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
cmp x24, null
cset x11, ne
cmp x11, 0
bne printList_lab0
b printList_returnLabel

printList_lab0:
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
bl printList
b printList_returnLabel

printList_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global treeprint
treeprint:
treeprint_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
cmp x24, null
cset x11, ne
cmp x11, 0
bne treeprint_lab0
b treeprint_returnLabel

treeprint_lab0:
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
bl treeprint
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
bl treeprint
b treeprint_returnLabel

treeprint_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global freeList
freeList:
freeList_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
cmp x24, null
cset x11, ne
cmp x11, 0
bne freeList_lab0
b freeList_returnLabel

freeList_lab0:
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
bl freeList
mov x11, x24
mov x0, x11
bl free
b freeList_returnLabel

freeList_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global freeTree
freeTree:
freeTree_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
cmp x24, null
cset x11, eq
mov x4, 1
eor x11, x4, x11
cmp x11, 0
bne freeTree_lab0
b freeTree_returnLabel

freeTree_lab0:
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
bl freeTree
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
bl freeTree
mov x11, x24
mov x0, x11
bl free
b freeTree_returnLabel

freeTree_returnLabel:
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global postOrder
postOrder:
postOrder_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x22, x0
cmp x22, null
cset x11, ne
cmp x11, 0
mov x11, null
bne postOrder_lab0
b postOrder_returnLabel

postOrder_lab0:
mov x0, 16
bl malloc
mov x11, x0
mov x25, x11
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x4, x25, x11
mov x11, 0
mov x24, 8
mul x11, x11, x24
add x11, x22, x11
ldr x11, [x11]
str x11, [x4]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x4, x25, x11
mov x11, null
str x11, [x4]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
mov x0, x11
bl postOrder
mov x24, x0
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
mov x0, x11
bl postOrder
mov x11, x0
mov x0, x24
mov x1, x11
bl concatLists
mov x11, x0
mov x0, x11
mov x1, x25
bl concatLists
mov x11, x0
mov x11, x11
b postOrder_returnLabel

postOrder_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global treeadd
treeadd:
treeadd_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
mov x22, x1
cmp x24, null
cset x11, eq
cmp x11, 0
bne treeadd_lab0
b treeadd_lab2

treeadd_lab0:
mov x0, 24
bl malloc
mov x11, x0
mov x4, x11
mov x24, 0
mov x11, 8
mul x11, x24, x11
add x11, x4, x11
str x22, [x11]
mov x11, 1
mov x24, 8
mul x11, x11, x24
add x24, x4, x11
mov x11, null
str x11, [x24]
mov x24, 2
mov x11, 8
mul x11, x24, x11
add x24, x4, x11
mov x11, null
str x11, [x24]
mov x11, x4
b treeadd_returnLabel

treeadd_lab2:
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x11, [x11]
cmp x22, x11
cset x11, lt
cmp x11, 0
bne treeadd_lab3
b treeadd_lab4

treeadd_lab3:
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x25, x24, x11
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
mov x1, x22
bl treeadd
mov x11, x0
str x11, [x25]
mov x11, x24
b treeadd_lab5

treeadd_lab4:
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x25, x24, x11
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x24, x11
ldr x11, [x11]
mov x0, x11
mov x1, x22
bl treeadd
mov x11, x0
str x11, [x25]
mov x11, x24
b treeadd_lab5

treeadd_lab5:
mov x11, x11
b treeadd_returnLabel

treeadd_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global quickSort
quickSort:
quickSort_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x25, x0
mov x0, x25
bl size
mov x11, x0
cmp x11, 1
cset x11, le
cmp x11, 0
mov x11, x25
bne quickSort_returnLabel
b quickSort_lab2

quickSort_lab2:
mov x0, x25
mov x1, 0
bl get
mov x24, x0
mov x0, x25
bl size
mov x11, x0
mov x4, 1
sub x11, x11, x4
mov x0, x25
mov x1, x11
bl get
mov x11, x0
add x4, x24, x11
mov x11, 2
sdiv x22, x4, x11
cmp x25, null
cset x11, ne
cmp x11, 0
mov x23, x25
mov x27, 0
mov x24, x25
mov x11, x25
mov x21, null
mov x25, null
bne quickSort_lab3
b quickSort_lab7

inter_quickSort_lab3:
mov x23, x4
mov x27, x24
mov x24, x12
b quickSort_lab3

quickSort_lab3:
mov x0, x24
mov x1, x27
bl get
mov x11, x0
cmp x11, x22
cset x11, gt
cmp x11, 0
bne quickSort_lab4
b quickSort_lab5

quickSort_lab4:
mov x0, x24
mov x1, x27
bl get
mov x11, x0
mov x0, null
mov x1, x11
bl add
mov x11, x0
mov x2, x27
mov x6, null
mov x12, x24
mov x9, x11
mov x24, x23
b quickSort_lab6

quickSort_lab5:
mov x0, x24
mov x1, x27
bl get
mov x11, x0
mov x0, null
mov x1, x11
bl add
mov x11, x0
mov x2, x27
mov x6, x11
mov x12, x24
mov x9, null
mov x24, x23
b quickSort_lab6

quickSort_lab6:
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x24, x11
ldr x4, [x11]
mov x11, 1
add x24, x2, x11
cmp x4, null
cset x11, ne
cmp x11, 0
mov x11, x12
mov x21, x6
mov x25, x9
bne inter_quickSort_lab3
b quickSort_lab7

quickSort_lab7:
mov x0, x11
bl freeList
mov x0, x21
bl quickSort
mov x24, x0
mov x0, x25
bl quickSort
mov x11, x0
mov x0, x24
mov x1, x11
bl concatLists
mov x11, x0
mov x11, x11
b quickSort_returnLabel

quickSort_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global quickSortMain
quickSortMain:
quickSortMain_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x24, x0
mov x0, x24
bl printList
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x24
bl printList
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x24
bl printList
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, null
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global treesearch
treesearch:
treesearch_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x22, x0
mov x24, x1
ldr x0, =println
mov x1, -1
bl printf
mov x11, x0
cmp x22, null
cset x11, ne
cmp x11, 0
mov x11, 0
bne treesearch_lab0
b treesearch_returnLabel

treesearch_lab0:
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
cmp x11, x24
cset x11, eq
cmp x11, 0
mov x11, 1
bne treesearch_returnLabel
b treesearch_lab3

treesearch_lab3:
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
ldr x11, [x11]
mov x0, x11
mov x1, x24
bl treesearch
mov x11, x0
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x11, 1
bne treesearch_returnLabel
b treesearch_lab6

treesearch_lab6:
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
ldr x11, [x11]
mov x0, x11
mov x1, x24
bl treesearch
mov x11, x0
cmp x11, 1
cset x11, eq
cmp x11, 0
mov x11, 1
bne treesearch_returnLabel
b treesearch_lab8

treesearch_lab8:
mov x11, 0
b treesearch_returnLabel

treesearch_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global inOrder
inOrder:
inOrder_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x22, x0
cmp x22, null
cset x11, ne
cmp x11, 0
mov x11, null
bne inOrder_lab0
b inOrder_returnLabel

inOrder_lab0:
mov x0, 16
bl malloc
mov x11, x0
mov x24, x11
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x6, x24, x11
mov x4, 0
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
ldr x11, [x11]
str x11, [x6]
mov x11, 1
mov x4, 8
mul x11, x11, x4
add x4, x24, x11
mov x11, null
str x11, [x4]
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
ldr x11, [x11]
mov x0, x11
bl inOrder
mov x25, x0
mov x11, 2
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
mov x0, x11
bl inOrder
mov x11, x0
mov x0, x24
mov x1, x11
bl concatLists
mov x11, x0
mov x0, x25
mov x1, x11
bl concatLists
mov x11, x0
mov x11, x11
b inOrder_returnLabel

inOrder_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global bintreesearch
bintreesearch:
bintreesearch_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x22, x0
mov x24, x1
ldr x0, =println
mov x1, -1
bl printf
mov x11, x0
cmp x22, null
cset x11, ne
cmp x11, 0
mov x11, 0
bne bintreesearch_lab0
b bintreesearch_returnLabel

bintreesearch_lab0:
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
cmp x11, x24
cset x11, eq
cmp x11, 0
mov x11, 1
bne bintreesearch_returnLabel
b bintreesearch_lab3

bintreesearch_lab3:
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
cmp x24, x11
cset x11, lt
cmp x11, 0
bne bintreesearch_lab4
b bintreesearch_lab5

bintreesearch_lab4:
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
ldr x11, [x11]
mov x0, x11
mov x1, x24
bl bintreesearch
mov x11, x0
mov x11, x11
b bintreesearch_returnLabel

bintreesearch_lab5:
mov x4, 2
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
ldr x11, [x11]
mov x0, x11
mov x1, x24
bl bintreesearch
mov x11, x0
mov x11, x11
b bintreesearch_returnLabel

bintreesearch_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global buildTree
buildTree:
buildTree_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x25, x0
mov x0, x25
bl size
mov x11, x0
mov x4, 0
cmp x4, x11
cset x11, lt
cmp x11, 0
mov x22, null
mov x24, 0
mov x11, null
bne buildTree_lab0
b buildTree_returnLabel

inter_buildTree_lab0:
mov x22, x22
mov x24, x24
b buildTree_lab0

buildTree_lab0:
mov x0, x25
mov x1, x24
bl get
mov x11, x0
mov x0, x22
mov x1, x11
bl treeadd
mov x22, x0
mov x11, 1
add x24, x24, x11
mov x0, x25
bl size
mov x11, x0
cmp x24, x11
cset x11, lt
cmp x11, 0
mov x11, x22
bne inter_buildTree_lab0
b buildTree_returnLabel

buildTree_returnLabel:
mov x0, x11
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global treeMain
treeMain:
treeMain_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x11, x0
mov x0, x11
bl buildTree
mov x22, x0
mov x0, x22
bl treeprint
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
bl inOrder
mov x24, x0
mov x0, x24
bl printList
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x24
bl freeList
mov x0, x22
bl postOrder
mov x24, x0
mov x0, x24
bl printList
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x24
bl freeList
mov x0, x22
mov x1, 0
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, 10
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, -2
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, 2
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, 3
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, 9
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, 1
bl treesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, 0
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, 10
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, -2
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, 2
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, 3
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, 9
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
mov x1, 1
bl bintreesearch
mov x11, x0
ldr x0, =println
mov x1, x11
bl printf
mov x11, x0
ldr x0, =println
mov x1, -999
bl printf
mov x11, x0
mov x0, x22
bl freeTree
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

.global myCopy
myCopy:
myCopy_prologue:
stp x29, x30, [sp, -96]!
stp x19, x20, [sp, 16]
stp x21, x22, [sp, 32]
stp x23, x24, [sp, 48]
stp x25, x26, [sp, 64]
stp x27, x28, [sp, 80]

mov x22, x0
cmp x22, null
cset x11, eq
cmp x11, 0
mov x11, null
bne myCopy_returnLabel
b myCopy_lab2

myCopy_lab2:
mov x11, 0
mov x4, 8
mul x11, x11, x4
add x11, x22, x11
ldr x11, [x11]
mov x0, null
mov x1, x11
bl add
mov x24, x0
mov x4, 1
mov x11, 8
mul x11, x4, x11
add x11, x22, x11
ldr x11, [x11]
mov x0, x11
bl myCopy
mov x11, x0
mov x0, x24
mov x1, x11
bl concatLists
mov x11, x0
mov x11, x11
b myCopy_returnLabel

myCopy_returnLabel:
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

mov x11, 1
cmp x11, 0
mov x27, null
mov x22, 0
mov x24, null
mov x25, null
mov x4, null
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov x27, x27
mov x22, x11
b main_lab0

main_lab0:
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov x11, x0
ldr x11, =read_scratch
ldr x11, [x11]
mov x0, x27
mov x1, x11
bl add
mov x27, x0
mov x0, x27
bl myCopy
mov x24, x0
mov x0, x27
bl myCopy
mov x25, x0
mov x0, x24
bl quickSortMain
mov x11, x0
mov x0, x11
bl freeList
mov x0, x25
bl treeMain
mov x11, 1
add x11, x22, x11
cmp x11, 10
cset x4, lt
cmp x4, 0
mov x24, x24
mov x25, x25
mov x4, x27
bne inter_main_lab0
b main_returnLabel

main_returnLabel:
mov x0, x4
bl freeList
mov x0, x24
bl freeList
mov x0, x25
bl freeList
mov x0, 0
ldp x27, x28, [sp, 80]
ldp x25, x26, [sp, 64]
ldp x23, x24, [sp, 48]
ldp x21, x22, [sp, 32]
ldp x19, x20, [sp, 16]
ldp x29, x30, [sp], 96
ret

