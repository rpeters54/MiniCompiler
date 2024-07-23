declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8


define i64 @isqrt(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
store i64 %r0, i64* %r2
store i64 1, i64* %r3
store i64 3, i64* %r4
%r5 = load i64, i64* %r3
%r6 = load i64, i64* %r2
%r7 = icmp sle i64 %r5, %r6
br i1 %r7, label %lab0, label %lab1

lab0:
%r8 = load i64, i64* %r3
%r9 = load i64, i64* %r4
%r10 = add i64 %r8, %r9
store i64 %r10, i64* %r3
%r11 = load i64, i64* %r4
%r12 = add i64 %r11, 2
store i64 %r12, i64* %r4
%r13 = load i64, i64* %r3
%r14 = load i64, i64* %r2
%r15 = icmp sle i64 %r13, %r14
br i1 %r15, label %lab0, label %lab1

lab1:
%r16 = load i64, i64* %r4
%r17 = sdiv i64 %r16, 2
%r18 = sub i64 %r17, 1
store i64 %r18, i64* %r1
br label %returnLabel

returnLabel:
%r19 = load i64, i64* %r1
ret i64 %r19

}

define i1 @prime(i64 %r0) {
prologue:
%r1 = alloca i1
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
store i64 %r0, i64* %r2
%r6 = load i64, i64* %r2
%r7 = icmp slt i64 %r6, 2
br i1 %r7, label %lab0, label %lab1

lab0:
store i1 false, i1* %r1
br label %returnLabel

lab1:
%r8 = load i64, i64* %r2
%r9 = call i64 @isqrt(i64 %r8)
store i64 %r9, i64* %r3
store i64 2, i64* %r4
%r10 = load i64, i64* %r4
%r11 = load i64, i64* %r3
%r12 = icmp sle i64 %r10, %r11
br i1 %r12, label %lab2, label %lab6

lab2:
%r13 = load i64, i64* %r2
%r14 = load i64, i64* %r2
%r15 = load i64, i64* %r4
%r16 = sdiv i64 %r14, %r15
%r17 = load i64, i64* %r4
%r18 = mul i64 %r16, %r17
%r19 = sub i64 %r13, %r18
store i64 %r19, i64* %r5
%r20 = load i64, i64* %r5
%r21 = icmp eq i64 %r20, 0
br i1 %r21, label %lab3, label %lab4

lab3:
store i1 false, i1* %r1
br label %returnLabel

lab4:
br label %lab5

lab5:
%r22 = load i64, i64* %r4
%r23 = add i64 %r22, 1
store i64 %r23, i64* %r4
%r24 = load i64, i64* %r4
%r25 = load i64, i64* %r3
%r26 = icmp sle i64 %r24, %r25
br i1 %r26, label %lab2, label %lab6

lab6:
store i1 true, i1* %r1
br label %returnLabel

returnLabel:
%r27 = load i1, i1* %r1
ret i1 %r27

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r4 = load i64, i64* @.read_scratch
store i64 %r4, i64* %r1
store i64 0, i64* %r2
%r5 = load i64, i64* %r2
%r6 = load i64, i64* %r1
%r7 = icmp sle i64 %r5, %r6
br i1 %r7, label %lab0, label %lab4

lab0:
%r8 = load i64, i64* %r2
%r9 = call i1 @prime(i64 %r8)
br i1 %r9, label %lab1, label %lab2

lab1:
%r10 = load i64, i64* %r2
%r11 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r10)
br label %lab3

lab2:
br label %lab3

lab3:
%r12 = load i64, i64* %r2
%r13 = add i64 %r12, 1
store i64 %r13, i64* %r2
%r14 = load i64, i64* %r2
%r15 = load i64, i64* %r1
%r16 = icmp sle i64 %r14, %r15
br i1 %r16, label %lab0, label %lab4

lab4:
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r17 = load i64, i64* %r0
ret i64 %r17

}

