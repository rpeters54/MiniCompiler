declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8


define i64 @wait(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
store i64 %r0, i64* %r2
%r3 = load i64, i64* %r2
%r4 = icmp sgt i64 %r3, 0
br i1 %r4, label %lab0, label %lab1

lab0:
%r5 = load i64, i64* %r2
%r6 = sub i64 %r5, 1
store i64 %r6, i64* %r2
%r7 = load i64, i64* %r2
%r8 = icmp sgt i64 %r7, 0
br i1 %r8, label %lab0, label %lab1

lab1:
store i64 0, i64* %r1
br label %returnLabel

returnLabel:
%r9 = load i64, i64* %r1
ret i64 %r9

}

define i64 @power(i64 %r0, i64 %r1) {
prologue:
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
store i64 %r0, i64* %r3
store i64 %r1, i64* %r4
store i64 1, i64* %r5
%r6 = load i64, i64* %r4
%r7 = icmp sgt i64 %r6, 0
br i1 %r7, label %lab0, label %lab1

lab0:
%r8 = load i64, i64* %r5
%r9 = load i64, i64* %r3
%r10 = mul i64 %r8, %r9
store i64 %r10, i64* %r5
%r11 = load i64, i64* %r4
%r12 = sub i64 %r11, 1
store i64 %r12, i64* %r4
%r13 = load i64, i64* %r4
%r14 = icmp sgt i64 %r13, 0
br i1 %r14, label %lab0, label %lab1

lab1:
%r15 = load i64, i64* %r5
store i64 %r15, i64* %r2
br label %returnLabel

returnLabel:
%r16 = load i64, i64* %r2
ret i64 %r16

}

define i64 @recursiveDecimalSum(i64 %r0, i64 %r1, i64 %r2) {
prologue:
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca i64
%r7 = alloca i64
%r8 = alloca i64
%r9 = alloca i64
store i64 %r0, i64* %r4
store i64 %r1, i64* %r5
store i64 %r2, i64* %r6
%r10 = load i64, i64* %r4
%r11 = icmp sgt i64 %r10, 0
br i1 %r11, label %lab0, label %lab4

lab0:
store i64 2, i64* %r8
%r12 = load i64, i64* %r4
%r13 = sdiv i64 %r12, 10
store i64 %r13, i64* %r7
%r14 = load i64, i64* %r7
%r15 = mul i64 %r14, 10
store i64 %r15, i64* %r7
%r16 = load i64, i64* %r4
%r17 = load i64, i64* %r7
%r18 = sub i64 %r16, %r17
store i64 %r18, i64* %r7
%r19 = load i64, i64* %r7
%r20 = icmp eq i64 %r19, 1
br i1 %r20, label %lab1, label %lab2

lab1:
%r21 = load i64, i64* %r5
%r22 = load i64, i64* %r8
%r23 = load i64, i64* %r6
%r24 = call i64 @power(i64 %r22, i64 %r23)
%r25 = add i64 %r21, %r24
store i64 %r25, i64* %r5
br label %lab3

lab2:
br label %lab3

lab3:
%r26 = load i64, i64* %r4
%r27 = sdiv i64 %r26, 10
%r28 = load i64, i64* %r5
%r29 = load i64, i64* %r6
%r30 = add i64 %r29, 1
%r31 = call i64 @recursiveDecimalSum(i64 %r27, i64 %r28, i64 %r30)
store i64 %r31, i64* %r3
br label %returnLabel

lab4:
br label %lab5

lab5:
%r32 = load i64, i64* %r5
store i64 %r32, i64* %r3
br label %returnLabel

returnLabel:
%r33 = load i64, i64* %r3
ret i64 %r33

}

define i64 @convertToDecimal(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
store i64 %r0, i64* %r2
store i64 0, i64* %r3
store i64 0, i64* %r4
%r5 = load i64, i64* %r2
%r6 = load i64, i64* %r4
%r7 = load i64, i64* %r3
%r8 = call i64 @recursiveDecimalSum(i64 %r5, i64 %r6, i64 %r7)
store i64 %r8, i64* %r1
br label %returnLabel

returnLabel:
%r9 = load i64, i64* %r1
ret i64 %r9

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r4 = load i64, i64* @.read_scratch
store i64 %r4, i64* %r1
%r5 = load i64, i64* %r1
%r6 = call i64 @convertToDecimal(i64 %r5)
store i64 %r6, i64* %r1
%r7 = load i64, i64* %r1
%r8 = load i64, i64* %r1
%r9 = mul i64 %r7, %r8
store i64 %r9, i64* %r2
%r10 = load i64, i64* %r2
%r11 = icmp sgt i64 %r10, 0
br i1 %r11, label %lab0, label %lab1

lab0:
%r12 = load i64, i64* %r2
%r13 = call i64 @wait(i64 %r12)
%r14 = load i64, i64* %r2
%r15 = sub i64 %r14, 1
store i64 %r15, i64* %r2
%r16 = load i64, i64* %r2
%r17 = icmp sgt i64 %r16, 0
br i1 %r17, label %lab0, label %lab1

lab1:
%r18 = load i64, i64* %r1
%r19 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r18)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r20 = load i64, i64* %r0
ret i64 %r20

}

