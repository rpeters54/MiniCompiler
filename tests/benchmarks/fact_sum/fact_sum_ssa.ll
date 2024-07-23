declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8


define i64 @sum(i64 %r0, i64 %r1) {
prologue:
%r2 = add i64 %r0, %r1
ret i64 %r2

}

define i64 @fact(i64 %r0) {
prologue:
%r1 = icmp eq i64 %r0, 1
%r2 = icmp eq i64 %r0, 0
%r3 = or i1 %r1, %r2
br i1 %r3, label %returnLabel, label %lab2

lab2:
%r5 = icmp sle i64 %r0, 1
br i1 %r5, label %lab3, label %lab5

lab3:
%r8 = mul i64 -1, %r0
%r9 = call i64 @fact(i64 %r8)
br label %returnLabel

lab5:
%r11 = sub i64 %r0, 1
%r12 = call i64 @fact(i64 %r11)
%r13 = mul i64 %r0, %r12
br label %returnLabel

returnLabel:
%r14 = phi i64 [1, %prologue], [%r9, %lab3], [%r13, %lab5]
ret i64 %r14

}

define i64 @main() {
prologue:
br i1 true, label %lab0, label %returnLabel

lab0:
%r3 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r4 = load i64, i64* @.read_scratch
%r5 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r6 = load i64, i64* @.read_scratch
%r7 = call i64 @fact(i64 %r4)
%r8 = call i64 @fact(i64 %r6)
%r9 = call i64 @sum(i64 %r7, i64 %r8)
%r10 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r9)
%r11 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r12 = load i64, i64* @.read_scratch
%r14 = icmp ne i64 %r12, -1
br i1 %r14, label %lab0, label %returnLabel

returnLabel:
ret i64 0

}

