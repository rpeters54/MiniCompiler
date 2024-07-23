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
%r2 = icmp eq %struct.node* %r0, null
br i1 %r2, label %returnLabel, label %lab2

lab2:
%r5 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 1
%r6 = load %struct.node*, %struct.node** %r5
%r7 = icmp ne %struct.node* %r6, null
br i1 %r7, label %lab3, label %lab4

lab3:
%r8 = phi %struct.node* [%r0, %lab2], [%r10, %lab3]
%r9 = getelementptr inbounds %struct.node, %struct.node* %r8, i32 0, i32 1
%r10 = load %struct.node*, %struct.node** %r9
%r11 = getelementptr inbounds %struct.node, %struct.node* %r10, i32 0, i32 1
%r12 = load %struct.node*, %struct.node** %r11
%r13 = icmp ne %struct.node* %r12, null
br i1 %r13, label %lab3, label %lab4

lab4:
%r14 = phi %struct.node* [%r0, %lab2], [%r10, %lab3]
%r16 = phi %struct.node* [%r1, %lab2], [%r1, %lab3]
%r17 = phi %struct.node* [%r0, %lab2], [%r0, %lab3]
%r15 = getelementptr inbounds %struct.node, %struct.node* %r14, i32 0, i32 1
store %struct.node* %r16, %struct.node** %r15
br label %returnLabel

returnLabel:
%r18 = phi %struct.node* [%r1, %prologue], [%r17, %lab4]
ret %struct.node* %r18

}

define %struct.node* @add(%struct.node* %r0, i64 %r1) {
prologue:
%r2 = call i8* @malloc(i64 16)
%r3 = bitcast i8* %r2 to %struct.node*
%r4 = getelementptr inbounds %struct.node, %struct.node* %r3, i32 0, i32 0
store i64 %r1, i64* %r4
%r5 = getelementptr inbounds %struct.node, %struct.node* %r3, i32 0, i32 1
store %struct.node* %r0, %struct.node** %r5
ret %struct.node* %r3

}

define i64 @size(%struct.node* %r0) {
prologue:
%r1 = icmp eq %struct.node* %r0, null
br i1 %r1, label %returnLabel, label %lab2

lab2:
%r3 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 1
%r4 = load %struct.node*, %struct.node** %r3
%r5 = call i64 @size(%struct.node* %r4)
%r6 = add i64 1, %r5
br label %returnLabel

returnLabel:
%r7 = phi i64 [0, %prologue], [%r6, %lab2]
ret i64 %r7

}

define i64 @get(%struct.node* %r0, i64 %r1) {
prologue:
%r2 = icmp eq i64 %r1, 0
br i1 %r2, label %lab0, label %lab2

lab0:
%r4 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 0
%r5 = load i64, i64* %r4
br label %returnLabel

lab2:
%r7 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 1
%r8 = load %struct.node*, %struct.node** %r7
%r10 = sub i64 %r1, 1
%r11 = call i64 @get(%struct.node* %r8, i64 %r10)
br label %returnLabel

returnLabel:
%r12 = phi i64 [%r5, %lab0], [%r11, %lab2]
ret i64 %r12

}

define %struct.node* @pop(%struct.node* %r0) {
prologue:
%r1 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 1
%r2 = load %struct.node*, %struct.node** %r1
ret %struct.node* %r2

}

define void @printList(%struct.node* %r0) {
prologue:
%r1 = icmp ne %struct.node* %r0, null
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r3 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 0
%r4 = load i64, i64* %r3
%r5 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r4)
%r6 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 1
%r7 = load %struct.node*, %struct.node** %r6
call void @printList(%struct.node* %r7)
br label %returnLabel

returnLabel:
ret void

}

define void @treeprint(%struct.tnode* %r0) {
prologue:
%r1 = icmp ne %struct.tnode* %r0, null
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r3 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 1
%r4 = load %struct.tnode*, %struct.tnode** %r3
call void @treeprint(%struct.tnode* %r4)
%r5 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 0
%r6 = load i64, i64* %r5
%r7 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r6)
%r8 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 2
%r9 = load %struct.tnode*, %struct.tnode** %r8
call void @treeprint(%struct.tnode* %r9)
br label %returnLabel

returnLabel:
ret void

}

define void @freeList(%struct.node* %r0) {
prologue:
%r1 = icmp ne %struct.node* %r0, null
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r3 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 1
%r4 = load %struct.node*, %struct.node** %r3
call void @freeList(%struct.node* %r4)
%r5 = bitcast %struct.node* %r0 to i8*
call void @free(i8* %r5)
br label %returnLabel

returnLabel:
ret void

}

define void @freeTree(%struct.tnode* %r0) {
prologue:
%r1 = icmp eq %struct.tnode* %r0, null
%r2 = xor i1 true, %r1
br i1 %r2, label %lab0, label %returnLabel

lab0:
%r4 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 1
%r5 = load %struct.tnode*, %struct.tnode** %r4
call void @freeTree(%struct.tnode* %r5)
%r6 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 2
%r7 = load %struct.tnode*, %struct.tnode** %r6
call void @freeTree(%struct.tnode* %r7)
%r8 = bitcast %struct.tnode* %r0 to i8*
call void @free(i8* %r8)
br label %returnLabel

returnLabel:
ret void

}

define %struct.node* @postOrder(%struct.tnode* %r0) {
prologue:
%r1 = icmp ne %struct.tnode* %r0, null
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r2 = call i8* @malloc(i64 16)
%r3 = bitcast i8* %r2 to %struct.node*
%r4 = getelementptr inbounds %struct.node, %struct.node* %r3, i32 0, i32 0
%r6 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 0
%r7 = load i64, i64* %r6
store i64 %r7, i64* %r4
%r8 = getelementptr inbounds %struct.node, %struct.node* %r3, i32 0, i32 1
store %struct.node* null, %struct.node** %r8
%r9 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 1
%r10 = load %struct.tnode*, %struct.tnode** %r9
%r11 = call %struct.node* @postOrder(%struct.tnode* %r10)
%r12 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 2
%r13 = load %struct.tnode*, %struct.tnode** %r12
%r14 = call %struct.node* @postOrder(%struct.tnode* %r13)
%r15 = call %struct.node* @concatLists(%struct.node* %r11, %struct.node* %r14)
%r16 = call %struct.node* @concatLists(%struct.node* %r15, %struct.node* %r3)
br label %returnLabel

returnLabel:
%r17 = phi %struct.node* [%r16, %lab0], [null, %prologue]
ret %struct.node* %r17

}

define %struct.tnode* @treeadd(%struct.tnode* %r0, i64 %r1) {
prologue:
%r2 = icmp eq %struct.tnode* %r0, null
br i1 %r2, label %lab0, label %lab2

lab0:
%r3 = call i8* @malloc(i64 24)
%r4 = bitcast i8* %r3 to %struct.tnode*
%r5 = getelementptr inbounds %struct.tnode, %struct.tnode* %r4, i32 0, i32 0
store i64 %r1, i64* %r5
%r7 = getelementptr inbounds %struct.tnode, %struct.tnode* %r4, i32 0, i32 1
store %struct.tnode* null, %struct.tnode** %r7
%r8 = getelementptr inbounds %struct.tnode, %struct.tnode* %r4, i32 0, i32 2
store %struct.tnode* null, %struct.tnode** %r8
br label %returnLabel

lab2:
%r11 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 0
%r12 = load i64, i64* %r11
%r13 = icmp slt i64 %r1, %r12
br i1 %r13, label %lab3, label %lab4

lab3:
%r15 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 1
%r16 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 1
%r17 = load %struct.tnode*, %struct.tnode** %r16
%r19 = call %struct.tnode* @treeadd(%struct.tnode* %r17, i64 %r1)
store %struct.tnode* %r19, %struct.tnode** %r15
br label %lab5

lab4:
%r21 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 2
%r22 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 2
%r23 = load %struct.tnode*, %struct.tnode** %r22
%r25 = call %struct.tnode* @treeadd(%struct.tnode* %r23, i64 %r1)
store %struct.tnode* %r25, %struct.tnode** %r21
br label %lab5

lab5:
%r27 = phi %struct.tnode* [%r0, %lab3], [%r0, %lab4]
br label %returnLabel

returnLabel:
%r28 = phi %struct.tnode* [%r4, %lab0], [%r27, %lab5]
ret %struct.tnode* %r28

}

define %struct.node* @quickSort(%struct.node* %r0) {
prologue:
%r1 = call i64 @size(%struct.node* %r0)
%r2 = icmp sle i64 %r1, 1
br i1 %r2, label %returnLabel, label %lab2

lab2:
%r5 = call i64 @get(%struct.node* %r0, i64 0)
%r6 = call i64 @size(%struct.node* %r0)
%r7 = sub i64 %r6, 1
%r8 = call i64 @get(%struct.node* %r0, i64 %r7)
%r9 = add i64 %r5, %r8
%r10 = sdiv i64 %r9, 2
%r11 = icmp ne %struct.node* %r0, null
br i1 %r11, label %lab3, label %lab7

lab3:
%r12 = phi %struct.node* [%r0, %lab2], [%r34, %lab6]
%r14 = phi i64 [0, %lab2], [%r35, %lab6]
%r15 = phi %struct.node* [%r0, %lab2], [%r30, %lab6]
%r16 = call i64 @get(%struct.node* %r15, i64 %r14)
%r17 = icmp sgt i64 %r16, %r10
br i1 %r17, label %lab4, label %lab5

lab4:
%r21 = call i64 @get(%struct.node* %r15, i64 %r14)
%r22 = call %struct.node* @add(%struct.node* null, i64 %r21)
br label %lab6

lab5:
%r26 = call i64 @get(%struct.node* %r15, i64 %r14)
%r27 = call %struct.node* @add(%struct.node* null, i64 %r26)
br label %lab6

lab6:
%r28 = phi i64 [%r14, %lab4], [%r14, %lab5]
%r29 = phi %struct.node* [null, %lab4], [%r27, %lab5]
%r30 = phi %struct.node* [%r15, %lab4], [%r15, %lab5]
%r31 = phi %struct.node* [%r22, %lab4], [null, %lab5]
%r32 = phi %struct.node* [%r12, %lab4], [%r12, %lab5]
%r33 = getelementptr inbounds %struct.node, %struct.node* %r32, i32 0, i32 1
%r34 = load %struct.node*, %struct.node** %r33
%r35 = add i64 %r28, 1
%r36 = icmp ne %struct.node* %r34, null
br i1 %r36, label %lab3, label %lab7

lab7:
%r40 = phi %struct.node* [%r0, %lab2], [%r30, %lab6]
%r41 = phi %struct.node* [null, %lab2], [%r29, %lab6]
%r43 = phi %struct.node* [null, %lab2], [%r31, %lab6]
call void @freeList(%struct.node* %r40)
%r42 = call %struct.node* @quickSort(%struct.node* %r41)
%r44 = call %struct.node* @quickSort(%struct.node* %r43)
%r45 = call %struct.node* @concatLists(%struct.node* %r42, %struct.node* %r44)
br label %returnLabel

returnLabel:
%r46 = phi %struct.node* [%r0, %prologue], [%r45, %lab7]
ret %struct.node* %r46

}

define %struct.node* @quickSortMain(%struct.node* %r0) {
prologue:
call void @printList(%struct.node* %r0)
%r2 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
call void @printList(%struct.node* %r0)
%r4 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
call void @printList(%struct.node* %r0)
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
ret %struct.node* null

}

define i64 @treesearch(%struct.tnode* %r0, i64 %r1) {
prologue:
%r3 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -1)
%r4 = icmp ne %struct.tnode* %r0, null
br i1 %r4, label %lab0, label %returnLabel

lab0:
%r6 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 0
%r7 = load i64, i64* %r6
%r9 = icmp eq i64 %r7, %r1
br i1 %r9, label %returnLabel, label %lab3

lab3:
%r11 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 1
%r12 = load %struct.tnode*, %struct.tnode** %r11
%r14 = call i64 @treesearch(%struct.tnode* %r12, i64 %r1)
%r15 = icmp eq i64 %r14, 1
br i1 %r15, label %returnLabel, label %lab6

lab6:
%r17 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 2
%r18 = load %struct.tnode*, %struct.tnode** %r17
%r20 = call i64 @treesearch(%struct.tnode* %r18, i64 %r1)
%r21 = icmp eq i64 %r20, 1
%r23 = select i1 %r21, i64 1, i64 0
br label %returnLabel

returnLabel:
%r22 = phi i64 [1, %lab0], [1, %lab3], [0, %prologue], [%r23, %lab6]
ret i64 %r22

}

define %struct.node* @inOrder(%struct.tnode* %r0) {
prologue:
%r1 = icmp ne %struct.tnode* %r0, null
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r2 = call i8* @malloc(i64 16)
%r3 = bitcast i8* %r2 to %struct.node*
%r4 = getelementptr inbounds %struct.node, %struct.node* %r3, i32 0, i32 0
%r6 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 0
%r7 = load i64, i64* %r6
store i64 %r7, i64* %r4
%r8 = getelementptr inbounds %struct.node, %struct.node* %r3, i32 0, i32 1
store %struct.node* null, %struct.node** %r8
%r9 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 1
%r10 = load %struct.tnode*, %struct.tnode** %r9
%r11 = call %struct.node* @inOrder(%struct.tnode* %r10)
%r12 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 2
%r13 = load %struct.tnode*, %struct.tnode** %r12
%r14 = call %struct.node* @inOrder(%struct.tnode* %r13)
%r15 = call %struct.node* @concatLists(%struct.node* %r3, %struct.node* %r14)
%r16 = call %struct.node* @concatLists(%struct.node* %r11, %struct.node* %r15)
br label %returnLabel

returnLabel:
%r17 = phi %struct.node* [%r16, %lab0], [null, %prologue]
ret %struct.node* %r17

}

define i64 @bintreesearch(%struct.tnode* %r0, i64 %r1) {
prologue:
%r3 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -1)
%r4 = icmp ne %struct.tnode* %r0, null
br i1 %r4, label %lab0, label %returnLabel

lab0:
%r6 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 0
%r7 = load i64, i64* %r6
%r9 = icmp eq i64 %r7, %r1
br i1 %r9, label %returnLabel, label %lab3

lab3:
%r12 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 0
%r13 = load i64, i64* %r12
%r14 = icmp slt i64 %r1, %r13
br i1 %r14, label %lab4, label %lab5

lab4:
%r16 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 1
%r17 = load %struct.tnode*, %struct.tnode** %r16
%r19 = call i64 @bintreesearch(%struct.tnode* %r17, i64 %r1)
br label %returnLabel

lab5:
%r21 = getelementptr inbounds %struct.tnode, %struct.tnode* %r0, i32 0, i32 2
%r22 = load %struct.tnode*, %struct.tnode** %r21
%r24 = call i64 @bintreesearch(%struct.tnode* %r22, i64 %r1)
br label %returnLabel

returnLabel:
%r25 = phi i64 [1, %lab0], [%r19, %lab4], [%r24, %lab5], [0, %prologue]
ret i64 %r25

}

define %struct.tnode* @buildTree(%struct.node* %r0) {
prologue:
%r1 = call i64 @size(%struct.node* %r0)
%r2 = icmp slt i64 0, %r1
br i1 %r2, label %lab0, label %returnLabel

lab0:
%r3 = phi %struct.tnode* [null, %prologue], [%r7, %lab0]
%r4 = phi i64 [0, %prologue], [%r8, %lab0]
%r6 = call i64 @get(%struct.node* %r0, i64 %r4)
%r7 = call %struct.tnode* @treeadd(%struct.tnode* %r3, i64 %r6)
%r8 = add i64 %r4, 1
%r9 = call i64 @size(%struct.node* %r0)
%r10 = icmp slt i64 %r8, %r9
br i1 %r10, label %lab0, label %returnLabel

returnLabel:
%r11 = phi %struct.tnode* [null, %prologue], [%r7, %lab0]
ret %struct.tnode* %r11

}

define void @treeMain(%struct.node* %r0) {
prologue:
%r1 = call %struct.tnode* @buildTree(%struct.node* %r0)
call void @treeprint(%struct.tnode* %r1)
%r3 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r4 = call %struct.node* @inOrder(%struct.tnode* %r1)
call void @printList(%struct.node* %r4)
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
call void @freeList(%struct.node* %r4)
%r7 = call %struct.node* @postOrder(%struct.tnode* %r1)
call void @printList(%struct.node* %r7)
%r9 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
call void @freeList(%struct.node* %r7)
%r10 = call i64 @treesearch(%struct.tnode* %r1, i64 0)
%r11 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r10)
%r13 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r14 = call i64 @treesearch(%struct.tnode* %r1, i64 10)
%r15 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r14)
%r17 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r19 = call i64 @treesearch(%struct.tnode* %r1, i64 -2)
%r20 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r19)
%r22 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r23 = call i64 @treesearch(%struct.tnode* %r1, i64 2)
%r24 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r23)
%r26 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r27 = call i64 @treesearch(%struct.tnode* %r1, i64 3)
%r28 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r27)
%r30 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r31 = call i64 @treesearch(%struct.tnode* %r1, i64 9)
%r32 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r31)
%r34 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r35 = call i64 @treesearch(%struct.tnode* %r1, i64 1)
%r36 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r35)
%r38 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r39 = call i64 @bintreesearch(%struct.tnode* %r1, i64 0)
%r40 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r39)
%r42 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r43 = call i64 @bintreesearch(%struct.tnode* %r1, i64 10)
%r44 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r43)
%r46 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r48 = call i64 @bintreesearch(%struct.tnode* %r1, i64 -2)
%r49 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r48)
%r51 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r52 = call i64 @bintreesearch(%struct.tnode* %r1, i64 2)
%r53 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r52)
%r55 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r56 = call i64 @bintreesearch(%struct.tnode* %r1, i64 3)
%r57 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r56)
%r59 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r60 = call i64 @bintreesearch(%struct.tnode* %r1, i64 9)
%r61 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r60)
%r63 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
%r64 = call i64 @bintreesearch(%struct.tnode* %r1, i64 1)
%r65 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r64)
%r67 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -999)
call void @freeTree(%struct.tnode* %r1)
ret void

}

define %struct.node* @myCopy(%struct.node* %r0) {
prologue:
%r1 = icmp eq %struct.node* %r0, null
br i1 %r1, label %returnLabel, label %lab2

lab2:
%r3 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 0
%r4 = load i64, i64* %r3
%r5 = call %struct.node* @add(%struct.node* null, i64 %r4)
%r6 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 1
%r7 = load %struct.node*, %struct.node** %r6
%r8 = call %struct.node* @myCopy(%struct.node* %r7)
%r9 = call %struct.node* @concatLists(%struct.node* %r5, %struct.node* %r8)
br label %returnLabel

returnLabel:
%r10 = phi %struct.node* [null, %prologue], [%r9, %lab2]
ret %struct.node* %r10

}

define i64 @main() {
prologue:
br i1 true, label %lab0, label %returnLabel

lab0:
%r3 = phi %struct.node* [null, %prologue], [%r7, %lab0]
%r4 = phi i64 [0, %prologue], [%r11, %lab0]
%r5 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r6 = load i64, i64* @.read_scratch
%r7 = call %struct.node* @add(%struct.node* %r3, i64 %r6)
%r8 = call %struct.node* @myCopy(%struct.node* %r7)
%r9 = call %struct.node* @myCopy(%struct.node* %r7)
%r10 = call %struct.node* @quickSortMain(%struct.node* %r8)
call void @freeList(%struct.node* %r10)
call void @treeMain(%struct.node* %r9)
%r11 = add i64 %r4, 1
%r12 = icmp slt i64 %r11, 10
br i1 %r12, label %lab0, label %returnLabel

returnLabel:
%r13 = phi %struct.node* [null, %prologue], [%r8, %lab0]
%r14 = phi %struct.node* [null, %prologue], [%r9, %lab0]
%r15 = phi %struct.node* [null, %prologue], [%r7, %lab0]
call void @freeList(%struct.node* %r15)
call void @freeList(%struct.node* %r13)
call void @freeList(%struct.node* %r14)
ret i64 0

}

