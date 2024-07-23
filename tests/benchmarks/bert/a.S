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

mov r0, x0
mov r1, x1
cmp r0, null
cset r2, eq
cmp r2, 0
mov r18, r1
bne concatLists_returnLabel
b concatLists_lab2

concatLists_lab2:
mov r23, 1
mov r24, 8
mul r22, r23, r24
add r5, r0, r22
ldr r6, [r5]
cmp r6, null
cset r7, ne
cmp r7, 0
mov r8, r0
mov r14, r0
mov r16, r1
mov r17, r0
bne concatLists_lab3
b concatLists_lab4

inter_concatLists_lab3:
mov r8, r10
b concatLists_lab3

concatLists_lab3:
mov r29, 1
mov r30, 8
mul r28, r29, r30
add r9, r8, r28
ldr r10, [r9]
mov r35, 1
mov r36, 8
mul r34, r35, r36
add r11, r10, r34
ldr r12, [r11]
cmp r12, null
cset r13, ne
cmp r13, 0
mov r14, r10
mov r16, r1
mov r17, r0
bne concatLists_lab3
b concatLists_lab4

concatLists_lab4:
mov r41, 1
mov r42, 8
mul r40, r41, r42
add r15, r14, r40
str r16, [r15]
mov r18, r17
b concatLists_returnLabel

concatLists_returnLabel:
mov x0, r18
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
mov r1, x1
mov x0, 16
bl malloc
mov r2, x0
mov r3, r2
mov r11, 0
mov r12, 8
mul r10, r11, r12
add r4, r3, r10
str r1, [r4]
mov r17, 1
mov r18, 8
mul r16, r17, r18
add r5, r3, r16
str r0, [r5]
mov x0, r3
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
cmp r0, null
cset r1, eq
cmp r1, 0
mov r7, 0
bne size_returnLabel
b size_lab2

size_lab2:
mov r12, 1
mov r13, 8
mul r11, r12, r13
add r3, r0, r11
ldr r4, [r3]
mov x0, r4
bl size
mov r5, x0
mov r15, 1
add r6, r15, r5
mov r7, r6
b size_returnLabel

size_returnLabel:
mov x0, r7
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
mov r1, x1
cmp r1, 0
cset r2, eq
cmp r2, 0
bne get_lab0
b get_lab2

get_lab0:
mov r17, 0
mov r18, 8
mul r16, r17, r18
add r4, r0, r16
ldr r5, [r4]
mov r12, r5
b get_returnLabel

get_lab2:
mov r23, 1
mov r24, 8
mul r22, r23, r24
add r7, r0, r22
ldr r8, [r7]
mov r26, 1
sub r10, r1, r26
mov x0, r8
mov x1, r10
bl get
mov r11, x0
mov r12, r11
b get_returnLabel

get_returnLabel:
mov x0, r12
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
mov r8, 1
mov r9, 8
mul r7, r8, r9
add r1, r0, r7
ldr r2, [r1]
mov x0, r2
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
cmp r0, null
cset r1, ne
cmp r1, 0
bne printList_lab0
b printList_returnLabel

printList_lab0:
mov r13, 0
mov r14, 8
mul r12, r13, r14
add r3, r0, r12
ldr r4, [r3]
ldr x0, =println
mov x1, r4
bl printf
mov r5, x0
mov r19, 1
mov r20, 8
mul r18, r19, r20
add r6, r0, r18
ldr r7, [r6]
mov x0, r7
bl printList
b printList_returnLabel

printList_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
cmp r0, null
cset r1, ne
cmp r1, 0
bne treeprint_lab0
b treeprint_returnLabel

treeprint_lab0:
mov r15, 1
mov r16, 8
mul r14, r15, r16
add r3, r0, r14
ldr r4, [r3]
mov x0, r4
bl treeprint
mov r21, 0
mov r22, 8
mul r20, r21, r22
add r5, r0, r20
ldr r6, [r5]
ldr x0, =println
mov x1, r6
bl printf
mov r7, x0
mov r27, 2
mov r28, 8
mul r26, r27, r28
add r8, r0, r26
ldr r9, [r8]
mov x0, r9
bl treeprint
b treeprint_returnLabel

treeprint_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
cmp r0, null
cset r1, ne
cmp r1, 0
bne freeList_lab0
b freeList_returnLabel

freeList_lab0:
mov r11, 1
mov r12, 8
mul r10, r11, r12
add r3, r0, r10
ldr r4, [r3]
mov x0, r4
bl freeList
b freeList_returnLabel

freeList_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
cmp r0, null
cset r1, eq
mov r11, 1
xor r2, r11, r1
cmp r2, 0
bne freeTree_lab0
b freeTree_returnLabel

freeTree_lab0:
mov r16, 1
mov r17, 8
mul r15, r16, r17
add r4, r0, r15
ldr r5, [r4]
mov x0, r5
bl freeTree
mov r22, 2
mov r23, 8
mul r21, r22, r23
add r6, r0, r21
ldr r7, [r6]
mov x0, r7
bl freeTree
b freeTree_returnLabel

freeTree_returnLabel:
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
cmp r0, null
cset r1, ne
cmp r1, 0
mov r17, null
bne postOrder_lab0
b postOrder_returnLabel

postOrder_lab0:
mov x0, 16
bl malloc
mov r2, x0
mov r3, r2
mov r22, 0
mov r23, 8
mul r21, r22, r23
add r4, r3, r21
mov r28, 0
mov r29, 8
mul r27, r28, r29
add r6, r0, r27
ldr r7, [r6]
str r7, [r4]
mov r34, 1
mov r35, 8
mul r33, r34, r35
add r8, r3, r33
str null, [r8]
mov r40, 1
mov r41, 8
mul r39, r40, r41
add r9, r0, r39
ldr r10, [r9]
mov x0, r10
bl postOrder
mov r11, x0
mov r46, 2
mov r47, 8
mul r45, r46, r47
add r12, r0, r45
ldr r13, [r12]
mov x0, r13
bl postOrder
mov r14, x0
mov x0, r11
mov x1, r14
bl concatLists
mov r15, x0
mov x0, r15
mov x1, r3
bl concatLists
mov r16, x0
mov r17, r16
b postOrder_returnLabel

postOrder_returnLabel:
mov x0, r17
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
mov r1, x1
cmp r0, null
cset r2, eq
cmp r2, 0
bne treeadd_lab0
b treeadd_lab2

treeadd_lab0:
mov x0, 24
bl malloc
mov r3, x0
mov r4, r3
mov r33, 0
mov r34, 8
mul r32, r33, r34
add r5, r4, r32
str r1, [r5]
mov r39, 1
mov r40, 8
mul r38, r39, r40
add r7, r4, r38
str null, [r7]
mov r45, 2
mov r46, 8
mul r44, r45, r46
add r8, r4, r44
str null, [r8]
mov r28, r4
b treeadd_returnLabel

treeadd_lab2:
mov r51, 0
mov r52, 8
mul r50, r51, r52
add r11, r0, r50
ldr r12, [r11]
cmp r1, r12
cset r13, lt
cmp r13, 0
bne treeadd_lab3
b treeadd_lab4

treeadd_lab3:
mov r57, 1
mov r58, 8
mul r56, r57, r58
add r15, r0, r56
mov r63, 1
mov r64, 8
mul r62, r63, r64
add r16, r0, r62
ldr r17, [r16]
mov x0, r17
mov x1, r1
bl treeadd
mov r19, x0
str r19, [r15]
mov r27, r0
b treeadd_lab5

treeadd_lab4:
mov r69, 2
mov r70, 8
mul r68, r69, r70
add r21, r0, r68
mov r75, 2
mov r76, 8
mul r74, r75, r76
add r22, r0, r74
ldr r23, [r22]
mov x0, r23
mov x1, r1
bl treeadd
mov r25, x0
str r25, [r21]
mov r27, r0
b treeadd_lab5

treeadd_lab5:
mov r28, r27
b treeadd_returnLabel

treeadd_returnLabel:
mov x0, r28
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
mov x0, r0
bl size
mov r1, x0
cmp r1, 1
cset r2, le
cmp r2, 0
mov r46, r0
bne quickSort_returnLabel
b quickSort_lab2

quickSort_lab2:
mov x0, r0
mov x1, 0
bl get
mov r5, x0
mov x0, r0
bl size
mov r6, x0
mov r48, 1
sub r7, r6, r48
mov x0, r0
mov x1, r7
bl get
mov r8, x0
add r9, r5, r8
mov r50, 2
sdiv r10, r9, r50
cmp r0, null
cset r11, ne
cmp r11, 0
mov r12, r0
mov r14, 0
mov r15, r0
mov r40, r0
mov r41, null
mov r43, null
bne quickSort_lab3
b quickSort_lab7

inter_quickSort_lab3:
mov r12, r34
mov r14, r35
mov r15, r30
b quickSort_lab3

quickSort_lab3:
mov x0, r15
mov x1, r14
bl get
mov r16, x0
cmp r16, r10
cset r17, gt
cmp r17, 0
bne quickSort_lab4
b quickSort_lab5

quickSort_lab4:
mov x0, r15
mov x1, r14
bl get
mov r21, x0
mov x0, null
mov x1, r21
bl add
mov r22, x0
mov r28, r14
mov r29, null
mov r30, r15
mov r31, r22
mov r32, r12
b quickSort_lab6

quickSort_lab5:
mov x0, r15
mov x1, r14
bl get
mov r26, x0
mov x0, null
mov x1, r26
bl add
mov r27, x0
mov r28, r14
mov r29, r27
mov r30, r15
mov r31, null
mov r32, r12
b quickSort_lab6

quickSort_lab6:
mov r55, 1
mov r56, 8
mul r54, r55, r56
add r33, r32, r54
ldr r34, [r33]
mov r58, 1
add r35, r28, r58
cmp r34, null
cset r36, ne
cmp r36, 0
mov r40, r30
mov r41, r29
mov r43, r31
bne quickSort_lab3
b quickSort_lab7

quickSort_lab7:
mov x0, r40
bl freeList
mov x0, r41
bl quickSort
mov r42, x0
mov x0, r43
bl quickSort
mov r44, x0
mov x0, r42
mov x1, r44
bl concatLists
mov r45, x0
mov r46, r45
b quickSort_returnLabel

quickSort_returnLabel:
mov x0, r46
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
mov x0, r0
bl printList
ldr x0, =println
mov x1, -999
bl printf
mov r2, x0
mov x0, r0
bl printList
ldr x0, =println
mov x1, -999
bl printf
mov r4, x0
mov x0, r0
bl printList
ldr x0, =println
mov x1, -999
bl printf
mov r6, x0
mov x0, null
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
mov r1, x1
ldr x0, =println
mov x1, -1
bl printf
mov r3, x0
cmp r0, null
cset r4, ne
cmp r4, 0
mov r22, 0
bne treesearch_lab0
b treesearch_returnLabel

treesearch_lab0:
mov r27, 0
mov r28, 8
mul r26, r27, r28
add r6, r0, r26
ldr r7, [r6]
cmp r7, r1
cset r9, eq
cmp r9, 0
mov r22, 1
bne treesearch_returnLabel
b treesearch_lab3

treesearch_lab3:
mov r33, 1
mov r34, 8
mul r32, r33, r34
add r11, r0, r32
ldr r12, [r11]
mov x0, r12
mov x1, r1
bl treesearch
mov r14, x0
cmp r14, 1
cset r15, eq
cmp r15, 0
mov r22, 1
bne treesearch_returnLabel
b treesearch_lab6

treesearch_lab6:
mov r39, 2
mov r40, 8
mul r38, r39, r40
add r17, r0, r38
ldr r18, [r17]
mov x0, r18
mov x1, r1
bl treesearch
mov r20, x0
cmp r20, 1
cset r21, eq
cmp r21, 0
mov r22, 1
bne treesearch_returnLabel
b treesearch_lab8

treesearch_lab8:
mov r22, 0
b treesearch_returnLabel

treesearch_returnLabel:
mov x0, r22
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
cmp r0, null
cset r1, ne
cmp r1, 0
mov r17, null
bne inOrder_lab0
b inOrder_returnLabel

inOrder_lab0:
mov x0, 16
bl malloc
mov r2, x0
mov r3, r2
mov r22, 0
mov r23, 8
mul r21, r22, r23
add r4, r3, r21
mov r28, 0
mov r29, 8
mul r27, r28, r29
add r6, r0, r27
ldr r7, [r6]
str r7, [r4]
mov r34, 1
mov r35, 8
mul r33, r34, r35
add r8, r3, r33
str null, [r8]
mov r40, 1
mov r41, 8
mul r39, r40, r41
add r9, r0, r39
ldr r10, [r9]
mov x0, r10
bl inOrder
mov r11, x0
mov r46, 2
mov r47, 8
mul r45, r46, r47
add r12, r0, r45
ldr r13, [r12]
mov x0, r13
bl inOrder
mov r14, x0
mov x0, r3
mov x1, r14
bl concatLists
mov r15, x0
mov x0, r11
mov x1, r15
bl concatLists
mov r16, x0
mov r17, r16
b inOrder_returnLabel

inOrder_returnLabel:
mov x0, r17
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
mov r1, x1
ldr x0, =println
mov x1, -1
bl printf
mov r3, x0
cmp r0, null
cset r4, ne
cmp r4, 0
mov r25, 0
bne bintreesearch_lab0
b bintreesearch_returnLabel

bintreesearch_lab0:
mov r30, 0
mov r31, 8
mul r29, r30, r31
add r6, r0, r29
ldr r7, [r6]
cmp r7, r1
cset r9, eq
cmp r9, 0
mov r25, 1
bne bintreesearch_returnLabel
b bintreesearch_lab3

bintreesearch_lab3:
mov r36, 0
mov r37, 8
mul r35, r36, r37
add r12, r0, r35
ldr r13, [r12]
cmp r1, r13
cset r14, lt
cmp r14, 0
bne bintreesearch_lab4
b bintreesearch_lab5

bintreesearch_lab4:
mov r42, 1
mov r43, 8
mul r41, r42, r43
add r16, r0, r41
ldr r17, [r16]
mov x0, r17
mov x1, r1
bl bintreesearch
mov r19, x0
mov r25, r19
b bintreesearch_returnLabel

bintreesearch_lab5:
mov r48, 2
mov r49, 8
mul r47, r48, r49
add r21, r0, r47
ldr r22, [r21]
mov x0, r22
mov x1, r1
bl bintreesearch
mov r24, x0
mov r25, r24
b bintreesearch_returnLabel

bintreesearch_returnLabel:
mov x0, r25
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
mov x0, r0
bl size
mov r1, x0
mov r16, 0
cmp r16, r1
cset r2, lt
cmp r2, 0
mov r3, null
mov r4, 0
mov r11, null
bne buildTree_lab0
b buildTree_returnLabel

inter_buildTree_lab0:
mov r3, r7
mov r4, r8
b buildTree_lab0

buildTree_lab0:
mov x0, r0
mov x1, r4
bl get
mov r6, x0
mov x0, r3
mov x1, r6
bl treeadd
mov r7, x0
mov r18, 1
add r8, r4, r18
mov x0, r0
bl size
mov r9, x0
cmp r8, r9
cset r10, lt
cmp r10, 0
mov r11, r7
bne buildTree_lab0
b buildTree_returnLabel

buildTree_returnLabel:
mov x0, r11
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
mov x0, r0
bl buildTree
mov r1, x0
mov x0, r1
bl treeprint
ldr x0, =println
mov x1, -999
bl printf
mov r3, x0
mov x0, r1
bl inOrder
mov r4, x0
mov x0, r4
bl printList
ldr x0, =println
mov x1, -999
bl printf
mov r6, x0
mov x0, r4
bl freeList
mov x0, r1
bl postOrder
mov r7, x0
mov x0, r7
bl printList
ldr x0, =println
mov x1, -999
bl printf
mov r9, x0
mov x0, r7
bl freeList
mov x0, r1
mov x1, 0
bl treesearch
mov r10, x0
ldr x0, =println
mov x1, r10
bl printf
mov r11, x0
ldr x0, =println
mov x1, -999
bl printf
mov r13, x0
mov x0, r1
mov x1, 10
bl treesearch
mov r14, x0
ldr x0, =println
mov x1, r14
bl printf
mov r15, x0
ldr x0, =println
mov x1, -999
bl printf
mov r17, x0
mov x0, r1
mov x1, -2
bl treesearch
mov r19, x0
ldr x0, =println
mov x1, r19
bl printf
mov r20, x0
ldr x0, =println
mov x1, -999
bl printf
mov r22, x0
mov x0, r1
mov x1, 2
bl treesearch
mov r23, x0
ldr x0, =println
mov x1, r23
bl printf
mov r24, x0
ldr x0, =println
mov x1, -999
bl printf
mov r26, x0
mov x0, r1
mov x1, 3
bl treesearch
mov r27, x0
ldr x0, =println
mov x1, r27
bl printf
mov r28, x0
ldr x0, =println
mov x1, -999
bl printf
mov r30, x0
mov x0, r1
mov x1, 9
bl treesearch
mov r31, x0
ldr x0, =println
mov x1, r31
bl printf
mov r32, x0
ldr x0, =println
mov x1, -999
bl printf
mov r34, x0
mov x0, r1
mov x1, 1
bl treesearch
mov r35, x0
ldr x0, =println
mov x1, r35
bl printf
mov r36, x0
ldr x0, =println
mov x1, -999
bl printf
mov r38, x0
mov x0, r1
mov x1, 0
bl bintreesearch
mov r39, x0
ldr x0, =println
mov x1, r39
bl printf
mov r40, x0
ldr x0, =println
mov x1, -999
bl printf
mov r42, x0
mov x0, r1
mov x1, 10
bl bintreesearch
mov r43, x0
ldr x0, =println
mov x1, r43
bl printf
mov r44, x0
ldr x0, =println
mov x1, -999
bl printf
mov r46, x0
mov x0, r1
mov x1, -2
bl bintreesearch
mov r48, x0
ldr x0, =println
mov x1, r48
bl printf
mov r49, x0
ldr x0, =println
mov x1, -999
bl printf
mov r51, x0
mov x0, r1
mov x1, 2
bl bintreesearch
mov r52, x0
ldr x0, =println
mov x1, r52
bl printf
mov r53, x0
ldr x0, =println
mov x1, -999
bl printf
mov r55, x0
mov x0, r1
mov x1, 3
bl bintreesearch
mov r56, x0
ldr x0, =println
mov x1, r56
bl printf
mov r57, x0
ldr x0, =println
mov x1, -999
bl printf
mov r59, x0
mov x0, r1
mov x1, 9
bl bintreesearch
mov r60, x0
ldr x0, =println
mov x1, r60
bl printf
mov r61, x0
ldr x0, =println
mov x1, -999
bl printf
mov r63, x0
mov x0, r1
mov x1, 1
bl bintreesearch
mov r64, x0
ldr x0, =println
mov x1, r64
bl printf
mov r65, x0
ldr x0, =println
mov x1, -999
bl printf
mov r67, x0
mov x0, r1
bl freeTree
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
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

mov r0, x0
cmp r0, null
cset r1, eq
cmp r1, 0
mov r10, null
bne myCopy_returnLabel
b myCopy_lab2

myCopy_lab2:
mov r15, 0
mov r16, 8
mul r14, r15, r16
add r3, r0, r14
ldr r4, [r3]
mov x0, null
mov x1, r4
bl add
mov r5, x0
mov r21, 1
mov r22, 8
mul r20, r21, r22
add r6, r0, r20
ldr r7, [r6]
mov x0, r7
bl myCopy
mov r8, x0
mov x0, r5
mov x1, r8
bl concatLists
mov r9, x0
mov r10, r9
b myCopy_returnLabel

myCopy_returnLabel:
mov x0, r10
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

mov r19, 1
cmp r19, 0
mov r3, null
mov r4, 0
mov r13, null
mov r14, null
mov r15, null
bne main_lab0
b main_returnLabel

inter_main_lab0:
mov r3, r7
mov r4, r11
b main_lab0

main_lab0:
ldr x0, =read
ldr x1, =read_scratch
bl scanf
mov r5, x0
ldr r6, =read_scratch
ldr r6, [r6]
mov x0, r3
mov x1, r6
bl add
mov r7, x0
mov x0, r7
bl myCopy
mov r8, x0
mov x0, r7
bl myCopy
mov r9, x0
mov x0, r8
bl quickSortMain
mov r10, x0
mov x0, r10
bl freeList
mov x0, r9
bl treeMain
mov r21, 1
add r11, r4, r21
cmp r11, 10
cset r12, lt
cmp r12, 0
mov r13, r8
mov r14, r9
mov r15, r7
bne main_lab0
b main_returnLabel

main_returnLabel:
mov x0, r15
bl freeList
mov x0, r13
bl freeList
mov x0, r14
bl freeList
mov x0, 0
ldp x28, x27, [sp, 80]
ldp x26, x25, [sp, 64]
ldp x24, x23, [sp, 48]
ldp x22, x21, [sp, 32]
ldp x20, x19, [sp, 16]
ldp x29, x30, [sp], 96
ret

