declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.Node = type {i64, %struct.Node*, %struct.Node*}
@swapped = common global i64 0

define i64 @compare(%struct.Node* %r0, %struct.Node* %r1) {
prologue:
%r2 = getelementptr inbounds %struct.Node, %struct.Node* %r0, i32 0, i32 0
%r3 = load i64, i64* %r2
%r4 = getelementptr inbounds %struct.Node, %struct.Node* %r1, i32 0, i32 0
%r5 = load i64, i64* %r4
%r6 = sub i64 %r3, %r5
ret i64 %r6

}

define void @deathSort(%struct.Node* %r0) {
prologue:
br i1 true, label %lab0, label %returnLabel

lab0:
%r2 = phi %struct.Node* [%r0, %prologue], [%r33, %lab5]
%r4 = getelementptr inbounds %struct.Node, %struct.Node* %r2, i32 0, i32 2
%r5 = load %struct.Node*, %struct.Node** %r4
%r6 = icmp ne %struct.Node* %r5, %r2
br i1 %r6, label %lab1, label %lab5

lab1:
%r8 = phi i64 [0, %lab0], [%r25, %lab4]
%r9 = phi %struct.Node* [%r2, %lab0], [%r28, %lab4]
%r10 = getelementptr inbounds %struct.Node, %struct.Node* %r9, i32 0, i32 2
%r11 = load %struct.Node*, %struct.Node** %r10
%r12 = call i64 @compare(%struct.Node* %r9, %struct.Node* %r11)
%r13 = icmp sgt i64 %r12, 0
br i1 %r13, label %lab2, label %lab4

lab2:
%r15 = getelementptr inbounds %struct.Node, %struct.Node* %r9, i32 0, i32 0
%r16 = load i64, i64* %r15
%r17 = getelementptr inbounds %struct.Node, %struct.Node* %r9, i32 0, i32 0
%r18 = getelementptr inbounds %struct.Node, %struct.Node* %r9, i32 0, i32 2
%r19 = load %struct.Node*, %struct.Node** %r18
%r20 = getelementptr inbounds %struct.Node, %struct.Node* %r19, i32 0, i32 0
%r21 = load i64, i64* %r20
store i64 %r21, i64* %r17
%r22 = getelementptr inbounds %struct.Node, %struct.Node* %r9, i32 0, i32 2
%r23 = load %struct.Node*, %struct.Node** %r22
%r24 = getelementptr inbounds %struct.Node, %struct.Node* %r23, i32 0, i32 0
store i64 %r16, i64* %r24
br label %lab4

lab4:
%r25 = phi i64 [1, %lab2], [%r8, %lab1]
%r26 = phi %struct.Node* [%r9, %lab2], [%r9, %lab1]
%r31 = phi %struct.Node* [%r2, %lab2], [%r2, %lab1]
%r27 = getelementptr inbounds %struct.Node, %struct.Node* %r26, i32 0, i32 2
%r28 = load %struct.Node*, %struct.Node** %r27
%r29 = getelementptr inbounds %struct.Node, %struct.Node* %r28, i32 0, i32 2
%r30 = load %struct.Node*, %struct.Node** %r29
%r32 = icmp ne %struct.Node* %r30, %r31
br i1 %r32, label %lab1, label %lab5

lab5:
%r33 = phi %struct.Node* [%r2, %lab0], [%r31, %lab4]
%r34 = phi i64 [0, %lab0], [%r25, %lab4]
%r36 = icmp eq i64 %r34, 1
br i1 %r36, label %lab0, label %returnLabel

returnLabel:
ret void

}

define void @printEVILList(%struct.Node* %r0) {
prologue:
%r1 = getelementptr inbounds %struct.Node, %struct.Node* %r0, i32 0, i32 2
%r2 = load %struct.Node*, %struct.Node** %r1
%r3 = getelementptr inbounds %struct.Node, %struct.Node* %r0, i32 0, i32 0
%r4 = load i64, i64* %r3
%r5 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r4)
%r6 = bitcast %struct.Node* %r0 to i8*
call void @free(i8* %r6)
%r7 = icmp ne %struct.Node* %r2, %r0
br i1 %r7, label %lab0, label %returnLabel

lab0:
%r9 = phi %struct.Node* [%r2, %prologue], [%r14, %lab0]
%r10 = getelementptr inbounds %struct.Node, %struct.Node* %r9, i32 0, i32 0
%r11 = load i64, i64* %r10
%r12 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r11)
%r13 = getelementptr inbounds %struct.Node, %struct.Node* %r9, i32 0, i32 2
%r14 = load %struct.Node*, %struct.Node** %r13
%r15 = bitcast %struct.Node* %r9 to i8*
call void @free(i8* %r15)
%r16 = icmp ne %struct.Node* %r14, %r0
br i1 %r16, label %lab0, label %returnLabel

returnLabel:
ret void

}

define i64 @main() {
prologue:
store i64 666, i64* @swapped
%r0 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r1 = load i64, i64* @.read_scratch
%r2 = icmp sle i64 %r1, 0
br i1 %r2, label %lab0, label %lab2

lab0:
%r4 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 -1)
br label %returnLabel

lab2:
%r7 = mul i64 %r1, 1000
%r8 = call i8* @malloc(i64 24)
%r9 = bitcast i8* %r8 to %struct.Node*
%r10 = getelementptr inbounds %struct.Node, %struct.Node* %r9, i32 0, i32 0
store i64 %r7, i64* %r10
%r11 = getelementptr inbounds %struct.Node, %struct.Node* %r9, i32 0, i32 1
store %struct.Node* %r9, %struct.Node** %r11
%r12 = getelementptr inbounds %struct.Node, %struct.Node* %r9, i32 0, i32 2
store %struct.Node* %r9, %struct.Node** %r12
%r13 = sub i64 %r7, 1
%r14 = icmp sgt i64 %r13, 0
br i1 %r14, label %lab3, label %lab4

lab3:
%r17 = phi %struct.Node* [%r9, %lab2], [%r20, %lab3]
%r18 = phi i64 [%r13, %lab2], [%r25, %lab3]
%r19 = call i8* @malloc(i64 24)
%r20 = bitcast i8* %r19 to %struct.Node*
%r21 = getelementptr inbounds %struct.Node, %struct.Node* %r20, i32 0, i32 0
store i64 %r18, i64* %r21
%r22 = getelementptr inbounds %struct.Node, %struct.Node* %r20, i32 0, i32 1
store %struct.Node* %r17, %struct.Node** %r22
%r23 = getelementptr inbounds %struct.Node, %struct.Node* %r20, i32 0, i32 2
store %struct.Node* %r9, %struct.Node** %r23
%r24 = getelementptr inbounds %struct.Node, %struct.Node* %r17, i32 0, i32 2
store %struct.Node* %r20, %struct.Node** %r24
%r25 = sub i64 %r18, 1
%r26 = icmp sgt i64 %r25, 0
br i1 %r26, label %lab3, label %lab4

lab4:
%r27 = phi %struct.Node* [%r9, %lab2], [%r9, %lab3]
call void @deathSort(%struct.Node* %r27)
call void @printEVILList(%struct.Node* %r27)
br label %returnLabel

returnLabel:
%r31 = phi i64 [-1, %lab0], [0, %lab4]
ret i64 %r31

}

