declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8


define i64 @sum(i64* %r0, i64 %r1, i64 %r2) {
prologue:
%r3 = alloca i64
%r4 = alloca i64*
%r5 = alloca i64
%r6 = alloca i64
store i64* %r0, i64** %r4
store i64 %r1, i64* %r5
store i64 %r2, i64* %r6
%r7 = load i64, i64* %r6
%r8 = load i64, i64* %r5
%r9 = icmp sge i64 %r7, %r8
br i1 %r9, label %lab0, label %lab1

lab0:
store i64 0, i64* %r3
br label %returnLabel

lab1:
br label %lab2

lab2:
%r10 = load i64*, i64** %r4
%r11 = load i64, i64* %r6
%r12 = getelementptr inbounds i64, i64* %r10, i64 %r11
%r13 = load i64, i64* %r12
%r14 = load i64*, i64** %r4
%r15 = load i64, i64* %r5
%r16 = load i64, i64* %r6
%r17 = add i64 %r16, 1
%r18 = call i64 @sum(i64* %r14, i64 %r15, i64 %r17)
%r19 = add i64 %r13, %r18
store i64 %r19, i64* %r3
br label %returnLabel

returnLabel:
%r20 = load i64, i64* %r3
ret i64 %r20

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64*
%r2 = alloca i64
%r3 = alloca [10 x i64]
%r4 = bitcast [10 x i64]* %r3 to i64*
store i64* %r4, i64** %r1
store i64 0, i64* %r2
%r5 = load i64, i64* %r2
%r6 = icmp slt i64 %r5, 10
br i1 %r6, label %lab0, label %lab1

lab0:
%r7 = load i64*, i64** %r1
%r8 = load i64, i64* %r2
%r9 = getelementptr inbounds i64, i64* %r7, i64 %r8
%r10 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r11 = load i64, i64* @.read_scratch
store i64 %r11, i64* %r9
%r12 = load i64, i64* %r2
%r13 = add i64 %r12, 1
store i64 %r13, i64* %r2
%r14 = load i64, i64* %r2
%r15 = icmp slt i64 %r14, 10
br i1 %r15, label %lab0, label %lab1

lab1:
%r16 = load i64*, i64** %r1
%r17 = call i64 @sum(i64* %r16, i64 10, i64 0)
%r18 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r17)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r19 = load i64, i64* %r0
ret i64 %r19

}

