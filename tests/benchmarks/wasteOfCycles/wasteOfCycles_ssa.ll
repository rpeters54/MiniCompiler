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
%r1 = icmp sle i64 %r0, 0
br i1 %r1, label %returnLabel, label %lab2

lab2:
%r3 = mul i64 %r0, %r0
%r4 = icmp slt i64 0, %r3
br i1 %r4, label %lab3, label %lab4

lab3:
%r5 = phi i64 [0, %lab2], [%r9, %lab3]
%r7 = add i64 %r5, %r0
%r8 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r7)
%r9 = add i64 %r5, 1
%r10 = mul i64 %r0, %r0
%r11 = icmp slt i64 %r9, %r10
br i1 %r11, label %lab3, label %lab4

lab4:
%r13 = phi i64 [%r0, %lab2], [%r0, %lab3]
%r14 = sub i64 %r13, 1
%r15 = call i64 @function(i64 %r14)
br label %returnLabel

returnLabel:
%r16 = phi i64 [0, %prologue], [%r15, %lab4]
ret i64 %r16

}

define i64 @main() {
prologue:
%r0 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r1 = load i64, i64* @.read_scratch
%r2 = call i64 @function(i64 %r1)
%r3 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
ret i64 0

}

