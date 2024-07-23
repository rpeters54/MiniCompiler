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
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
store i64 %r0, i64* %r3
store i64 %r1, i64* %r4
%r5 = load i64, i64* %r3
%r6 = load i64, i64* %r4
%r7 = add i64 %r5, %r6
store i64 %r7, i64* %r2
br label %returnLabel

returnLabel:
%r8 = load i64, i64* %r2
ret i64 %r8

}

define i64 @fact(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
store i64 %r0, i64* %r2
%r4 = load i64, i64* %r2
%r5 = icmp eq i64 %r4, 1
%r6 = load i64, i64* %r2
%r7 = icmp eq i64 %r6, 0
%r8 = or i1 %r5, %r7
br i1 %r8, label %lab0, label %lab1

lab0:
store i64 1, i64* %r1
br label %returnLabel

lab1:
br label %lab2

lab2:
%r9 = load i64, i64* %r2
%r10 = icmp sle i64 %r9, 1
br i1 %r10, label %lab3, label %lab4

lab3:
%r11 = sub i64 0, 1
%r12 = load i64, i64* %r2
%r13 = mul i64 %r11, %r12
%r14 = call i64 @fact(i64 %r13)
store i64 %r14, i64* %r1
br label %returnLabel

lab4:
br label %lab5

lab5:
%r15 = load i64, i64* %r2
%r16 = load i64, i64* %r2
%r17 = sub i64 %r16, 1
%r18 = call i64 @fact(i64 %r17)
%r19 = mul i64 %r15, %r18
store i64 %r19, i64* %r3
%r20 = load i64, i64* %r3
store i64 %r20, i64* %r1
br label %returnLabel

returnLabel:
%r21 = load i64, i64* %r1
ret i64 %r21

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
store i64 0, i64* %r3
%r4 = load i64, i64* %r3
%r5 = sub i64 0, 1
%r6 = icmp ne i64 %r4, %r5
br i1 %r6, label %lab0, label %lab1

lab0:
%r7 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r8 = load i64, i64* @.read_scratch
store i64 %r8, i64* %r1
%r9 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r10 = load i64, i64* @.read_scratch
store i64 %r10, i64* %r2
%r11 = load i64, i64* %r1
%r12 = call i64 @fact(i64 %r11)
store i64 %r12, i64* %r1
%r13 = load i64, i64* %r2
%r14 = call i64 @fact(i64 %r13)
store i64 %r14, i64* %r2
%r15 = load i64, i64* %r1
%r16 = load i64, i64* %r2
%r17 = call i64 @sum(i64 %r15, i64 %r16)
%r18 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r17)
%r19 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r20 = load i64, i64* @.read_scratch
store i64 %r20, i64* %r3
%r21 = load i64, i64* %r3
%r22 = sub i64 0, 1
%r23 = icmp ne i64 %r21, %r22
br i1 %r23, label %lab0, label %lab1

lab1:
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r24 = load i64, i64* %r0
ret i64 %r24

}

