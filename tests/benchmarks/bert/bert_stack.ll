declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.node = type {i64, %struct.node*}
%struct.tnode = type {i64, %struct.tnode*, %struct.tnode*}
%struct.i = type {i64}
%struct.myCopy = type {i1}
@a = common global i64 0
@b = common global i64 0
@i = common global %struct.i* null

define %struct.node* @concatLists(%struct.node* %r0, %struct.node* %r1) {
prologue:
%r2 = alloca %struct.node*
%r3 = alloca %struct.node*
%r4 = alloca %struct.node*
%r5 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r3
store %struct.node* %r1, %struct.node** %r4
%r6 = load %struct.node*, %struct.node** %r3
store %struct.node* %r6, %struct.node** %r5
%r7 = load %struct.node*, %struct.node** %r3
%r8 = icmp eq %struct.node* %r7, null
br i1 %r8, label %lab0, label %lab1

lab0:
%r9 = load %struct.node*, %struct.node** %r4
store %struct.node* %r9, %struct.node** %r2
br label %returnLabel

lab1:
br label %lab2

lab2:
%r10 = load %struct.node*, %struct.node** %r5
%r11 = getelementptr inbounds %struct.node, %struct.node* %r10, i32 0, i32 1
%r12 = load %struct.node*, %struct.node** %r11
%r13 = icmp ne %struct.node* %r12, null
br i1 %r13, label %lab3, label %lab4

lab3:
%r14 = load %struct.node*, %struct.node** %r5
%r15 = getelementptr inbounds %struct.node, %struct.node* %r14, i32 0, i32 1
%r16 = load %struct.node*, %struct.node** %r15
store %struct.node* %r16, %struct.node** %r5
%r17 = load %struct.node*, %struct.node** %r5
%r18 = getelementptr inbounds %struct.node, %struct.node* %r17, i32 0, i32 1
%r19 = load %struct.node*, %struct.node** %r18
%r20 = icmp ne %struct.node* %r19, null
br i1 %r20, label %lab3, label %lab4

lab4:
%r21 = load %struct.node*, %struct.node** %r5
%r22 = getelementptr inbounds %struct.node, %struct.node* %r21, i32 0, i32 1
%r23 = load %struct.node*, %struct.node** %r4
store %struct.node* %r23, %struct.node** %r22
%r24 = load %struct.node*, %struct.node** %r3
store %struct.node* %r24, %struct.node** %r2
br label %returnLabel

returnLabel:
%r25 = load %struct.node*, %struct.node** %r2
ret %struct.node* %r25

}

define %struct.node* @add(%struct.node* %r0, i64 %r1) {
prologue:
%r2 = alloca %struct.node*
%r3 = alloca %struct.node*
%r4 = alloca i64
%r5 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r3
store i64 %r1, i64* %r4
%r6 = call i8* @malloc(i64 16)
%r7 = bitcast i8* %r6 to %struct.node*
store %struct.node* %r7, %struct.node** %r5
%r8 = load %struct.node*, %struct.node** %r5
%r9 = getelementptr inbounds %struct.node, %struct.node* %r8, i32 0, i32 0
%r10 = load i64, i64* %r4
store i64 %r10, i64* %r9
%r11 = load %struct.node*, %struct.node** %r5
%r12 = getelementptr inbounds %struct.node, %struct.node* %r11, i32 0, i32 1
%r13 = load %struct.node*, %struct.node** %r3
store %struct.node* %r13, %struct.node** %r12
%r14 = load %struct.node*, %struct.node** %r5
store %struct.node* %r14, %struct.node** %r2
br label %returnLabel

returnLabel:
%r15 = load %struct.node*, %struct.node** %r2
ret %struct.node* %r15

}

define i64 @size(%struct.node* %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r2
%r3 = load %struct.node*, %struct.node** %r2
%r4 = icmp eq %struct.node* %r3, null
br i1 %r4, label %lab0, label %lab1

lab0:
store i64 0, i64* %r1
br label %returnLabel

lab1:
br label %lab2

lab2:
%r5 = load %struct.node*, %struct.node** %r2
%r6 = getelementptr inbounds %struct.node, %struct.node* %r5, i32 0, i32 1
%r7 = load %struct.node*, %struct.node** %r6
%r8 = call i64 @size(%struct.node* %r7)
%r9 = add i64 1, %r8
store i64 %r9, i64* %r1
br label %returnLabel

returnLabel:
%r10 = load i64, i64* %r1
ret i64 %r10

}

define i64 @get(%struct.node* %r0, i64 %r1) {
prologue:
%r2 = alloca i64
%r3 = alloca %struct.node*
%r4 = alloca i64
store %struct.node* %r0, %struct.node** %r3
store i64 %r1, i64* %r4
%r5 = load i64, i64* %r4
%r6 = icmp eq i64 %r5, 0
br i1 %r6, label %lab0, label %lab1

lab0:
%r7 = load %struct.node*, %struct.node** %r3
%r8 = getelementptr inbounds %struct.node, %struct.node* %r7, i32 0, i32 0
%r9 = load i64, i64* %r8
store i64 %r9, i64* %r2
br label %returnLabel

lab1:
br label %lab2

lab2:
%r10 = load %struct.node*, %struct.node** %r3
%r11 = getelementptr inbounds %struct.node, %struct.node* %r10, i32 0, i32 1
%r12 = load %struct.node*, %struct.node** %r11
%r13 = load i64, i64* %r4
%r14 = sub i64 %r13, 1
%r15 = call i64 @get(%struct.node* %r12, i64 %r14)
store i64 %r15, i64* %r2
br label %returnLabel

returnLabel:
%r16 = load i64, i64* %r2
ret i64 %r16

}

define %struct.node* @pop(%struct.node* %r0) {
prologue:
%r1 = alloca %struct.node*
%r2 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r2
%r3 = load %struct.node*, %struct.node** %r2
%r4 = getelementptr inbounds %struct.node, %struct.node* %r3, i32 0, i32 1
%r5 = load %struct.node*, %struct.node** %r4
store %struct.node* %r5, %struct.node** %r2
%r6 = load %struct.node*, %struct.node** %r2
store %struct.node* %r6, %struct.node** %r1
br label %returnLabel

returnLabel:
%r7 = load %struct.node*, %struct.node** %r1
ret %struct.node* %r7

}

define void @printList(%struct.node* %r0) {
prologue:
%r1 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r1
%r2 = load %struct.node*, %struct.node** %r1
%r3 = icmp ne %struct.node* %r2, null
br i1 %r3, label %lab0, label %lab1

lab0:
%r4 = load %struct.node*, %struct.node** %r1
%r5 = getelementptr inbounds %struct.node, %struct.node* %r4, i32 0, i32 0
%r6 = load i64, i64* %r5
%r7 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r6)
%r8 = load %struct.node*, %struct.node** %r1
%r9 = getelementptr inbounds %struct.node, %struct.node* %r8, i32 0, i32 1
%r10 = load %struct.node*, %struct.node** %r9
call void @printList(%struct.node* %r10)
br label %lab2

lab1:
br label %lab2

lab2:
br label %returnLabel

returnLabel:
ret void

}

define void @treeprint(%struct.tnode* %r0) {
prologue:
%r1 = alloca %struct.tnode*
store %struct.tnode* %r0, %struct.tnode** %r1
%r2 = load %struct.tnode*, %struct.tnode** %r1
%r3 = icmp ne %struct.tnode* %r2, null
br i1 %r3, label %lab0, label %lab1

lab0:
%r4 = load %struct.tnode*, %struct.tnode** %r1
%r5 = getelementptr inbounds %struct.tnode, %struct.tnode* %r4, i32 0, i32 1
%r6 = load %struct.tnode*, %struct.tnode** %r5
call void @treeprint(%struct.tnode* %r6)
%r7 = load %struct.tnode*, %struct.tnode** %r1
%r8 = getelementptr inbounds %struct.tnode, %struct.tnode* %r7, i32 0, i32 0
%r9 = load i64, i64* %r8
%r10 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r9)
%r11 = load %struct.tnode*, %struct.tnode** %r1
%r12 = getelementptr inbounds %struct.tnode, %struct.tnode* %r11, i32 0, i32 2
%r13 = load %struct.tnode*, %struct.tnode** %r12
call void @treeprint(%struct.tnode* %r13)
br label %lab2

lab1:
br label %lab2

lab2:
br label %returnLabel

returnLabel:
ret void

}

define void @freeList(%struct.node* %r0) {
prologue:
%r1 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r1
%r2 = load %struct.node*, %struct.node** %r1
%r3 = icmp ne %struct.node* %r2, null
br i1 %r3, label %lab0, label %lab1

lab0:
%r4 = load %struct.node*, %struct.node** %r1
%r5 = getelementptr inbounds %struct.node, %struct.node* %r4, i32 0, i32 1
%r6 = load %struct.node*, %struct.node** %r5
call void @freeList(%struct.node* %r6)
%r7 = load %struct.node*, %struct.node** %r1
%r8 = bitcast %struct.node* %r7 to i8*
call void @free(i8* %r8)
br label %lab2

lab1:
br label %lab2

lab2:
br label %returnLabel

returnLabel:
ret void

}

define void @freeTree(%struct.tnode* %r0) {
prologue:
%r1 = alloca %struct.tnode*
store %struct.tnode* %r0, %struct.tnode** %r1
%r2 = load %struct.tnode*, %struct.tnode** %r1
%r3 = icmp eq %struct.tnode* %r2, null
%r4 = xor i1 true, %r3
br i1 %r4, label %lab0, label %lab1

lab0:
%r5 = load %struct.tnode*, %struct.tnode** %r1
%r6 = getelementptr inbounds %struct.tnode, %struct.tnode* %r5, i32 0, i32 1
%r7 = load %struct.tnode*, %struct.tnode** %r6
call void @freeTree(%struct.tnode* %r7)
%r8 = load %struct.tnode*, %struct.tnode** %r1
%r9 = getelementptr inbounds %struct.tnode, %struct.tnode* %r8, i32 0, i32 2
%r10 = load %struct.tnode*, %struct.tnode** %r9
call void @freeTree(%struct.tnode* %r10)
%r11 = load %struct.tnode*, %struct.tnode** %r1
%r12 = bitcast %struct.tnode* %r11 to i8*
call void @free(i8* %r12)
br label %lab2

lab1:
br label %lab2

lab2:
br label %returnLabel

returnLabel:
ret void

}

define %struct.node* @postOrder(%struct.tnode* %r0) {
prologue:
%r1 = alloca %struct.node*
%r2 = alloca %struct.tnode*
%r3 = alloca %struct.node*
store %struct.tnode* %r0, %struct.tnode** %r2
%r4 = load %struct.tnode*, %struct.tnode** %r2
%r5 = icmp ne %struct.tnode* %r4, null
br i1 %r5, label %lab0, label %lab1

lab0:
%r6 = call i8* @malloc(i64 16)
%r7 = bitcast i8* %r6 to %struct.node*
store %struct.node* %r7, %struct.node** %r3
%r8 = load %struct.node*, %struct.node** %r3
%r9 = getelementptr inbounds %struct.node, %struct.node* %r8, i32 0, i32 0
%r10 = load %struct.tnode*, %struct.tnode** %r2
%r11 = getelementptr inbounds %struct.tnode, %struct.tnode* %r10, i32 0, i32 0
%r12 = load i64, i64* %r11
store i64 %r12, i64* %r9
%r13 = load %struct.node*, %struct.node** %r3
%r14 = getelementptr inbounds %struct.node, %struct.node* %r13, i32 0, i32 1
store %struct.node* null, %struct.node** %r14
%r15 = load %struct.tnode*, %struct.tnode** %r2
%r16 = getelementptr inbounds %struct.tnode, %struct.tnode* %r15, i32 0, i32 1
%r17 = load %struct.tnode*, %struct.tnode** %r16
%r18 = call %struct.node* @postOrder(%struct.tnode* %r17)
%r19 = load %struct.tnode*, %struct.tnode** %r2
%r20 = getelementptr inbounds %struct.tnode, %struct.tnode* %r19, i32 0, i32 2
%r21 = load %struct.tnode*, %struct.tnode** %r20
%r22 = call %struct.node* @postOrder(%struct.tnode* %r21)
%r23 = call %struct.node* @concatLists(%struct.node* %r18, %struct.node* %r22)
%r24 = load %struct.node*, %struct.node** %r3
%r25 = call %struct.node* @concatLists(%struct.node* %r23, %struct.node* %r24)
store %struct.node* %r25, %struct.node** %r1
br label %returnLabel

lab1:
br label %lab2

lab2:
store %struct.node* null, %struct.node** %r1
br label %returnLabel

returnLabel:
%r26 = load %struct.node*, %struct.node** %r1
ret %struct.node* %r26

}

define %struct.tnode* @treeadd(%struct.tnode* %r0, i64 %r1) {
prologue:
%r2 = alloca %struct.tnode*
%r3 = alloca %struct.tnode*
%r4 = alloca i64
%r5 = alloca %struct.tnode*
store %struct.tnode* %r0, %struct.tnode** %r3
store i64 %r1, i64* %r4
%r6 = load %struct.tnode*, %struct.tnode** %r3
%r7 = icmp eq %struct.tnode* %r6, null
br i1 %r7, label %lab0, label %lab1

lab0:
%r8 = call i8* @malloc(i64 24)
%r9 = bitcast i8* %r8 to %struct.tnode*
store %struct.tnode* %r9, %struct.tnode** %r5
%r10 = load %struct.tnode*, %struct.tnode** %r5
%r11 = getelementptr inbounds %struct.tnode, %struct.tnode* %r10, i32 0, i32 0
%r12 = load i64, i64* %r4
store i64 %r12, i64* %r11
%r13 = load %struct.tnode*, %struct.tnode** %r5
%r14 = getelementptr inbounds %struct.tnode, %struct.tnode* %r13, i32 0, i32 1
store %struct.tnode* null, %struct.tnode** %r14
%r15 = load %struct.tnode*, %struct.tnode** %r5
%r16 = getelementptr inbounds %struct.tnode, %struct.tnode* %r15, i32 0, i32 2
store %struct.tnode* null, %struct.tnode** %r16
%r17 = load %struct.tnode*, %struct.tnode** %r5
store %struct.tnode* %r17, %struct.tnode** %r2
br label %returnLabel

lab1:
br label %lab2

lab2:
%r18 = load i64, i64* %r4
%r19 = load %struct.tnode*, %struct.tnode** %r3
%r20 = getelementptr inbounds %struct.tnode, %struct.tnode* %r19, i32 0, i32 0
%r21 = load i64, i64* %r20
%r22 = icmp slt i64 %r18, %r21
br i1 %r22, label %lab3, label %lab4

lab3:
%r23 = load %struct.tnode*, %struct.tnode** %r3
%r24 = getelementptr inbounds %struct.tnode, %struct.tnode* %r23, i32 0, i32 1
%r25 = load %struct.tnode*, %struct.tnode** %r3
%r26 = getelementptr inbounds %struct.tnode, %struct.tnode* %r25, i32 0, i32 1
%r27 = load %struct.tnode*, %struct.tnode** %r26
%r28 = load i64, i64* %r4
%r29 = call %struct.tnode* @treeadd(%struct.tnode* %r27, i64 %r28)
store %struct.tnode* %r29, %struct.tnode** %r24
br label %lab5

lab4:
%r30 = load %struct.tnode*, %struct.tnode** %r3
%r31 = getelementptr inbounds %struct.tnode, %struct.tnode* %r30, i32 0, i32 2
%r32 = load %struct.tnode*, %struct.tnode** %r3
%r33 = getelementptr inbounds %struct.tnode, %struct.tnode* %r32, i32 0, i32 2
%r34 = load %struct.tnode*, %struct.tnode** %r33
%r35 = load i64, i64* %r4
%r36 = call %struct.tnode* @treeadd(%struct.tnode* %r34, i64 %r35)
store %struct.tnode* %r36, %struct.tnode** %r31
br label %lab5

lab5:
%r37 = load %struct.tnode*, %struct.tnode** %r3
store %struct.tnode* %r37, %struct.tnode** %r2
br label %returnLabel

returnLabel:
%r38 = load %struct.tnode*, %struct.tnode** %r2
ret %struct.tnode* %r38

}

define %struct.node* @quickSort(%struct.node* %r0) {
prologue:
%r1 = alloca %struct.node*
%r2 = alloca %struct.node*
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca %struct.node*
%r6 = alloca %struct.node*
%r7 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r2
store %struct.node* null, %struct.node** %r5
store %struct.node* null, %struct.node** %r6
%r8 = load %struct.node*, %struct.node** %r2
%r9 = call i64 @size(%struct.node* %r8)
%r10 = icmp sle i64 %r9, 1
br i1 %r10, label %lab0, label %lab1

lab0:
%r11 = load %struct.node*, %struct.node** %r2
store %struct.node* %r11, %struct.node** %r1
br label %returnLabel

lab1:
br label %lab2

lab2:
%r12 = load %struct.node*, %struct.node** %r2
%r13 = call i64 @get(%struct.node* %r12, i64 0)
%r14 = load %struct.node*, %struct.node** %r2
%r15 = load %struct.node*, %struct.node** %r2
%r16 = call i64 @size(%struct.node* %r15)
%r17 = sub i64 %r16, 1
%r18 = call i64 @get(%struct.node* %r14, i64 %r17)
%r19 = add i64 %r13, %r18
%r20 = sdiv i64 %r19, 2
store i64 %r20, i64* %r3
%r21 = load %struct.node*, %struct.node** %r2
store %struct.node* %r21, %struct.node** %r7
store i64 0, i64* %r4
%r22 = load %struct.node*, %struct.node** %r7
%r23 = icmp ne %struct.node* %r22, null
br i1 %r23, label %lab3, label %lab7

lab3:
%r24 = load %struct.node*, %struct.node** %r2
%r25 = load i64, i64* %r4
%r26 = call i64 @get(%struct.node* %r24, i64 %r25)
%r27 = load i64, i64* %r3
%r28 = icmp sgt i64 %r26, %r27
br i1 %r28, label %lab4, label %lab5

lab4:
%r29 = load %struct.node*, %struct.node** %r6
%r30 = load %struct.node*, %struct.node** %r2
%r31 = load i64, i64* %r4
%r32 = call i64 @get(%struct.node* %r30, i64 %r31)
%r33 = call %struct.node* @add(%struct.node* %r29, i64 %r32)
store %struct.node* %r33, %struct.node** %r6
br label %lab6

lab5:
%r34 = load %struct.node*, %struct.node** %r5
%r35 = load %struct.node*, %struct.node** %r2
%r36 = load i64, i64* %r4
%r37 = call i64 @get(%struct.node* %r35, i64 %r36)
%r38 = call %struct.node* @add(%struct.node* %r34, i64 %r37)
store %struct.node* %r38, %struct.node** %r5
br label %lab6

lab6:
%r39 = load %struct.node*, %struct.node** %r7
%r40 = getelementptr inbounds %struct.node, %struct.node* %r39, i32 0, i32 1
%r41 = load %struct.node*, %struct.node** %r40
store %struct.node* %r41, %struct.node** %r7
%r42 = load i64, i64* %r4
%r43 = add i64 %r42, 1
store i64 %r43, i64* %r4
%r44 = load %struct.node*, %struct.node** %r7
%r45 = icmp ne %struct.node* %r44, null
br i1 %r45, label %lab3, label %lab7

lab7:
%r46 = load %struct.node*, %struct.node** %r2
call void @freeList(%struct.node* %r46)
%r47 = load %struct.node*, %struct.node** %r5
%r48 = call %struct.node* @quickSort(%struct.node* %r47)
%r49 = load %struct.node*, %struct.node** %r6
%r50 = call %struct.node* @quickSort(%struct.node* %r49)
%r51 = call %struct.node* @concatLists(%struct.node* %r48, %struct.node* %r50)
store %struct.node* %r51, %struct.node** %r1
br label %returnLabel

returnLabel:
%r52 = load %struct.node*, %struct.node** %r1
ret %struct.node* %r52

}

define %struct.node* @quickSortMain(%struct.node* %r0) {
prologue:
%r1 = alloca %struct.node*
%r2 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r2
%r3 = load %struct.node*, %struct.node** %r2
call void @printList(%struct.node* %r3)
%r4 = sub i64 0, 999
%r5 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r4)
%r6 = load %struct.node*, %struct.node** %r2
call void @printList(%struct.node* %r6)
%r7 = sub i64 0, 999
%r8 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r7)
%r9 = load %struct.node*, %struct.node** %r2
call void @printList(%struct.node* %r9)
%r10 = sub i64 0, 999
%r11 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r10)
store %struct.node* null, %struct.node** %r1
br label %returnLabel

returnLabel:
%r12 = load %struct.node*, %struct.node** %r1
ret %struct.node* %r12

}

define i64 @treesearch(%struct.tnode* %r0, i64 %r1) {
prologue:
%r2 = alloca i64
%r3 = alloca %struct.tnode*
%r4 = alloca i64
store %struct.tnode* %r0, %struct.tnode** %r3
store i64 %r1, i64* %r4
%r5 = sub i64 0, 1
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r5)
%r7 = load %struct.tnode*, %struct.tnode** %r3
%r8 = icmp ne %struct.tnode* %r7, null
br i1 %r8, label %lab0, label %lab9

lab0:
%r9 = load %struct.tnode*, %struct.tnode** %r3
%r10 = getelementptr inbounds %struct.tnode, %struct.tnode* %r9, i32 0, i32 0
%r11 = load i64, i64* %r10
%r12 = load i64, i64* %r4
%r13 = icmp eq i64 %r11, %r12
br i1 %r13, label %lab1, label %lab2

lab1:
store i64 1, i64* %r2
br label %returnLabel

lab2:
br label %lab3

lab3:
%r14 = load %struct.tnode*, %struct.tnode** %r3
%r15 = getelementptr inbounds %struct.tnode, %struct.tnode* %r14, i32 0, i32 1
%r16 = load %struct.tnode*, %struct.tnode** %r15
%r17 = load i64, i64* %r4
%r18 = call i64 @treesearch(%struct.tnode* %r16, i64 %r17)
%r19 = icmp eq i64 %r18, 1
br i1 %r19, label %lab4, label %lab5

lab4:
store i64 1, i64* %r2
br label %returnLabel

lab5:
br label %lab6

lab6:
%r20 = load %struct.tnode*, %struct.tnode** %r3
%r21 = getelementptr inbounds %struct.tnode, %struct.tnode* %r20, i32 0, i32 2
%r22 = load %struct.tnode*, %struct.tnode** %r21
%r23 = load i64, i64* %r4
%r24 = call i64 @treesearch(%struct.tnode* %r22, i64 %r23)
%r25 = icmp eq i64 %r24, 1
br i1 %r25, label %lab7, label %lab8

lab7:
store i64 1, i64* %r2
br label %returnLabel

lab8:
store i64 0, i64* %r2
br label %returnLabel

lab9:
br label %lab10

lab10:
store i64 0, i64* %r2
br label %returnLabel

returnLabel:
%r26 = load i64, i64* %r2
ret i64 %r26

}

define %struct.node* @inOrder(%struct.tnode* %r0) {
prologue:
%r1 = alloca %struct.node*
%r2 = alloca %struct.tnode*
%r3 = alloca %struct.node*
store %struct.tnode* %r0, %struct.tnode** %r2
%r4 = load %struct.tnode*, %struct.tnode** %r2
%r5 = icmp ne %struct.tnode* %r4, null
br i1 %r5, label %lab0, label %lab1

lab0:
%r6 = call i8* @malloc(i64 16)
%r7 = bitcast i8* %r6 to %struct.node*
store %struct.node* %r7, %struct.node** %r3
%r8 = load %struct.node*, %struct.node** %r3
%r9 = getelementptr inbounds %struct.node, %struct.node* %r8, i32 0, i32 0
%r10 = load %struct.tnode*, %struct.tnode** %r2
%r11 = getelementptr inbounds %struct.tnode, %struct.tnode* %r10, i32 0, i32 0
%r12 = load i64, i64* %r11
store i64 %r12, i64* %r9
%r13 = load %struct.node*, %struct.node** %r3
%r14 = getelementptr inbounds %struct.node, %struct.node* %r13, i32 0, i32 1
store %struct.node* null, %struct.node** %r14
%r15 = load %struct.tnode*, %struct.tnode** %r2
%r16 = getelementptr inbounds %struct.tnode, %struct.tnode* %r15, i32 0, i32 1
%r17 = load %struct.tnode*, %struct.tnode** %r16
%r18 = call %struct.node* @inOrder(%struct.tnode* %r17)
%r19 = load %struct.node*, %struct.node** %r3
%r20 = load %struct.tnode*, %struct.tnode** %r2
%r21 = getelementptr inbounds %struct.tnode, %struct.tnode* %r20, i32 0, i32 2
%r22 = load %struct.tnode*, %struct.tnode** %r21
%r23 = call %struct.node* @inOrder(%struct.tnode* %r22)
%r24 = call %struct.node* @concatLists(%struct.node* %r19, %struct.node* %r23)
%r25 = call %struct.node* @concatLists(%struct.node* %r18, %struct.node* %r24)
store %struct.node* %r25, %struct.node** %r1
br label %returnLabel

lab1:
store %struct.node* null, %struct.node** %r1
br label %returnLabel

returnLabel:
%r26 = load %struct.node*, %struct.node** %r1
ret %struct.node* %r26

}

define i64 @bintreesearch(%struct.tnode* %r0, i64 %r1) {
prologue:
%r2 = alloca i64
%r3 = alloca %struct.tnode*
%r4 = alloca i64
store %struct.tnode* %r0, %struct.tnode** %r3
store i64 %r1, i64* %r4
%r5 = sub i64 0, 1
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r5)
%r7 = load %struct.tnode*, %struct.tnode** %r3
%r8 = icmp ne %struct.tnode* %r7, null
br i1 %r8, label %lab0, label %lab6

lab0:
%r9 = load %struct.tnode*, %struct.tnode** %r3
%r10 = getelementptr inbounds %struct.tnode, %struct.tnode* %r9, i32 0, i32 0
%r11 = load i64, i64* %r10
%r12 = load i64, i64* %r4
%r13 = icmp eq i64 %r11, %r12
br i1 %r13, label %lab1, label %lab2

lab1:
store i64 1, i64* %r2
br label %returnLabel

lab2:
br label %lab3

lab3:
%r14 = load i64, i64* %r4
%r15 = load %struct.tnode*, %struct.tnode** %r3
%r16 = getelementptr inbounds %struct.tnode, %struct.tnode* %r15, i32 0, i32 0
%r17 = load i64, i64* %r16
%r18 = icmp slt i64 %r14, %r17
br i1 %r18, label %lab4, label %lab5

lab4:
%r19 = load %struct.tnode*, %struct.tnode** %r3
%r20 = getelementptr inbounds %struct.tnode, %struct.tnode* %r19, i32 0, i32 1
%r21 = load %struct.tnode*, %struct.tnode** %r20
%r22 = load i64, i64* %r4
%r23 = call i64 @bintreesearch(%struct.tnode* %r21, i64 %r22)
store i64 %r23, i64* %r2
br label %returnLabel

lab5:
%r24 = load %struct.tnode*, %struct.tnode** %r3
%r25 = getelementptr inbounds %struct.tnode, %struct.tnode* %r24, i32 0, i32 2
%r26 = load %struct.tnode*, %struct.tnode** %r25
%r27 = load i64, i64* %r4
%r28 = call i64 @bintreesearch(%struct.tnode* %r26, i64 %r27)
store i64 %r28, i64* %r2
br label %returnLabel

lab6:
br label %lab7

lab7:
store i64 0, i64* %r2
br label %returnLabel

returnLabel:
%r29 = load i64, i64* %r2
ret i64 %r29

}

define %struct.tnode* @buildTree(%struct.node* %r0) {
prologue:
%r1 = alloca %struct.tnode*
%r2 = alloca %struct.node*
%r3 = alloca i64
%r4 = alloca %struct.tnode*
store %struct.node* %r0, %struct.node** %r2
store %struct.tnode* null, %struct.tnode** %r4
store i64 0, i64* %r3
%r5 = load i64, i64* %r3
%r6 = load %struct.node*, %struct.node** %r2
%r7 = call i64 @size(%struct.node* %r6)
%r8 = icmp slt i64 %r5, %r7
br i1 %r8, label %lab0, label %lab1

lab0:
%r9 = load %struct.tnode*, %struct.tnode** %r4
%r10 = load %struct.node*, %struct.node** %r2
%r11 = load i64, i64* %r3
%r12 = call i64 @get(%struct.node* %r10, i64 %r11)
%r13 = call %struct.tnode* @treeadd(%struct.tnode* %r9, i64 %r12)
store %struct.tnode* %r13, %struct.tnode** %r4
%r14 = load i64, i64* %r3
%r15 = add i64 %r14, 1
store i64 %r15, i64* %r3
%r16 = load i64, i64* %r3
%r17 = load %struct.node*, %struct.node** %r2
%r18 = call i64 @size(%struct.node* %r17)
%r19 = icmp slt i64 %r16, %r18
br i1 %r19, label %lab0, label %lab1

lab1:
%r20 = load %struct.tnode*, %struct.tnode** %r4
store %struct.tnode* %r20, %struct.tnode** %r1
br label %returnLabel

returnLabel:
%r21 = load %struct.tnode*, %struct.tnode** %r1
ret %struct.tnode* %r21

}

define void @treeMain(%struct.node* %r0) {
prologue:
%r1 = alloca %struct.node*
%r2 = alloca %struct.tnode*
%r3 = alloca %struct.node*
%r4 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r1
%r5 = load %struct.node*, %struct.node** %r1
%r6 = call %struct.tnode* @buildTree(%struct.node* %r5)
store %struct.tnode* %r6, %struct.tnode** %r2
%r7 = load %struct.tnode*, %struct.tnode** %r2
call void @treeprint(%struct.tnode* %r7)
%r8 = sub i64 0, 999
%r9 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r8)
%r10 = load %struct.tnode*, %struct.tnode** %r2
%r11 = call %struct.node* @inOrder(%struct.tnode* %r10)
store %struct.node* %r11, %struct.node** %r3
%r12 = load %struct.node*, %struct.node** %r3
call void @printList(%struct.node* %r12)
%r13 = sub i64 0, 999
%r14 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r13)
%r15 = load %struct.node*, %struct.node** %r3
call void @freeList(%struct.node* %r15)
%r16 = load %struct.tnode*, %struct.tnode** %r2
%r17 = call %struct.node* @postOrder(%struct.tnode* %r16)
store %struct.node* %r17, %struct.node** %r4
%r18 = load %struct.node*, %struct.node** %r4
call void @printList(%struct.node* %r18)
%r19 = sub i64 0, 999
%r20 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r19)
%r21 = load %struct.node*, %struct.node** %r4
call void @freeList(%struct.node* %r21)
%r22 = load %struct.tnode*, %struct.tnode** %r2
%r23 = call i64 @treesearch(%struct.tnode* %r22, i64 0)
%r24 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r23)
%r25 = sub i64 0, 999
%r26 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r25)
%r27 = load %struct.tnode*, %struct.tnode** %r2
%r28 = call i64 @treesearch(%struct.tnode* %r27, i64 10)
%r29 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r28)
%r30 = sub i64 0, 999
%r31 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r30)
%r32 = load %struct.tnode*, %struct.tnode** %r2
%r33 = sub i64 0, 2
%r34 = call i64 @treesearch(%struct.tnode* %r32, i64 %r33)
%r35 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r34)
%r36 = sub i64 0, 999
%r37 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r36)
%r38 = load %struct.tnode*, %struct.tnode** %r2
%r39 = call i64 @treesearch(%struct.tnode* %r38, i64 2)
%r40 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r39)
%r41 = sub i64 0, 999
%r42 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r41)
%r43 = load %struct.tnode*, %struct.tnode** %r2
%r44 = call i64 @treesearch(%struct.tnode* %r43, i64 3)
%r45 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r44)
%r46 = sub i64 0, 999
%r47 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r46)
%r48 = load %struct.tnode*, %struct.tnode** %r2
%r49 = call i64 @treesearch(%struct.tnode* %r48, i64 9)
%r50 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r49)
%r51 = sub i64 0, 999
%r52 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r51)
%r53 = load %struct.tnode*, %struct.tnode** %r2
%r54 = call i64 @treesearch(%struct.tnode* %r53, i64 1)
%r55 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r54)
%r56 = sub i64 0, 999
%r57 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r56)
%r58 = load %struct.tnode*, %struct.tnode** %r2
%r59 = call i64 @bintreesearch(%struct.tnode* %r58, i64 0)
%r60 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r59)
%r61 = sub i64 0, 999
%r62 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r61)
%r63 = load %struct.tnode*, %struct.tnode** %r2
%r64 = call i64 @bintreesearch(%struct.tnode* %r63, i64 10)
%r65 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r64)
%r66 = sub i64 0, 999
%r67 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r66)
%r68 = load %struct.tnode*, %struct.tnode** %r2
%r69 = sub i64 0, 2
%r70 = call i64 @bintreesearch(%struct.tnode* %r68, i64 %r69)
%r71 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r70)
%r72 = sub i64 0, 999
%r73 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r72)
%r74 = load %struct.tnode*, %struct.tnode** %r2
%r75 = call i64 @bintreesearch(%struct.tnode* %r74, i64 2)
%r76 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r75)
%r77 = sub i64 0, 999
%r78 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r77)
%r79 = load %struct.tnode*, %struct.tnode** %r2
%r80 = call i64 @bintreesearch(%struct.tnode* %r79, i64 3)
%r81 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r80)
%r82 = sub i64 0, 999
%r83 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r82)
%r84 = load %struct.tnode*, %struct.tnode** %r2
%r85 = call i64 @bintreesearch(%struct.tnode* %r84, i64 9)
%r86 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r85)
%r87 = sub i64 0, 999
%r88 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r87)
%r89 = load %struct.tnode*, %struct.tnode** %r2
%r90 = call i64 @bintreesearch(%struct.tnode* %r89, i64 1)
%r91 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r90)
%r92 = sub i64 0, 999
%r93 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r92)
%r94 = load %struct.tnode*, %struct.tnode** %r2
call void @freeTree(%struct.tnode* %r94)
br label %returnLabel

returnLabel:
ret void

}

define %struct.node* @myCopy(%struct.node* %r0) {
prologue:
%r1 = alloca %struct.node*
%r2 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r2
%r3 = load %struct.node*, %struct.node** %r2
%r4 = icmp eq %struct.node* %r3, null
br i1 %r4, label %lab0, label %lab1

lab0:
store %struct.node* null, %struct.node** %r1
br label %returnLabel

lab1:
br label %lab2

lab2:
%r5 = load %struct.node*, %struct.node** %r2
%r6 = getelementptr inbounds %struct.node, %struct.node* %r5, i32 0, i32 0
%r7 = load i64, i64* %r6
%r8 = call %struct.node* @add(%struct.node* null, i64 %r7)
%r9 = load %struct.node*, %struct.node** %r2
%r10 = getelementptr inbounds %struct.node, %struct.node* %r9, i32 0, i32 1
%r11 = load %struct.node*, %struct.node** %r10
%r12 = call %struct.node* @myCopy(%struct.node* %r11)
%r13 = call %struct.node* @concatLists(%struct.node* %r8, %struct.node* %r12)
store %struct.node* %r13, %struct.node** %r1
br label %returnLabel

returnLabel:
%r14 = load %struct.node*, %struct.node** %r1
ret %struct.node* %r14

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca %struct.node*
%r4 = alloca %struct.node*
%r5 = alloca %struct.node*
%r6 = alloca %struct.node*
store %struct.node* null, %struct.node** %r3
store %struct.node* null, %struct.node** %r4
store %struct.node* null, %struct.node** %r5
store i64 0, i64* %r1
%r7 = load i64, i64* %r1
%r8 = icmp slt i64 %r7, 10
br i1 %r8, label %lab0, label %lab1

lab0:
%r9 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r10 = load i64, i64* @.read_scratch
store i64 %r10, i64* %r2
%r11 = load %struct.node*, %struct.node** %r3
%r12 = load i64, i64* %r2
%r13 = call %struct.node* @add(%struct.node* %r11, i64 %r12)
store %struct.node* %r13, %struct.node** %r3
%r14 = load %struct.node*, %struct.node** %r3
%r15 = call %struct.node* @myCopy(%struct.node* %r14)
store %struct.node* %r15, %struct.node** %r4
%r16 = load %struct.node*, %struct.node** %r3
%r17 = call %struct.node* @myCopy(%struct.node* %r16)
store %struct.node* %r17, %struct.node** %r5
%r18 = load %struct.node*, %struct.node** %r4
%r19 = call %struct.node* @quickSortMain(%struct.node* %r18)
store %struct.node* %r19, %struct.node** %r6
%r20 = load %struct.node*, %struct.node** %r6
call void @freeList(%struct.node* %r20)
%r21 = load %struct.node*, %struct.node** %r5
call void @treeMain(%struct.node* %r21)
%r22 = load i64, i64* %r1
%r23 = add i64 %r22, 1
store i64 %r23, i64* %r1
%r24 = load i64, i64* %r1
%r25 = icmp slt i64 %r24, 10
br i1 %r25, label %lab0, label %lab1

lab1:
%r26 = load %struct.node*, %struct.node** %r3
call void @freeList(%struct.node* %r26)
%r27 = load %struct.node*, %struct.node** %r4
call void @freeList(%struct.node* %r27)
%r28 = load %struct.node*, %struct.node** %r5
call void @freeList(%struct.node* %r28)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r29 = load i64, i64* %r0
ret i64 %r29

}

