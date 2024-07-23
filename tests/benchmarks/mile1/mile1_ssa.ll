declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.Power = type {i64, i64}

define i64 @calcPower(i64 %r0, i64 %r1) {
prologue:
%r2 = icmp sgt i64 %r1, 0
br i1 %r2, label %lab0, label %returnLabel

lab0:
%r3 = phi i64 [1, %prologue], [%r6, %lab0]
%r4 = phi i64 [%r1, %prologue], [%r7, %lab0]
%r6 = mul i64 %r3, %r0
%r7 = sub i64 %r4, 1
%r8 = icmp sgt i64 %r7, 0
br i1 %r8, label %lab0, label %returnLabel

returnLabel:
%r9 = phi i64 [1, %prologue], [%r6, %lab0]
ret i64 %r9

}

define i64 @main() {
prologue:
%r0 = call i8* @malloc(i64 16)
%r1 = bitcast i8* %r0 to %struct.Power*
%r2 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r3 = load i64, i64* @.read_scratch
%r4 = getelementptr inbounds %struct.Power, %struct.Power* %r1, i32 0, i32 0
store i64 %r3, i64* %r4
%r5 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r6 = load i64, i64* @.read_scratch
%r7 = icmp slt i64 %r6, 0
br i1 %r7, label %returnLabel, label %lab2

lab2:
%r10 = getelementptr inbounds %struct.Power, %struct.Power* %r1, i32 0, i32 1
store i64 %r6, i64* %r10
br i1 true, label %lab3, label %lab4

lab3:
%r14 = phi i64 [0, %lab2], [%r16, %lab3]
%r16 = add i64 %r14, 1
%r17 = getelementptr inbounds %struct.Power, %struct.Power* %r1, i32 0, i32 0
%r18 = load i64, i64* %r17
%r19 = getelementptr inbounds %struct.Power, %struct.Power* %r1, i32 0, i32 1
%r20 = load i64, i64* %r19
%r21 = call i64 @calcPower(i64 %r18, i64 %r20)
%r22 = icmp slt i64 %r16, 1000000
br i1 %r22, label %lab3, label %lab4

lab4:
%r23 = phi i64 [0, %lab2], [%r21, %lab3]
%r27 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r23)
br label %returnLabel

returnLabel:
%r28 = phi i64 [-1, %prologue], [0, %lab4]
ret i64 %r28

}

