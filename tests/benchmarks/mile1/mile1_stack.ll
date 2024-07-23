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
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
store i64 %r0, i64* %r3
store i64 %r1, i64* %r4
store i64 1, i64* %r5
%r6 = load i64, i64* %r4
%r7 = icmp sgt i64 %r6, 0
br i1 %r7, label %lab0, label %lab1

lab0:
%r8 = load i64, i64* %r5
%r9 = load i64, i64* %r3
%r10 = mul i64 %r8, %r9
store i64 %r10, i64* %r5
%r11 = load i64, i64* %r4
%r12 = sub i64 %r11, 1
store i64 %r12, i64* %r4
%r13 = load i64, i64* %r4
%r14 = icmp sgt i64 %r13, 0
br i1 %r14, label %lab0, label %lab1

lab1:
%r15 = load i64, i64* %r5
store i64 %r15, i64* %r2
br label %returnLabel

returnLabel:
%r16 = load i64, i64* %r2
ret i64 %r16

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca %struct.Power*
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
store i64 0, i64* %r3
%r6 = call i8* @malloc(i64 16)
%r7 = bitcast i8* %r6 to %struct.Power*
store %struct.Power* %r7, %struct.Power** %r1
%r8 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r9 = load i64, i64* @.read_scratch
store i64 %r9, i64* %r2
%r10 = load %struct.Power*, %struct.Power** %r1
%r11 = getelementptr inbounds %struct.Power, %struct.Power* %r10, i32 0, i32 0
%r12 = load i64, i64* %r2
store i64 %r12, i64* %r11
%r13 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r14 = load i64, i64* @.read_scratch
store i64 %r14, i64* %r2
%r15 = load i64, i64* %r2
%r16 = icmp slt i64 %r15, 0
br i1 %r16, label %lab0, label %lab1

lab0:
%r17 = sub i64 0, 1
store i64 %r17, i64* %r0
br label %returnLabel

lab1:
br label %lab2

lab2:
%r18 = load %struct.Power*, %struct.Power** %r1
%r19 = getelementptr inbounds %struct.Power, %struct.Power* %r18, i32 0, i32 1
%r20 = load i64, i64* %r2
store i64 %r20, i64* %r19
store i64 0, i64* %r5
%r21 = load i64, i64* %r5
%r22 = icmp slt i64 %r21, 1000000
br i1 %r22, label %lab3, label %lab4

lab3:
%r23 = load i64, i64* %r5
%r24 = add i64 %r23, 1
store i64 %r24, i64* %r5
%r25 = load %struct.Power*, %struct.Power** %r1
%r26 = getelementptr inbounds %struct.Power, %struct.Power* %r25, i32 0, i32 0
%r27 = load i64, i64* %r26
%r28 = load %struct.Power*, %struct.Power** %r1
%r29 = getelementptr inbounds %struct.Power, %struct.Power* %r28, i32 0, i32 1
%r30 = load i64, i64* %r29
%r31 = call i64 @calcPower(i64 %r27, i64 %r30)
store i64 %r31, i64* %r3
%r32 = load i64, i64* %r5
%r33 = icmp slt i64 %r32, 1000000
br i1 %r33, label %lab3, label %lab4

lab4:
%r34 = load i64, i64* %r3
%r35 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r34)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r36 = load i64, i64* %r0
ret i64 %r36

}

