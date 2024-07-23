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
%r1 = icmp sle i64 1, %r0
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r3 = phi i64 [1, %prologue], [%r5, %lab0]
%r4 = phi i64 [3, %prologue], [%r6, %lab0]
%r5 = add i64 %r3, %r4
%r6 = add i64 %r4, 2
%r7 = icmp sle i64 %r5, %r0
br i1 %r7, label %lab0, label %returnLabel

returnLabel:
%r10 = phi i64 [3, %prologue], [%r6, %lab0]
%r11 = sdiv i64 %r10, 2
%r12 = sub i64 %r11, 1
ret i64 %r12

}

define i1 @prime(i64 %r0) {
prologue:
%r1 = icmp slt i64 %r0, 2
br i1 %r1, label %returnLabel, label %lab1

lab1:
%r3 = call i64 @isqrt(i64 %r0)
%r4 = icmp sle i64 2, %r3
br i1 %r4, label %lab2, label %returnLabel

lab2:
%r6 = phi i64 [2, %lab1], [%r13, %lab5]
%r8 = sdiv i64 %r0, %r6
%r9 = mul i64 %r8, %r6
%r10 = sub i64 %r0, %r9
%r11 = icmp eq i64 %r10, 0
br i1 %r11, label %returnLabel, label %lab5

lab5:
%r13 = add i64 %r6, 1
%r15 = icmp sle i64 %r13, %r3
br i1 %r15, label %lab2, label %returnLabel

returnLabel:
%r19 = phi i1 [false, %prologue], [false, %lab2], [true, %lab1], [true, %lab5]
ret i1 %r19

}

define i64 @main() {
prologue:
%r0 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r1 = load i64, i64* @.read_scratch
%r2 = icmp sle i64 0, %r1
br i1 %r2, label %lab0, label %returnLabel

lab0:
%r3 = phi i64 [0, %prologue], [%r9, %lab3]
%r5 = call i1 @prime(i64 %r3)
br i1 %r5, label %lab1, label %lab3

lab1:
%r7 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r3)
br label %lab3

lab3:
%r8 = phi i64 [%r3, %lab1], [%r3, %lab0]
%r10 = phi i64 [%r1, %lab1], [%r1, %lab0]
%r9 = add i64 %r8, 1
%r11 = icmp sle i64 %r9, %r10
br i1 %r11, label %lab0, label %returnLabel

returnLabel:
ret i64 0

}

