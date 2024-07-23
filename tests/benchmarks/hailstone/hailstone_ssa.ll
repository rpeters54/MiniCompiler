declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8


define i64 @mod(i64 %r0, i64 %r1) {
prologue:
%r2 = sdiv i64 %r0, %r1
%r3 = mul i64 %r2, %r1
%r4 = sub i64 %r0, %r3
ret i64 %r4

}

define void @hailstone(i64 %r0) {
prologue:
br i1 true, label %lab0, label %returnLabel

lab0:
%r1 = phi i64 [%r0, %prologue], [%r10, %lab6]
%r2 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r1)
%r3 = call i64 @mod(i64 %r1, i64 2)
%r4 = icmp eq i64 %r3, 1
br i1 %r4, label %lab1, label %lab2

lab1:
%r6 = mul i64 3, %r1
%r7 = add i64 %r6, 1
br label %lab3

lab2:
%r9 = sdiv i64 %r1, 2
br label %lab3

lab3:
%r10 = phi i64 [%r7, %lab1], [%r9, %lab2]
%r11 = icmp sle i64 %r10, 1
br i1 %r11, label %lab4, label %lab6

lab4:
%r13 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r10)
br label %returnLabel

lab6:
br i1 true, label %lab0, label %returnLabel

returnLabel:
ret void

}

define i64 @main() {
prologue:
%r0 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r1 = load i64, i64* @.read_scratch
call void @hailstone(i64 %r1)
ret i64 0

}

