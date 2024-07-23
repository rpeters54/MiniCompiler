declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8


define i64 @computeFib(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
store i64 %r0, i64* %r2
%r3 = load i64, i64* %r2
%r4 = icmp eq i64 %r3, 0
br i1 %r4, label %lab0, label %lab1

lab0:
store i64 0, i64* %r1
br label %returnLabel

lab1:
%r5 = load i64, i64* %r2
%r6 = icmp sle i64 %r5, 2
br i1 %r6, label %lab2, label %lab3

lab2:
store i64 1, i64* %r1
br label %returnLabel

lab3:
%r7 = load i64, i64* %r2
%r8 = sub i64 %r7, 1
%r9 = call i64 @computeFib(i64 %r8)
%r10 = load i64, i64* %r2
%r11 = sub i64 %r10, 2
%r12 = call i64 @computeFib(i64 %r11)
%r13 = add i64 %r9, %r12
store i64 %r13, i64* %r1
br label %returnLabel

returnLabel:
%r14 = load i64, i64* %r1
ret i64 %r14

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r3 = load i64, i64* @.read_scratch
store i64 %r3, i64* %r1
%r4 = load i64, i64* %r1
%r5 = call i64 @computeFib(i64 %r4)
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r5)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r7 = load i64, i64* %r0
ret i64 %r7

}

