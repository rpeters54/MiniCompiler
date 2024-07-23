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
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
store i64 %r0, i64* %r3
store i64 %r1, i64* %r4
%r5 = load i64, i64* %r3
%r6 = load i64, i64* %r3
%r7 = load i64, i64* %r4
%r8 = sdiv i64 %r6, %r7
%r9 = load i64, i64* %r4
%r10 = mul i64 %r8, %r9
%r11 = sub i64 %r5, %r10
store i64 %r11, i64* %r2
br label %returnLabel

returnLabel:
%r12 = load i64, i64* %r2
ret i64 %r12

}

define void @hailstone(i64 %r0) {
prologue:
%r1 = alloca i64
store i64 %r0, i64* %r1
br i1 true, label %lab0, label %lab7

lab0:
%r2 = load i64, i64* %r1
%r3 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r2)
%r4 = load i64, i64* %r1
%r5 = call i64 @mod(i64 %r4, i64 2)
%r6 = icmp eq i64 %r5, 1
br i1 %r6, label %lab1, label %lab2

lab1:
%r7 = load i64, i64* %r1
%r8 = mul i64 3, %r7
%r9 = add i64 %r8, 1
store i64 %r9, i64* %r1
br label %lab3

lab2:
%r10 = load i64, i64* %r1
%r11 = sdiv i64 %r10, 2
store i64 %r11, i64* %r1
br label %lab3

lab3:
%r12 = load i64, i64* %r1
%r13 = icmp sle i64 %r12, 1
br i1 %r13, label %lab4, label %lab5

lab4:
%r14 = load i64, i64* %r1
%r15 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r14)
br label %returnLabel

lab5:
br label %lab6

lab6:
br i1 true, label %lab0, label %lab7

lab7:
br label %returnLabel

returnLabel:
ret void

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r3 = load i64, i64* @.read_scratch
store i64 %r3, i64* %r1
%r4 = load i64, i64* %r1
call void @hailstone(i64 %r4)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r5 = load i64, i64* %r0
ret i64 %r5

}

