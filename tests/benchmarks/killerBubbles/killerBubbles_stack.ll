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
%r2 = alloca i64
%r3 = alloca %struct.Node*
%r4 = alloca %struct.Node*
store %struct.Node* %r0, %struct.Node** %r3
store %struct.Node* %r1, %struct.Node** %r4
%r5 = load %struct.Node*, %struct.Node** %r3
%r6 = getelementptr inbounds %struct.Node, %struct.Node* %r5, i32 0, i32 0
%r7 = load i64, i64* %r6
%r8 = load %struct.Node*, %struct.Node** %r4
%r9 = getelementptr inbounds %struct.Node, %struct.Node* %r8, i32 0, i32 0
%r10 = load i64, i64* %r9
%r11 = sub i64 %r7, %r10
store i64 %r11, i64* %r2
br label %returnLabel

returnLabel:
%r12 = load i64, i64* %r2
ret i64 %r12

}

define void @deathSort(%struct.Node* %r0) {
prologue:
%r1 = alloca %struct.Node*
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca %struct.Node*
store %struct.Node* %r0, %struct.Node** %r1
store i64 1, i64* %r2
%r5 = load i64, i64* %r2
%r6 = icmp eq i64 %r5, 1
br i1 %r6, label %lab0, label %lab6

lab0:
store i64 0, i64* %r2
%r7 = load %struct.Node*, %struct.Node** %r1
store %struct.Node* %r7, %struct.Node** %r4
%r8 = load %struct.Node*, %struct.Node** %r4
%r9 = getelementptr inbounds %struct.Node, %struct.Node* %r8, i32 0, i32 2
%r10 = load %struct.Node*, %struct.Node** %r9
%r11 = load %struct.Node*, %struct.Node** %r1
%r12 = icmp ne %struct.Node* %r10, %r11
br i1 %r12, label %lab1, label %lab5

lab1:
%r13 = load %struct.Node*, %struct.Node** %r4
%r14 = load %struct.Node*, %struct.Node** %r4
%r15 = getelementptr inbounds %struct.Node, %struct.Node* %r14, i32 0, i32 2
%r16 = load %struct.Node*, %struct.Node** %r15
%r17 = call i64 @compare(%struct.Node* %r13, %struct.Node* %r16)
%r18 = icmp sgt i64 %r17, 0
br i1 %r18, label %lab2, label %lab3

lab2:
%r19 = load %struct.Node*, %struct.Node** %r4
%r20 = getelementptr inbounds %struct.Node, %struct.Node* %r19, i32 0, i32 0
%r21 = load i64, i64* %r20
store i64 %r21, i64* %r3
%r22 = load %struct.Node*, %struct.Node** %r4
%r23 = getelementptr inbounds %struct.Node, %struct.Node* %r22, i32 0, i32 0
%r24 = load %struct.Node*, %struct.Node** %r4
%r25 = getelementptr inbounds %struct.Node, %struct.Node* %r24, i32 0, i32 2
%r26 = load %struct.Node*, %struct.Node** %r25
%r27 = getelementptr inbounds %struct.Node, %struct.Node* %r26, i32 0, i32 0
%r28 = load i64, i64* %r27
store i64 %r28, i64* %r23
%r29 = load %struct.Node*, %struct.Node** %r4
%r30 = getelementptr inbounds %struct.Node, %struct.Node* %r29, i32 0, i32 2
%r31 = load %struct.Node*, %struct.Node** %r30
%r32 = getelementptr inbounds %struct.Node, %struct.Node* %r31, i32 0, i32 0
%r33 = load i64, i64* %r3
store i64 %r33, i64* %r32
store i64 1, i64* %r2
br label %lab4

lab3:
br label %lab4

lab4:
%r34 = load %struct.Node*, %struct.Node** %r4
%r35 = getelementptr inbounds %struct.Node, %struct.Node* %r34, i32 0, i32 2
%r36 = load %struct.Node*, %struct.Node** %r35
store %struct.Node* %r36, %struct.Node** %r4
%r37 = load %struct.Node*, %struct.Node** %r4
%r38 = getelementptr inbounds %struct.Node, %struct.Node* %r37, i32 0, i32 2
%r39 = load %struct.Node*, %struct.Node** %r38
%r40 = load %struct.Node*, %struct.Node** %r1
%r41 = icmp ne %struct.Node* %r39, %r40
br i1 %r41, label %lab1, label %lab5

lab5:
%r42 = load i64, i64* %r2
%r43 = icmp eq i64 %r42, 1
br i1 %r43, label %lab0, label %lab6

lab6:
br label %returnLabel

returnLabel:
ret void

}

define void @printEVILList(%struct.Node* %r0) {
prologue:
%r1 = alloca %struct.Node*
%r2 = alloca %struct.Node*
%r3 = alloca %struct.Node*
store %struct.Node* %r0, %struct.Node** %r1
%r4 = load %struct.Node*, %struct.Node** %r1
%r5 = getelementptr inbounds %struct.Node, %struct.Node* %r4, i32 0, i32 2
%r6 = load %struct.Node*, %struct.Node** %r5
store %struct.Node* %r6, %struct.Node** %r2
%r7 = load %struct.Node*, %struct.Node** %r1
%r8 = getelementptr inbounds %struct.Node, %struct.Node* %r7, i32 0, i32 0
%r9 = load i64, i64* %r8
%r10 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r9)
%r11 = load %struct.Node*, %struct.Node** %r1
%r12 = bitcast %struct.Node* %r11 to i8*
call void @free(i8* %r12)
%r13 = load %struct.Node*, %struct.Node** %r2
%r14 = load %struct.Node*, %struct.Node** %r1
%r15 = icmp ne %struct.Node* %r13, %r14
br i1 %r15, label %lab0, label %lab1

lab0:
%r16 = load %struct.Node*, %struct.Node** %r2
store %struct.Node* %r16, %struct.Node** %r3
%r17 = load %struct.Node*, %struct.Node** %r2
%r18 = getelementptr inbounds %struct.Node, %struct.Node* %r17, i32 0, i32 0
%r19 = load i64, i64* %r18
%r20 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r19)
%r21 = load %struct.Node*, %struct.Node** %r2
%r22 = getelementptr inbounds %struct.Node, %struct.Node* %r21, i32 0, i32 2
%r23 = load %struct.Node*, %struct.Node** %r22
store %struct.Node* %r23, %struct.Node** %r2
%r24 = load %struct.Node*, %struct.Node** %r3
%r25 = bitcast %struct.Node* %r24 to i8*
call void @free(i8* %r25)
%r26 = load %struct.Node*, %struct.Node** %r2
%r27 = load %struct.Node*, %struct.Node** %r1
%r28 = icmp ne %struct.Node* %r26, %r27
br i1 %r28, label %lab0, label %lab1

lab1:
br label %returnLabel

returnLabel:
ret void

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca %struct.Node*
%r4 = alloca %struct.Node*
%r5 = alloca %struct.Node*
store i64 666, i64* @swapped
%r6 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r7 = load i64, i64* @.read_scratch
store i64 %r7, i64* %r1
%r8 = load i64, i64* %r1
%r9 = icmp sle i64 %r8, 0
br i1 %r9, label %lab0, label %lab1

lab0:
%r10 = sub i64 0, 1
%r11 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r10)
%r12 = sub i64 0, 1
store i64 %r12, i64* %r0
br label %returnLabel

lab1:
br label %lab2

lab2:
%r13 = load i64, i64* %r1
%r14 = mul i64 %r13, 1000
store i64 %r14, i64* %r1
%r15 = load i64, i64* %r1
store i64 %r15, i64* %r2
%r16 = call i8* @malloc(i64 24)
%r17 = bitcast i8* %r16 to %struct.Node*
store %struct.Node* %r17, %struct.Node** %r4
%r18 = load %struct.Node*, %struct.Node** %r4
%r19 = getelementptr inbounds %struct.Node, %struct.Node* %r18, i32 0, i32 0
%r20 = load i64, i64* %r2
store i64 %r20, i64* %r19
%r21 = load %struct.Node*, %struct.Node** %r4
%r22 = getelementptr inbounds %struct.Node, %struct.Node* %r21, i32 0, i32 1
%r23 = load %struct.Node*, %struct.Node** %r4
store %struct.Node* %r23, %struct.Node** %r22
%r24 = load %struct.Node*, %struct.Node** %r4
%r25 = getelementptr inbounds %struct.Node, %struct.Node* %r24, i32 0, i32 2
%r26 = load %struct.Node*, %struct.Node** %r4
store %struct.Node* %r26, %struct.Node** %r25
%r27 = load i64, i64* %r2
%r28 = sub i64 %r27, 1
store i64 %r28, i64* %r2
%r29 = load %struct.Node*, %struct.Node** %r4
store %struct.Node* %r29, %struct.Node** %r5
%r30 = load i64, i64* %r2
%r31 = icmp sgt i64 %r30, 0
br i1 %r31, label %lab3, label %lab4

lab3:
%r32 = call i8* @malloc(i64 24)
%r33 = bitcast i8* %r32 to %struct.Node*
store %struct.Node* %r33, %struct.Node** %r3
%r34 = load %struct.Node*, %struct.Node** %r3
%r35 = getelementptr inbounds %struct.Node, %struct.Node* %r34, i32 0, i32 0
%r36 = load i64, i64* %r2
store i64 %r36, i64* %r35
%r37 = load %struct.Node*, %struct.Node** %r3
%r38 = getelementptr inbounds %struct.Node, %struct.Node* %r37, i32 0, i32 1
%r39 = load %struct.Node*, %struct.Node** %r5
store %struct.Node* %r39, %struct.Node** %r38
%r40 = load %struct.Node*, %struct.Node** %r3
%r41 = getelementptr inbounds %struct.Node, %struct.Node* %r40, i32 0, i32 2
%r42 = load %struct.Node*, %struct.Node** %r4
store %struct.Node* %r42, %struct.Node** %r41
%r43 = load %struct.Node*, %struct.Node** %r5
%r44 = getelementptr inbounds %struct.Node, %struct.Node* %r43, i32 0, i32 2
%r45 = load %struct.Node*, %struct.Node** %r3
store %struct.Node* %r45, %struct.Node** %r44
%r46 = load %struct.Node*, %struct.Node** %r3
store %struct.Node* %r46, %struct.Node** %r5
%r47 = load i64, i64* %r2
%r48 = sub i64 %r47, 1
store i64 %r48, i64* %r2
%r49 = load i64, i64* %r2
%r50 = icmp sgt i64 %r49, 0
br i1 %r50, label %lab3, label %lab4

lab4:
%r51 = load %struct.Node*, %struct.Node** %r4
call void @deathSort(%struct.Node* %r51)
%r52 = load %struct.Node*, %struct.Node** %r4
call void @printEVILList(%struct.Node* %r52)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r53 = load i64, i64* %r0
ret i64 %r53

}

