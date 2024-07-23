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
%r2 = icmp sle i64 %r1, 0
br i1 %r2, label %lab0, label %lab2

lab0:
%r4 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r0, i32 0, i32 0
%r5 = load i64, i64* %r4
br label %returnLabel

lab2:
%r7 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r0, i32 0, i32 0
%r8 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r0, i32 0, i32 0
%r9 = load i64, i64* %r8
%r10 = mul i64 4, %r9
store i64 %r10, i64* %r7
%r12 = sub i64 %r1, 1
%r13 = call i64 @multBy4xTimes(%struct.IntHolder* %r0, i64 %r12)
%r14 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r0, i32 0, i32 0
%r15 = load i64, i64* %r14
br label %returnLabel

returnLabel:
%r16 = phi i64 [%r5, %lab0], [%r15, %lab2]
ret i64 %r16

}

define void @divideBy8(%struct.IntHolder* %r0) {
prologue:
%r1 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r0, i32 0, i32 0
%r2 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r0, i32 0, i32 0
%r3 = load i64, i64* %r2
%r4 = sdiv i64 %r3, 2
store i64 %r4, i64* %r1
%r5 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r0, i32 0, i32 0
%r6 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r0, i32 0, i32 0
%r7 = load i64, i64* %r6
%r8 = sdiv i64 %r7, 2
store i64 %r8, i64* %r5
%r9 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r0, i32 0, i32 0
%r10 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r0, i32 0, i32 0
%r11 = load i64, i64* %r10
%r12 = sdiv i64 %r11, 2
store i64 %r12, i64* %r9
ret void

}

define i64 @main() {
prologue:
%r0 = call i8* @malloc(i64 8)
%r1 = bitcast i8* %r0 to %struct.IntHolder*
store i64 1000000, i64* @end
%r2 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r3 = load i64, i64* @.read_scratch
%r4 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r5 = load i64, i64* @.read_scratch
store i64 %r5, i64* @interval
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r3)
%r7 = load i64, i64* @interval
%r8 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r7)
br i1 true, label %lab0, label %returnLabel

lab0:
%r10 = phi i64 [0, %prologue], [%r53, %lab5]
%r12 = phi %struct.IntHolder* [%r1, %prologue], [%r49, %lab5]
%r14 = phi i64 [0, %prologue], [%r51, %lab5]
%r15 = load i64, i64* @end
%r16 = icmp sle i64 0, %r15
br i1 %r16, label %lab4, label %lab5

lab4:
%r18 = phi i64 [0, %lab0], [%r43, %lab4]
%r32 = add i64 %r18, 1
%r33 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r12, i32 0, i32 0
store i64 %r32, i64* %r33
%r34 = getelementptr inbounds %struct.IntHolder, %struct.IntHolder* %r12, i32 0, i32 0
%r35 = load i64, i64* %r34
%r36 = call i64 @multBy4xTimes(%struct.IntHolder* %r12, i64 2)
call void @divideBy8(%struct.IntHolder* %r12)
%r37 = load i64, i64* @interval
%r38 = sub i64 %r37, 1
%r40 = icmp sle i64 %r38, 0
%r63 = select i1 %r40, i64 1, i64 %r38
%r64 = select i1 %r40, i64 %r32, i64 %r32
%r43 = add i64 %r64, %r63
%r44 = load i64, i64* @end
%r45 = icmp sle i64 %r43, %r44
br i1 %r45, label %lab4, label %lab5

lab5:
%r46 = phi i64 [%r10, %lab0], [%r10, %lab4]
%r48 = phi i64 [0, %lab0], [%r43, %lab4]
%r49 = phi %struct.IntHolder* [%r12, %lab0], [%r12, %lab4]
%r51 = phi i64 [%r14, %lab0], [39916800, %lab4]
%r53 = add i64 %r46, 1
%r54 = icmp slt i64 %r53, 50
br i1 %r54, label %lab0, label %returnLabel

returnLabel:
%r56 = phi i64 [0, %prologue], [%r48, %lab5]
%r59 = phi i64 [0, %prologue], [%r51, %lab5]
%r60 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r56)
%r61 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r59)
ret i64 0

}

