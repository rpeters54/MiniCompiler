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
%r0 = call i8* @malloc(i64 16)
%r1 = bitcast i8* %r0 to %struct.node*
%r2 = call i8* @malloc(i64 16)
%r3 = bitcast i8* %r2 to %struct.node*
%r4 = call i8* @malloc(i64 16)
%r5 = bitcast i8* %r4 to %struct.node*
%r6 = call i8* @malloc(i64 16)
%r7 = bitcast i8* %r6 to %struct.node*
%r8 = call i8* @malloc(i64 16)
%r9 = bitcast i8* %r8 to %struct.node*
%r10 = call i8* @malloc(i64 16)
%r11 = bitcast i8* %r10 to %struct.node*
%r12 = getelementptr inbounds %struct.node, %struct.node* %r1, i32 0, i32 0
%r13 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r14 = load i64, i64* @.read_scratch
store i64 %r14, i64* %r12
%r15 = getelementptr inbounds %struct.node, %struct.node* %r3, i32 0, i32 0
%r16 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r17 = load i64, i64* @.read_scratch
store i64 %r17, i64* %r15
%r18 = getelementptr inbounds %struct.node, %struct.node* %r5, i32 0, i32 0
%r19 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r20 = load i64, i64* @.read_scratch
store i64 %r20, i64* %r18
%r21 = getelementptr inbounds %struct.node, %struct.node* %r7, i32 0, i32 0
%r22 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r23 = load i64, i64* @.read_scratch
store i64 %r23, i64* %r21
%r24 = getelementptr inbounds %struct.node, %struct.node* %r9, i32 0, i32 0
%r25 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r26 = load i64, i64* @.read_scratch
store i64 %r26, i64* %r24
%r27 = getelementptr inbounds %struct.node, %struct.node* %r11, i32 0, i32 0
%r28 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r29 = load i64, i64* @.read_scratch
store i64 %r29, i64* %r27
%r30 = getelementptr inbounds %struct.node, %struct.node* %r1, i32 0, i32 1
store %struct.node* %r3, %struct.node** %r30
%r31 = getelementptr inbounds %struct.node, %struct.node* %r3, i32 0, i32 1
store %struct.node* %r5, %struct.node** %r31
%r32 = getelementptr inbounds %struct.node, %struct.node* %r5, i32 0, i32 1
store %struct.node* %r7, %struct.node** %r32
%r33 = getelementptr inbounds %struct.node, %struct.node* %r7, i32 0, i32 1
store %struct.node* %r9, %struct.node** %r33
%r34 = getelementptr inbounds %struct.node, %struct.node* %r9, i32 0, i32 1
store %struct.node* %r11, %struct.node** %r34
%r35 = getelementptr inbounds %struct.node, %struct.node* %r11, i32 0, i32 1
store %struct.node* null, %struct.node** %r35
ret %struct.node* %r1

}

define i64 @multiple(%struct.node* %r0) {
prologue:
%r1 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 0
%r2 = load i64, i64* %r1
%r3 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 1
%r4 = load %struct.node*, %struct.node** %r3
br i1 true, label %lab0, label %returnLabel

lab0:
%r6 = phi %struct.node* [%r4, %prologue], [%r14, %lab0]
%r7 = phi i64 [%r2, %prologue], [%r12, %lab0]
%r8 = phi i64 [0, %prologue], [%r16, %lab0]
%r10 = getelementptr inbounds %struct.node, %struct.node* %r6, i32 0, i32 0
%r11 = load i64, i64* %r10
%r12 = mul i64 %r7, %r11
%r13 = getelementptr inbounds %struct.node, %struct.node* %r6, i32 0, i32 1
%r14 = load %struct.node*, %struct.node** %r13
%r15 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r12)
%r16 = add i64 %r8, 1
%r17 = icmp slt i64 %r16, 5
br i1 %r17, label %lab0, label %returnLabel

returnLabel:
%r19 = phi i64 [%r2, %prologue], [%r12, %lab0]
ret i64 %r19

}

define i64 @add(%struct.node* %r0) {
prologue:
%r1 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 0
%r2 = load i64, i64* %r1
%r3 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 1
%r4 = load %struct.node*, %struct.node** %r3
br i1 true, label %lab0, label %returnLabel

lab0:
%r6 = phi %struct.node* [%r4, %prologue], [%r14, %lab0]
%r7 = phi i64 [0, %prologue], [%r16, %lab0]
%r8 = phi i64 [%r2, %prologue], [%r12, %lab0]
%r10 = getelementptr inbounds %struct.node, %struct.node* %r6, i32 0, i32 0
%r11 = load i64, i64* %r10
%r12 = add i64 %r8, %r11
%r13 = getelementptr inbounds %struct.node, %struct.node* %r6, i32 0, i32 1
%r14 = load %struct.node*, %struct.node** %r13
%r15 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r12)
%r16 = add i64 %r7, 1
%r17 = icmp slt i64 %r16, 5
br i1 %r17, label %lab0, label %returnLabel

returnLabel:
%r20 = phi i64 [%r2, %prologue], [%r12, %lab0]
ret i64 %r20

}

define i64 @recurseList(%struct.node* %r0) {
prologue:
%r1 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 1
%r2 = load %struct.node*, %struct.node** %r1
%r3 = icmp eq %struct.node* %r2, null
br i1 %r3, label %lab0, label %lab1

lab0:
%r5 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 0
%r6 = load i64, i64* %r5
br label %returnLabel

lab1:
%r8 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 0
%r9 = load i64, i64* %r8
%r10 = getelementptr inbounds %struct.node, %struct.node* %r0, i32 0, i32 1
%r11 = load %struct.node*, %struct.node** %r10
%r12 = call i64 @recurseList(%struct.node* %r11)
%r13 = mul i64 %r9, %r12
br label %returnLabel

returnLabel:
%r14 = phi i64 [%r6, %lab0], [%r13, %lab1]
ret i64 %r14

}

define i64 @main() {
prologue:
%r0 = call %struct.node* @buildList()
%r1 = call i64 @multiple(%struct.node* %r0)
%r2 = call i64 @add(%struct.node* %r0)
%r3 = sdiv i64 %r2, 2
%r4 = sub i64 %r1, %r3
br i1 true, label %lab0, label %lab1

lab0:
%r7 = phi i64 [0, %prologue], [%r13, %lab0]
%r9 = phi i64 [0, %prologue], [%r14, %lab0]
%r12 = call i64 @recurseList(%struct.node* %r0)
%r13 = add i64 %r7, %r12
%r14 = add i64 %r9, 1
%r15 = icmp slt i64 %r14, 2
br i1 %r15, label %lab0, label %lab1

lab1:
%r16 = phi i64 [%r4, %prologue], [%r4, %lab0]
%r17 = phi i64 [0, %prologue], [%r13, %lab0]
%r22 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r17)
%r23 = icmp ne i64 %r17, 0
br i1 %r23, label %lab2, label %returnLabel

lab2:
%r25 = phi i64 [%r17, %lab1], [%r30, %lab2]
%r30 = sub i64 %r25, 1
%r31 = icmp ne i64 %r30, 0
br i1 %r31, label %lab2, label %returnLabel

returnLabel:
%r32 = phi i64 [%r16, %lab1], [%r16, %lab2]
%r33 = phi i64 [%r17, %lab1], [%r30, %lab2]
%r38 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r32)
%r39 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r33)
ret i64 0

}

