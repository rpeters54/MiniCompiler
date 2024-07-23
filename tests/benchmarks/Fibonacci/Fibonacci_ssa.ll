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
%r1 = icmp eq i64 %r0, 0
br i1 %r1, label %returnLabel, label %lab1

lab1:
%r3 = icmp sle i64 %r0, 2
br i1 %r3, label %returnLabel, label %lab3

lab3:
%r5 = sub i64 %r0, 1
%r6 = call i64 @computeFib(i64 %r5)
%r7 = sub i64 %r0, 2
%r8 = call i64 @computeFib(i64 %r7)
%r9 = add i64 %r6, %r8
br label %returnLabel

returnLabel:
%r10 = phi i64 [0, %prologue], [1, %lab1], [%r9, %lab3]
ret i64 %r10

}

define i64 @main() {
prologue:
%r0 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r1 = load i64, i64* @.read_scratch
%r2 = call i64 @computeFib(i64 %r1)
%r3 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r2)
ret i64 0

}

