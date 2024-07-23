declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.linkedNums = type {i64, %struct.linkedNums*}

define %struct.linkedNums* @getRands(i64 %r0, i64 %r1) {
prologue:
%r2 = mul i64 %r0, %r0
%r3 = call i8* @malloc(i64 16)
%r4 = bitcast i8* %r3 to %struct.linkedNums*
%r5 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r4, i32 0, i32 0
store i64 %r2, i64* %r5
%r6 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r4, i32 0, i32 1
store %struct.linkedNums* null, %struct.linkedNums** %r6
%r7 = sub i64 %r1, 1
%r8 = icmp sgt i64 %r7, 0
br i1 %r8, label %lab0, label %returnLabel

lab0:
%r10 = phi %struct.linkedNums* [%r4, %prologue], [%r24, %lab0]
%r12 = phi i64 [%r7, %prologue], [%r27, %lab0]
%r13 = phi i64 [%r2, %prologue], [%r22, %lab0]
%r15 = mul i64 %r13, %r13
%r16 = sdiv i64 %r15, %r0
%r17 = sdiv i64 %r0, 2
%r18 = mul i64 %r16, %r17
%r19 = add i64 %r18, 1
%r20 = sdiv i64 %r19, 1000000000
%r21 = mul i64 %r20, 1000000000
%r22 = sub i64 %r19, %r21
%r23 = call i8* @malloc(i64 16)
%r24 = bitcast i8* %r23 to %struct.linkedNums*
%r25 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r24, i32 0, i32 0
store i64 %r22, i64* %r25
%r26 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r24, i32 0, i32 1
store %struct.linkedNums* %r10, %struct.linkedNums** %r26
%r27 = sub i64 %r12, 1
%r28 = icmp sgt i64 %r27, 0
br i1 %r28, label %lab0, label %returnLabel

returnLabel:
%r34 = phi %struct.linkedNums* [null, %prologue], [%r24, %lab0]
ret %struct.linkedNums* %r34

}

define i64 @calcMean(%struct.linkedNums* %r0) {
prologue:
%r1 = icmp ne %struct.linkedNums* %r0, null
br i1 %r1, label %lab0, label %lab1

lab0:
%r3 = phi i64 [0, %prologue], [%r6, %lab0]
%r4 = phi i64 [0, %prologue], [%r9, %lab0]
%r5 = phi %struct.linkedNums* [%r0, %prologue], [%r11, %lab0]
%r6 = add i64 %r3, 1
%r7 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r5, i32 0, i32 0
%r8 = load i64, i64* %r7
%r9 = add i64 %r4, %r8
%r10 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r5, i32 0, i32 1
%r11 = load %struct.linkedNums*, %struct.linkedNums** %r10
%r12 = icmp ne %struct.linkedNums* %r11, null
br i1 %r12, label %lab0, label %lab1

lab1:
%r13 = phi i64 [0, %prologue], [0, %lab0]
%r14 = phi i64 [0, %prologue], [%r6, %lab0]
%r15 = phi i64 [0, %prologue], [%r9, %lab0]
%r17 = icmp ne i64 %r14, 0
br i1 %r17, label %lab2, label %returnLabel

lab2:
%r20 = sdiv i64 %r15, %r14
br label %returnLabel

returnLabel:
%r21 = phi i64 [%r20, %lab2], [%r13, %lab1]
ret i64 %r21

}

define i64 @approxSqrt(i64 %r0) {
prologue:
%r1 = icmp slt i64 0, %r0
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r3 = phi i64 [1, %prologue], [%r7, %lab0]
%r6 = mul i64 %r3, %r3
%r7 = add i64 %r3, 1
%r8 = icmp slt i64 %r6, %r0
br i1 %r8, label %lab0, label %returnLabel

returnLabel:
%r12 = phi i64 [1, %prologue], [%r3, %lab0]
ret i64 %r12

}

define void @approxSqrtAll(%struct.linkedNums* %r0) {
prologue:
%r1 = icmp ne %struct.linkedNums* %r0, null
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r2 = phi %struct.linkedNums* [%r0, %prologue], [%r8, %lab0]
%r3 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r2, i32 0, i32 0
%r4 = load i64, i64* %r3
%r5 = call i64 @approxSqrt(i64 %r4)
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r5)
%r7 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r2, i32 0, i32 1
%r8 = load %struct.linkedNums*, %struct.linkedNums** %r7
%r9 = icmp ne %struct.linkedNums* %r8, null
br i1 %r9, label %lab0, label %returnLabel

returnLabel:
ret void

}

define void @range(%struct.linkedNums* %r0) {
prologue:
%r1 = icmp ne %struct.linkedNums* %r0, null
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r2 = phi i64 [0, %prologue], [%r32, %lab9]
%r3 = phi i64 [0, %prologue], [%r33, %lab9]
%r4 = phi %struct.linkedNums* [%r0, %prologue], [%r37, %lab9]
%r5 = phi i1 [true, %prologue], [%r35, %lab9]
br i1 %r5, label %lab1, label %lab2

lab1:
%r7 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r4, i32 0, i32 0
%r8 = load i64, i64* %r7
%r9 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r4, i32 0, i32 0
%r10 = load i64, i64* %r9
br label %lab9

lab2:
%r12 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r4, i32 0, i32 0
%r13 = load i64, i64* %r12
%r15 = icmp slt i64 %r13, %r2
br i1 %r15, label %lab3, label %lab4

lab3:
%r17 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r4, i32 0, i32 0
%r18 = load i64, i64* %r17
br label %lab8

lab4:
%r20 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r4, i32 0, i32 0
%r21 = load i64, i64* %r20
%r23 = icmp sgt i64 %r21, %r3
br i1 %r23, label %lab5, label %lab7

lab5:
%r25 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r4, i32 0, i32 0
%r26 = load i64, i64* %r25
br label %lab7

lab7:
%r27 = phi i64 [%r26, %lab5], [%r3, %lab4]
%r28 = phi %struct.linkedNums* [%r4, %lab5], [%r4, %lab4]
br label %lab8

lab8:
%r29 = phi i64 [%r18, %lab3], [%r2, %lab7]
%r30 = phi i64 [%r3, %lab3], [%r27, %lab7]
%r31 = phi %struct.linkedNums* [%r4, %lab3], [%r28, %lab7]
br label %lab9

lab9:
%r32 = phi i64 [%r8, %lab1], [%r29, %lab8]
%r33 = phi i64 [%r10, %lab1], [%r30, %lab8]
%r34 = phi %struct.linkedNums* [%r4, %lab1], [%r31, %lab8]
%r35 = phi i1 [false, %lab1], [%r5, %lab8]
%r36 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r34, i32 0, i32 1
%r37 = load %struct.linkedNums*, %struct.linkedNums** %r36
%r38 = icmp ne %struct.linkedNums* %r37, null
br i1 %r38, label %lab0, label %returnLabel

returnLabel:
%r39 = phi i64 [0, %prologue], [%r32, %lab9]
%r40 = phi i64 [0, %prologue], [%r33, %lab9]
%r43 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r39)
%r44 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r40)
ret void

}

define i64 @main() {
prologue:
%r0 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r1 = load i64, i64* @.read_scratch
%r2 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r3 = load i64, i64* @.read_scratch
%r4 = call %struct.linkedNums* @getRands(i64 %r1, i64 %r3)
%r5 = call i64 @calcMean(%struct.linkedNums* %r4)
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r5)
call void @range(%struct.linkedNums* %r4)
call void @approxSqrtAll(%struct.linkedNums* %r4)
ret i64 0

}

