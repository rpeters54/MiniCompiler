declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8


define i64 @function(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
store i64 %r0, i64* %r2
%r5 = load i64, i64* %r2
%r6 = icmp sle i64 %r5, 0
br i1 %r6, label %lab0, label %lab1

lab0:
store i64 0, i64* %r1
br label %returnLabel

lab1:
br label %lab2

lab2:
store i64 0, i64* %r3
%r7 = load i64, i64* %r3
%r8 = load i64, i64* %r2
%r9 = load i64, i64* %r2
%r10 = mul i64 %r8, %r9
%r11 = icmp slt i64 %r7, %r10
br i1 %r11, label %lab3, label %lab4

lab3:
%r12 = load i64, i64* %r3
%r13 = load i64, i64* %r2
%r14 = add i64 %r12, %r13
store i64 %r14, i64* %r4
%r15 = load i64, i64* %r4
%r16 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r15)
%r17 = load i64, i64* %r3
%r18 = add i64 %r17, 1
store i64 %r18, i64* %r3
%r19 = load i64, i64* %r3
%r20 = load i64, i64* %r2
%r21 = load i64, i64* %r2
%r22 = mul i64 %r20, %r21
%r23 = icmp slt i64 %r19, %r22
br i1 %r23, label %lab3, label %lab4

lab4:
%r24 = load i64, i64* %r2
%r25 = sub i64 %r24, 1
%r26 = call i64 @function(i64 %r25)
store i64 %r26, i64* %r1
br label %returnLabel

returnLabel:
%r27 = load i64, i64* %r1
ret i64 %r27

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r3 = load i64, i64* @.read_scratch
store i64 %r3, i64* %r1
%r4 = load i64, i64* %r1
%r5 = call i64 @function(i64 %r4)
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r7 = load i64, i64* %r0
ret i64 %r7

}

