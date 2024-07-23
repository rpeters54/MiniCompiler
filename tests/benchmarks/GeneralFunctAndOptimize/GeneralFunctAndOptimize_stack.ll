declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.IntHolder = type {i64}
@interval = common global i64 0
@end = common global i64 0

define i64 @multBy4xTimes(%struct.IntHolder* %r0, i64 %r1) {
prologue:
%r2 = alloca i64
%r3 = alloca %struct.IntHolder*
%r4 = alloca i64
store %struct.IntHolder* %r0, %struct.IntHolder** %r3
store i64 %r1, i64* %r4
%r5 = load i64, i64* %r4
%r6 = icmp sle i64 %r5, 0
br i1 %r6, label %lab0, label %lab1

lab0:
%r7 = load %struct.IntHolder*, %struct.IntHolder** %r3
%r8 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r7, i32 0, i32 0
%r9 = load i64, i64* %r8
store i64 %r9, i64* %r2
br label %returnLabel

lab1:
br label %lab2

lab2:
%r10 = load %struct.IntHolder*, %struct.IntHolder** %r3
%r11 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r10, i32 0, i32 0
%r12 = load %struct.IntHolder*, %struct.IntHolder** %r3
%r13 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r12, i32 0, i32 0
%r14 = load i64, i64* %r13
%r15 = mul i64 4, %r14
store i64 %r15, i64* %r11
%r16 = load %struct.IntHolder*, %struct.IntHolder** %r3
%r17 = load i64, i64* %r4
%r18 = sub i64 %r17, 1
%r19 = call i64 @multBy4xTimes(%struct.IntHolder* %r16, i64 %r18)
%r20 = load %struct.IntHolder*, %struct.IntHolder** %r3
%r21 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r20, i32 0, i32 0
%r22 = load i64, i64* %r21
store i64 %r22, i64* %r2
br label %returnLabel

returnLabel:
%r23 = load i64, i64* %r2
ret i64 %r23

}

define void @divideBy8(%struct.IntHolder* %r0) {
prologue:
%r1 = alloca %struct.IntHolder*
store %struct.IntHolder* %r0, %struct.IntHolder** %r1
%r2 = load %struct.IntHolder*, %struct.IntHolder** %r1
%r3 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r2, i32 0, i32 0
%r4 = load %struct.IntHolder*, %struct.IntHolder** %r1
%r5 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r4, i32 0, i32 0
%r6 = load i64, i64* %r5
%r7 = sdiv i64 %r6, 2
store i64 %r7, i64* %r3
%r8 = load %struct.IntHolder*, %struct.IntHolder** %r1
%r9 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r8, i32 0, i32 0
%r10 = load %struct.IntHolder*, %struct.IntHolder** %r1
%r11 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r10, i32 0, i32 0
%r12 = load i64, i64* %r11
%r13 = sdiv i64 %r12, 2
store i64 %r13, i64* %r9
%r14 = load %struct.IntHolder*, %struct.IntHolder** %r1
%r15 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r14, i32 0, i32 0
%r16 = load %struct.IntHolder*, %struct.IntHolder** %r1
%r17 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r16, i32 0, i32 0
%r18 = load i64, i64* %r17
%r19 = sdiv i64 %r18, 2
store i64 %r19, i64* %r15
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
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca i64
%r7 = alloca %struct.IntHolder*
%r8 = alloca i1
%r9 = alloca i1
%r10 = call i8* @malloc(i64 8)
%r11 = bitcast i8* %r10 to %struct.IntHolder*
store %struct.IntHolder* %r11, %struct.IntHolder** %r7
store i64 1000000, i64* @end
%r12 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r13 = load i64, i64* @.read_scratch
store i64 %r13, i64* %r1
%r14 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r15 = load i64, i64* @.read_scratch
store i64 %r15, i64* @interval
%r16 = load i64, i64* %r1
%r17 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r16)
%r18 = load i64, i64* @interval
%r19 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r18)
store i64 0, i64* %r2
store i64 0, i64* %r3
store i64 0, i64* %r4
%r20 = load i64, i64* %r2
%r21 = icmp slt i64 %r20, 50
br i1 %r21, label %lab0, label %lab6

lab0:
store i64 0, i64* %r3
%r22 = load i64, i64* %r3
%r23 = load i64, i64* @end
%r24 = icmp sle i64 %r22, %r23
br i1 %r24, label %lab1, label %lab5

lab1:
%r25 = mul i64 1, 2
%r26 = mul i64 %r25, 3
%r27 = mul i64 %r26, 4
%r28 = mul i64 %r27, 5
%r29 = mul i64 %r28, 6
%r30 = mul i64 %r29, 7
%r31 = mul i64 %r30, 8
%r32 = mul i64 %r31, 9
%r33 = mul i64 %r32, 10
%r34 = mul i64 %r33, 11
store i64 %r34, i64* %r4
%r35 = load i64, i64* %r3
%r36 = add i64 %r35, 1
store i64 %r36, i64* %r3
%r37 = load %struct.IntHolder*, %struct.IntHolder** %r7
%r38 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r37, i32 0, i32 0
%r39 = load i64, i64* %r3
store i64 %r39, i64* %r38
%r40 = load %struct.IntHolder*, %struct.IntHolder** %r7
%r41 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r40, i32 0, i32 0
%r42 = load i64, i64* %r41
store i64 %r42, i64* %r5
%r43 = load %struct.IntHolder*, %struct.IntHolder** %r7
%r44 = call i64 @multBy4xTimes(%struct.IntHolder* %r43, i64 2)
%r45 = load %struct.IntHolder*, %struct.IntHolder** %r7
call void @divideBy8(%struct.IntHolder* %r45)
%r46 = load i64, i64* @interval
%r47 = sub i64 %r46, 1
store i64 %r47, i64* %r6
%r48 = load i64, i64* %r6
%r49 = icmp sle i64 %r48, 0
store i1 %r49, i1* %r8
%r50 = load i64, i64* %r6
%r51 = icmp sle i64 %r50, 0
br i1 %r51, label %lab2, label %lab3

lab2:
store i64 1, i64* %r6
br label %lab4

lab3:
br label %lab4

lab4:
%r52 = load i64, i64* %r3
%r53 = load i64, i64* %r6
%r54 = add i64 %r52, %r53
store i64 %r54, i64* %r3
%r55 = load i64, i64* %r3
%r56 = load i64, i64* @end
%r57 = icmp sle i64 %r55, %r56
br i1 %r57, label %lab1, label %lab5

lab5:
%r58 = load i64, i64* %r2
%r59 = add i64 %r58, 1
store i64 %r59, i64* %r2
%r60 = load i64, i64* %r2
%r61 = icmp slt i64 %r60, 50
br i1 %r61, label %lab0, label %lab6

lab6:
%r62 = load i64, i64* %r3
%r63 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r62)
%r64 = load i64, i64* %r4
%r65 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r64)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r66 = load i64, i64* %r0
ret i64 %r66

}

