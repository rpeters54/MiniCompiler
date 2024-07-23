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
%r2 = alloca %struct.linkedNums*
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca i64
%r7 = alloca %struct.linkedNums*
%r8 = alloca %struct.linkedNums*
store i64 %r0, i64* %r3
store i64 %r1, i64* %r4
store %struct.linkedNums* null, %struct.linkedNums** %r7
%r9 = load i64, i64* %r3
%r10 = load i64, i64* %r3
%r11 = mul i64 %r9, %r10
store i64 %r11, i64* %r5
%r12 = call i8* @malloc(i64 16)
%r13 = bitcast i8* %r12 to %struct.linkedNums*
store %struct.linkedNums* %r13, %struct.linkedNums** %r8
%r14 = load %struct.linkedNums*, %struct.linkedNums** %r8
%r15 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r14, i32 0, i32 0
%r16 = load i64, i64* %r5
store i64 %r16, i64* %r15
%r17 = load %struct.linkedNums*, %struct.linkedNums** %r8
%r18 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r17, i32 0, i32 1
store %struct.linkedNums* null, %struct.linkedNums** %r18
%r19 = load i64, i64* %r4
%r20 = sub i64 %r19, 1
store i64 %r20, i64* %r4
%r21 = load i64, i64* %r5
store i64 %r21, i64* %r6
%r22 = load i64, i64* %r4
%r23 = icmp sgt i64 %r22, 0
br i1 %r23, label %lab0, label %lab1

lab0:
%r24 = load i64, i64* %r6
%r25 = load i64, i64* %r6
%r26 = mul i64 %r24, %r25
%r27 = load i64, i64* %r3
%r28 = sdiv i64 %r26, %r27
%r29 = load i64, i64* %r3
%r30 = sdiv i64 %r29, 2
%r31 = mul i64 %r28, %r30
%r32 = add i64 %r31, 1
store i64 %r32, i64* %r5
%r33 = load i64, i64* %r5
%r34 = load i64, i64* %r5
%r35 = sdiv i64 %r34, 1000000000
%r36 = mul i64 %r35, 1000000000
%r37 = sub i64 %r33, %r36
store i64 %r37, i64* %r5
%r38 = call i8* @malloc(i64 16)
%r39 = bitcast i8* %r38 to %struct.linkedNums*
store %struct.linkedNums* %r39, %struct.linkedNums** %r7
%r40 = load %struct.linkedNums*, %struct.linkedNums** %r7
%r41 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r40, i32 0, i32 0
%r42 = load i64, i64* %r5
store i64 %r42, i64* %r41
%r43 = load %struct.linkedNums*, %struct.linkedNums** %r7
%r44 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r43, i32 0, i32 1
%r45 = load %struct.linkedNums*, %struct.linkedNums** %r8
store %struct.linkedNums* %r45, %struct.linkedNums** %r44
%r46 = load %struct.linkedNums*, %struct.linkedNums** %r7
store %struct.linkedNums* %r46, %struct.linkedNums** %r8
%r47 = load i64, i64* %r4
%r48 = sub i64 %r47, 1
store i64 %r48, i64* %r4
%r49 = load i64, i64* %r5
store i64 %r49, i64* %r6
%r50 = load i64, i64* %r4
%r51 = icmp sgt i64 %r50, 0
br i1 %r51, label %lab0, label %lab1

lab1:
%r52 = load %struct.linkedNums*, %struct.linkedNums** %r7
store %struct.linkedNums* %r52, %struct.linkedNums** %r2
br label %returnLabel

returnLabel:
%r53 = load %struct.linkedNums*, %struct.linkedNums** %r2
ret %struct.linkedNums* %r53

}

define i64 @calcMean(%struct.linkedNums* %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca %struct.linkedNums*
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
store %struct.linkedNums* %r0, %struct.linkedNums** %r2
store i64 0, i64* %r3
store i64 0, i64* %r4
store i64 0, i64* %r5
%r6 = load %struct.linkedNums*, %struct.linkedNums** %r2
%r7 = icmp ne %struct.linkedNums* %r6, null
br i1 %r7, label %lab0, label %lab1

lab0:
%r8 = load i64, i64* %r4
%r9 = add i64 %r8, 1
store i64 %r9, i64* %r4
%r10 = load i64, i64* %r3
%r11 = load %struct.linkedNums*, %struct.linkedNums** %r2
%r12 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r11, i32 0, i32 0
%r13 = load i64, i64* %r12
%r14 = add i64 %r10, %r13
store i64 %r14, i64* %r3
%r15 = load %struct.linkedNums*, %struct.linkedNums** %r2
%r16 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r15, i32 0, i32 1
%r17 = load %struct.linkedNums*, %struct.linkedNums** %r16
store %struct.linkedNums* %r17, %struct.linkedNums** %r2
%r18 = load %struct.linkedNums*, %struct.linkedNums** %r2
%r19 = icmp ne %struct.linkedNums* %r18, null
br i1 %r19, label %lab0, label %lab1

lab1:
%r20 = load i64, i64* %r4
%r21 = icmp ne i64 %r20, 0
br i1 %r21, label %lab2, label %lab3

lab2:
%r22 = load i64, i64* %r3
%r23 = load i64, i64* %r4
%r24 = sdiv i64 %r22, %r23
store i64 %r24, i64* %r5
br label %lab4

lab3:
br label %lab4

lab4:
%r25 = load i64, i64* %r5
store i64 %r25, i64* %r1
br label %returnLabel

returnLabel:
%r26 = load i64, i64* %r1
ret i64 %r26

}

define i64 @approxSqrt(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
store i64 %r0, i64* %r2
store i64 1, i64* %r3
%r6 = load i64, i64* %r3
store i64 %r6, i64* %r5
store i64 0, i64* %r4
%r7 = load i64, i64* %r4
%r8 = load i64, i64* %r2
%r9 = icmp slt i64 %r7, %r8
br i1 %r9, label %lab0, label %lab1

lab0:
%r10 = load i64, i64* %r3
%r11 = load i64, i64* %r3
%r12 = mul i64 %r10, %r11
store i64 %r12, i64* %r4
%r13 = load i64, i64* %r3
store i64 %r13, i64* %r5
%r14 = load i64, i64* %r3
%r15 = add i64 %r14, 1
store i64 %r15, i64* %r3
%r16 = load i64, i64* %r4
%r17 = load i64, i64* %r2
%r18 = icmp slt i64 %r16, %r17
br i1 %r18, label %lab0, label %lab1

lab1:
%r19 = load i64, i64* %r5
store i64 %r19, i64* %r1
br label %returnLabel

returnLabel:
%r20 = load i64, i64* %r1
ret i64 %r20

}

define void @approxSqrtAll(%struct.linkedNums* %r0) {
prologue:
%r1 = alloca %struct.linkedNums*
store %struct.linkedNums* %r0, %struct.linkedNums** %r1
%r2 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r3 = icmp ne %struct.linkedNums* %r2, null
br i1 %r3, label %lab0, label %lab1

lab0:
%r4 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r5 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r4, i32 0, i32 0
%r6 = load i64, i64* %r5
%r7 = call i64 @approxSqrt(i64 %r6)
%r8 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r7)
%r9 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r10 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r9, i32 0, i32 1
%r11 = load %struct.linkedNums*, %struct.linkedNums** %r10
store %struct.linkedNums* %r11, %struct.linkedNums** %r1
%r12 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r13 = icmp ne %struct.linkedNums* %r12, null
br i1 %r13, label %lab0, label %lab1

lab1:
br label %returnLabel

returnLabel:
ret void

}

define void @range(%struct.linkedNums* %r0) {
prologue:
%r1 = alloca %struct.linkedNums*
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i1
store %struct.linkedNums* %r0, %struct.linkedNums** %r1
store i64 0, i64* %r2
store i64 0, i64* %r3
store i1 true, i1* %r4
%r5 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r6 = icmp ne %struct.linkedNums* %r5, null
br i1 %r6, label %lab0, label %lab10

lab0:
%r7 = load i1, i1* %r4
br i1 %r7, label %lab1, label %lab2

lab1:
%r8 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r9 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r8, i32 0, i32 0
%r10 = load i64, i64* %r9
store i64 %r10, i64* %r2
%r11 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r12 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r11, i32 0, i32 0
%r13 = load i64, i64* %r12
store i64 %r13, i64* %r3
store i1 false, i1* %r4
br label %lab9

lab2:
%r14 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r15 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r14, i32 0, i32 0
%r16 = load i64, i64* %r15
%r17 = load i64, i64* %r2
%r18 = icmp slt i64 %r16, %r17
br i1 %r18, label %lab3, label %lab4

lab3:
%r19 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r20 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r19, i32 0, i32 0
%r21 = load i64, i64* %r20
store i64 %r21, i64* %r2
br label %lab8

lab4:
%r22 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r23 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r22, i32 0, i32 0
%r24 = load i64, i64* %r23
%r25 = load i64, i64* %r3
%r26 = icmp sgt i64 %r24, %r25
br i1 %r26, label %lab5, label %lab6

lab5:
%r27 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r28 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r27, i32 0, i32 0
%r29 = load i64, i64* %r28
store i64 %r29, i64* %r3
br label %lab7

lab6:
br label %lab7

lab7:
br label %lab8

lab8:
br label %lab9

lab9:
%r30 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r31 = getelementptr inbounds %struct.linkedNums, %struct.linkedNums* %r30, i32 0, i32 1
%r32 = load %struct.linkedNums*, %struct.linkedNums** %r31
store %struct.linkedNums* %r32, %struct.linkedNums** %r1
%r33 = load %struct.linkedNums*, %struct.linkedNums** %r1
%r34 = icmp ne %struct.linkedNums* %r33, null
br i1 %r34, label %lab0, label %lab10

lab10:
%r35 = load i64, i64* %r2
%r36 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r35)
%r37 = load i64, i64* %r3
%r38 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r37)
br label %returnLabel

returnLabel:
ret void

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca %struct.linkedNums*
%r5 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r6 = load i64, i64* @.read_scratch
store i64 %r6, i64* %r1
%r7 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r8 = load i64, i64* @.read_scratch
store i64 %r8, i64* %r2
%r9 = load i64, i64* %r1
%r10 = load i64, i64* %r2
%r11 = call %struct.linkedNums* @getRands(i64 %r9, i64 %r10)
store %struct.linkedNums* %r11, %struct.linkedNums** %r4
%r12 = load %struct.linkedNums*, %struct.linkedNums** %r4
%r13 = call i64 @calcMean(%struct.linkedNums* %r12)
store i64 %r13, i64* %r3
%r14 = load i64, i64* %r3
%r15 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r14)
%r16 = load %struct.linkedNums*, %struct.linkedNums** %r4
call void @range(%struct.linkedNums* %r16)
%r17 = load %struct.linkedNums*, %struct.linkedNums** %r4
call void @approxSqrtAll(%struct.linkedNums* %r17)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r18 = load i64, i64* %r0
ret i64 %r18

}

