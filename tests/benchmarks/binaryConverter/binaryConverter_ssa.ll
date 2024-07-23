declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8


define i64 @wait(i64 %r0) {
returnLabel:
ret i64 0

}

define i64 @power(i64 %r0, i64 %r1) {
prologue:
%r2 = icmp sgt i64 %r1, 0
br i1 %r2, label %lab0, label %returnLabel

lab0:
%r3 = phi i64 [1, %prologue], [%r6, %lab0]
%r5 = phi i64 [%r1, %prologue], [%r7, %lab0]
%r6 = mul i64 %r3, %r0
%r7 = sub i64 %r5, 1
%r8 = icmp sgt i64 %r7, 0
br i1 %r8, label %lab0, label %returnLabel

returnLabel:
%r9 = phi i64 [1, %prologue], [%r6, %lab0]
ret i64 %r9

}

define i64 @recursiveDecimalSum(i64 %r0, i64 %r1, i64 %r2) {
prologue:
%r3 = icmp sgt i64 %r0, 0
br i1 %r3, label %lab0, label %returnLabel

lab0:
%r5 = sdiv i64 %r0, 10
%r6 = mul i64 %r5, 10
%r7 = sub i64 %r0, %r6
%r8 = icmp eq i64 %r7, 1
br i1 %r8, label %lab1, label %lab3

lab1:
%r12 = call i64 @power(i64 2, i64 %r2)
%r13 = add i64 %r1, %r12
br label %lab3

lab3:
%r14 = phi i64 [%r2, %lab1], [%r2, %lab0]
%r15 = phi i64 [%r13, %lab1], [%r1, %lab0]
%r17 = phi i64 [%r0, %lab1], [%r0, %lab0]
%r18 = sdiv i64 %r17, 10
%r19 = add i64 %r14, 1
%r20 = call i64 @recursiveDecimalSum(i64 %r18, i64 %r15, i64 %r19)
br label %returnLabel

returnLabel:
%r22 = phi i64 [%r20, %lab3], [%r1, %prologue]
ret i64 %r22

}

define i64 @convertToDecimal(i64 %r0) {
prologue:
%r1 = call i64 @recursiveDecimalSum(i64 %r0, i64 0, i64 0)
ret i64 %r1

}

define i64 @main() {
prologue:
%r0 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r1 = load i64, i64* @.read_scratch
%r2 = call i64 @convertToDecimal(i64 %r1)
%r3 = mul i64 %r2, %r2
%r4 = icmp sgt i64 %r3, 0
br i1 %r4, label %lab0, label %returnLabel

lab0:
%r6 = phi i64 [%r3, %prologue], [%r8, %lab0]
%r7 = call i64 @wait(i64 %r6)
%r8 = sub i64 %r6, 1
%r9 = icmp sgt i64 %r8, 0
br i1 %r9, label %lab0, label %returnLabel

returnLabel:
%r10 = phi i64 [%r2, %prologue], [%r2, %lab0]
%r12 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r10)
ret i64 0

}

