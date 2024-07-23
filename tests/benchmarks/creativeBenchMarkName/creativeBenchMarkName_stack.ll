declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.node = type {i64, %struct.node*}

define %struct.node* @buildList() {
prologue:
%r0 = alloca %struct.node*
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca %struct.node*
%r4 = alloca %struct.node*
%r5 = alloca %struct.node*
%r6 = alloca %struct.node*
%r7 = alloca %struct.node*
%r8 = alloca %struct.node*
%r9 = call i8* @malloc(i64 16)
%r10 = bitcast i8* %r9 to %struct.node*
store %struct.node* %r10, %struct.node** %r3
%r11 = call i8* @malloc(i64 16)
%r12 = bitcast i8* %r11 to %struct.node*
store %struct.node* %r12, %struct.node** %r4
%r13 = call i8* @malloc(i64 16)
%r14 = bitcast i8* %r13 to %struct.node*
store %struct.node* %r14, %struct.node** %r5
%r15 = call i8* @malloc(i64 16)
%r16 = bitcast i8* %r15 to %struct.node*
store %struct.node* %r16, %struct.node** %r6
%r17 = call i8* @malloc(i64 16)
%r18 = bitcast i8* %r17 to %struct.node*
store %struct.node* %r18, %struct.node** %r7
%r19 = call i8* @malloc(i64 16)
%r20 = bitcast i8* %r19 to %struct.node*
store %struct.node* %r20, %struct.node** %r8
%r21 = load %struct.node*, %struct.node** %r3
%r22 = getelementptr inbounds %struct.node, %struct.node* %r21, i32 0, i32 0
%r23 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r24 = load i64, i64* @.read_scratch
store i64 %r24, i64* %r22
%r25 = load %struct.node*, %struct.node** %r4
%r26 = getelementptr inbounds %struct.node, %struct.node* %r25, i32 0, i32 0
%r27 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r28 = load i64, i64* @.read_scratch
store i64 %r28, i64* %r26
%r29 = load %struct.node*, %struct.node** %r5
%r30 = getelementptr inbounds %struct.node, %struct.node* %r29, i32 0, i32 0
%r31 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r32 = load i64, i64* @.read_scratch
store i64 %r32, i64* %r30
%r33 = load %struct.node*, %struct.node** %r6
%r34 = getelementptr inbounds %struct.node, %struct.node* %r33, i32 0, i32 0
%r35 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r36 = load i64, i64* @.read_scratch
store i64 %r36, i64* %r34
%r37 = load %struct.node*, %struct.node** %r7
%r38 = getelementptr inbounds %struct.node, %struct.node* %r37, i32 0, i32 0
%r39 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r40 = load i64, i64* @.read_scratch
store i64 %r40, i64* %r38
%r41 = load %struct.node*, %struct.node** %r8
%r42 = getelementptr inbounds %struct.node, %struct.node* %r41, i32 0, i32 0
%r43 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r44 = load i64, i64* @.read_scratch
store i64 %r44, i64* %r42
%r45 = load %struct.node*, %struct.node** %r3
%r46 = getelementptr inbounds %struct.node, %struct.node* %r45, i32 0, i32 1
%r47 = load %struct.node*, %struct.node** %r4
store %struct.node* %r47, %struct.node** %r46
%r48 = load %struct.node*, %struct.node** %r4
%r49 = getelementptr inbounds %struct.node, %struct.node* %r48, i32 0, i32 1
%r50 = load %struct.node*, %struct.node** %r5
store %struct.node* %r50, %struct.node** %r49
%r51 = load %struct.node*, %struct.node** %r5
%r52 = getelementptr inbounds %struct.node, %struct.node* %r51, i32 0, i32 1
%r53 = load %struct.node*, %struct.node** %r6
store %struct.node* %r53, %struct.node** %r52
%r54 = load %struct.node*, %struct.node** %r6
%r55 = getelementptr inbounds %struct.node, %struct.node* %r54, i32 0, i32 1
%r56 = load %struct.node*, %struct.node** %r7
store %struct.node* %r56, %struct.node** %r55
%r57 = load %struct.node*, %struct.node** %r7
%r58 = getelementptr inbounds %struct.node, %struct.node* %r57, i32 0, i32 1
%r59 = load %struct.node*, %struct.node** %r8
store %struct.node* %r59, %struct.node** %r58
%r60 = load %struct.node*, %struct.node** %r8
%r61 = getelementptr inbounds %struct.node, %struct.node* %r60, i32 0, i32 1
store %struct.node* null, %struct.node** %r61
%r62 = load %struct.node*, %struct.node** %r3
store %struct.node* %r62, %struct.node** %r0
br label %returnLabel

returnLabel:
%r63 = load %struct.node*, %struct.node** %r0
ret %struct.node* %r63

}

define i64 @multiple(%struct.node* %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca %struct.node*
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r2
store i64 0, i64* %r3
%r6 = load %struct.node*, %struct.node** %r2
store %struct.node* %r6, %struct.node** %r5
%r7 = load %struct.node*, %struct.node** %r5
%r8 = getelementptr inbounds %struct.node, %struct.node* %r7, i32 0, i32 0
%r9 = load i64, i64* %r8
store i64 %r9, i64* %r4
%r10 = load %struct.node*, %struct.node** %r5
%r11 = getelementptr inbounds %struct.node, %struct.node* %r10, i32 0, i32 1
%r12 = load %struct.node*, %struct.node** %r11
store %struct.node* %r12, %struct.node** %r5
%r13 = load i64, i64* %r3
%r14 = icmp slt i64 %r13, 5
br i1 %r14, label %lab0, label %lab1

lab0:
%r15 = load i64, i64* %r4
%r16 = load %struct.node*, %struct.node** %r5
%r17 = getelementptr inbounds %struct.node, %struct.node* %r16, i32 0, i32 0
%r18 = load i64, i64* %r17
%r19 = mul i64 %r15, %r18
store i64 %r19, i64* %r4
%r20 = load %struct.node*, %struct.node** %r5
%r21 = getelementptr inbounds %struct.node, %struct.node* %r20, i32 0, i32 1
%r22 = load %struct.node*, %struct.node** %r21
store %struct.node* %r22, %struct.node** %r5
%r23 = load i64, i64* %r4
%r24 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r23)
%r25 = load i64, i64* %r3
%r26 = add i64 %r25, 1
store i64 %r26, i64* %r3
%r27 = load i64, i64* %r3
%r28 = icmp slt i64 %r27, 5
br i1 %r28, label %lab0, label %lab1

lab1:
%r29 = load i64, i64* %r4
store i64 %r29, i64* %r1
br label %returnLabel

returnLabel:
%r30 = load i64, i64* %r1
ret i64 %r30

}

define i64 @add(%struct.node* %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca %struct.node*
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r2
store i64 0, i64* %r3
%r6 = load %struct.node*, %struct.node** %r2
store %struct.node* %r6, %struct.node** %r5
%r7 = load %struct.node*, %struct.node** %r5
%r8 = getelementptr inbounds %struct.node, %struct.node* %r7, i32 0, i32 0
%r9 = load i64, i64* %r8
store i64 %r9, i64* %r4
%r10 = load %struct.node*, %struct.node** %r5
%r11 = getelementptr inbounds %struct.node, %struct.node* %r10, i32 0, i32 1
%r12 = load %struct.node*, %struct.node** %r11
store %struct.node* %r12, %struct.node** %r5
%r13 = load i64, i64* %r3
%r14 = icmp slt i64 %r13, 5
br i1 %r14, label %lab0, label %lab1

lab0:
%r15 = load i64, i64* %r4
%r16 = load %struct.node*, %struct.node** %r5
%r17 = getelementptr inbounds %struct.node, %struct.node* %r16, i32 0, i32 0
%r18 = load i64, i64* %r17
%r19 = add i64 %r15, %r18
store i64 %r19, i64* %r4
%r20 = load %struct.node*, %struct.node** %r5
%r21 = getelementptr inbounds %struct.node, %struct.node* %r20, i32 0, i32 1
%r22 = load %struct.node*, %struct.node** %r21
store %struct.node* %r22, %struct.node** %r5
%r23 = load i64, i64* %r4
%r24 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r23)
%r25 = load i64, i64* %r3
%r26 = add i64 %r25, 1
store i64 %r26, i64* %r3
%r27 = load i64, i64* %r3
%r28 = icmp slt i64 %r27, 5
br i1 %r28, label %lab0, label %lab1

lab1:
%r29 = load i64, i64* %r4
store i64 %r29, i64* %r1
br label %returnLabel

returnLabel:
%r30 = load i64, i64* %r1
ret i64 %r30

}

define i64 @recurseList(%struct.node* %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca %struct.node*
store %struct.node* %r0, %struct.node** %r2
%r3 = load %struct.node*, %struct.node** %r2
%r4 = getelementptr inbounds %struct.node, %struct.node* %r3, i32 0, i32 1
%r5 = load %struct.node*, %struct.node** %r4
%r6 = icmp eq %struct.node* %r5, null
br i1 %r6, label %lab0, label %lab1

lab0:
%r7 = load %struct.node*, %struct.node** %r2
%r8 = getelementptr inbounds %struct.node, %struct.node* %r7, i32 0, i32 0
%r9 = load i64, i64* %r8
store i64 %r9, i64* %r1
br label %returnLabel

lab1:
%r10 = load %struct.node*, %struct.node** %r2
%r11 = getelementptr inbounds %struct.node, %struct.node* %r10, i32 0, i32 0
%r12 = load i64, i64* %r11
%r13 = load %struct.node*, %struct.node** %r2
%r14 = getelementptr inbounds %struct.node, %struct.node* %r13, i32 0, i32 1
%r15 = load %struct.node*, %struct.node** %r14
%r16 = call i64 @recurseList(%struct.node* %r15)
%r17 = mul i64 %r12, %r16
store i64 %r17, i64* %r1
br label %returnLabel

returnLabel:
%r18 = load i64, i64* %r1
ret i64 %r18

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca %struct.node*
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca i64
store i64 0, i64* %r6
store i64 0, i64* %r5
%r7 = call %struct.node* @buildList()
store %struct.node* %r7, %struct.node** %r1
%r8 = load %struct.node*, %struct.node** %r1
%r9 = call i64 @multiple(%struct.node* %r8)
store i64 %r9, i64* %r2
%r10 = load %struct.node*, %struct.node** %r1
%r11 = call i64 @add(%struct.node* %r10)
store i64 %r11, i64* %r3
%r12 = load i64, i64* %r2
%r13 = load i64, i64* %r3
%r14 = sdiv i64 %r13, 2
%r15 = sub i64 %r12, %r14
store i64 %r15, i64* %r4
%r16 = load i64, i64* %r6
%r17 = icmp slt i64 %r16, 2
br i1 %r17, label %lab0, label %lab1

lab0:
%r18 = load i64, i64* %r5
%r19 = load %struct.node*, %struct.node** %r1
%r20 = call i64 @recurseList(%struct.node* %r19)
%r21 = add i64 %r18, %r20
store i64 %r21, i64* %r5
%r22 = load i64, i64* %r6
%r23 = add i64 %r22, 1
store i64 %r23, i64* %r6
%r24 = load i64, i64* %r6
%r25 = icmp slt i64 %r24, 2
br i1 %r25, label %lab0, label %lab1

lab1:
%r26 = load i64, i64* %r5
%r27 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r26)
%r28 = load i64, i64* %r5
%r29 = icmp ne i64 %r28, 0
br i1 %r29, label %lab2, label %lab3

lab2:
%r30 = load i64, i64* %r5
%r31 = sub i64 %r30, 1
store i64 %r31, i64* %r5
%r32 = load i64, i64* %r5
%r33 = icmp ne i64 %r32, 0
br i1 %r33, label %lab2, label %lab3

lab3:
%r34 = load i64, i64* %r4
%r35 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r34)
%r36 = load i64, i64* %r5
%r37 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r36)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r38 = load i64, i64* %r0
ret i64 %r38

}

