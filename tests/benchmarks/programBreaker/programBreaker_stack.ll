declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

@GLOBAL = common global i64 0
@count = common global i64 0

define i64 @fun2(i64 %r0, i64 %r1) {
prologue:
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
store i64 %r0, i64* %r3
store i64 %r1, i64* %r4
%r5 = load i64, i64* %r3
%r6 = icmp eq i64 %r5, 0
br i1 %r6, label %lab0, label %lab1

lab0:
%r7 = load i64, i64* %r4
store i64 %r7, i64* %r2
br label %returnLabel

lab1:
%r8 = load i64, i64* %r3
%r9 = sub i64 %r8, 1
%r10 = load i64, i64* %r4
%r11 = call i64 @fun2(i64 %r9, i64 %r10)
store i64 %r11, i64* %r2
br label %returnLabel

returnLabel:
%r12 = load i64, i64* %r2
ret i64 %r12

}

define i64 @fun1(i64 %r0, i64 %r1, i64 %r2) {
prologue:
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca i64
%r7 = alloca i64
store i64 %r0, i64* %r4
store i64 %r1, i64* %r5
store i64 %r2, i64* %r6
%r8 = add i64 5, 6
%r9 = load i64, i64* %r4
%r10 = mul i64 %r9, 2
%r11 = sub i64 %r8, %r10
%r12 = load i64, i64* %r5
%r13 = sdiv i64 4, %r12
%r14 = add i64 %r11, %r13
%r15 = load i64, i64* %r6
%r16 = add i64 %r14, %r15
store i64 %r16, i64* %r7
%r17 = load i64, i64* %r7
%r18 = load i64, i64* %r5
%r19 = icmp sgt i64 %r17, %r18
br i1 %r19, label %lab0, label %lab1

lab0:
%r20 = load i64, i64* %r7
%r21 = load i64, i64* %r4
%r22 = call i64 @fun2(i64 %r20, i64 %r21)
store i64 %r22, i64* %r3
br label %returnLabel

lab1:
%r23 = icmp slt i64 5, 6
%r24 = load i64, i64* %r7
%r25 = load i64, i64* %r5
%r26 = icmp sle i64 %r24, %r25
%r27 = and i1 %r23, %r26
br i1 %r27, label %lab2, label %lab3

lab2:
%r28 = load i64, i64* %r7
%r29 = load i64, i64* %r5
%r30 = call i64 @fun2(i64 %r28, i64 %r29)
store i64 %r30, i64* %r3
br label %returnLabel

lab3:
br label %lab4

lab4:
br label %lab5

lab5:
%r31 = load i64, i64* %r7
store i64 %r31, i64* %r3
br label %returnLabel

returnLabel:
%r32 = load i64, i64* %r3
ret i64 %r32

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
store i64 0, i64* %r1
%r2 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r3 = load i64, i64* @.read_scratch
store i64 %r3, i64* %r1
%r4 = load i64, i64* %r1
%r5 = icmp slt i64 %r4, 10000
br i1 %r5, label %lab0, label %lab1

lab0:
%r6 = load i64, i64* %r1
%r7 = call i64 @fun1(i64 3, i64 %r6, i64 5)
%r8 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r7)
%r9 = load i64, i64* %r1
%r10 = add i64 %r9, 1
store i64 %r10, i64* %r1
%r11 = load i64, i64* %r1
%r12 = icmp slt i64 %r11, 10000
br i1 %r12, label %lab0, label %lab1

lab1:
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r13 = load i64, i64* %r0
ret i64 %r13

}

