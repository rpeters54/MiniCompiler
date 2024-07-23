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
%r2 = icmp eq i64 %r0, 0
br i1 %r2, label %returnLabel, label %lab1

lab1:
%r5 = sub i64 %r0, 1
%r7 = call i64 @fun2(i64 %r5, i64 %r1)
br label %returnLabel

returnLabel:
%r8 = phi i64 [%r1, %prologue], [%r7, %lab1]
ret i64 %r8

}

define i64 @fun1(i64 %r0, i64 %r1, i64 %r2) {
prologue:
%r4 = mul i64 %r0, 2
%r5 = sub i64 11, %r4
%r6 = sdiv i64 4, %r1
%r7 = add i64 %r5, %r6
%r8 = add i64 %r7, %r2
%r9 = icmp sgt i64 %r8, %r1
br i1 %r9, label %lab0, label %lab1

lab0:
%r12 = call i64 @fun2(i64 %r8, i64 %r0)
br label %returnLabel

lab1:
%r16 = icmp sle i64 %r8, %r1
%r17 = and i1 true, %r16
br i1 %r17, label %lab2, label %returnLabel

lab2:
%r20 = call i64 @fun2(i64 %r8, i64 %r1)
br label %returnLabel

returnLabel:
%r22 = phi i64 [%r12, %lab0], [%r20, %lab2], [%r8, %lab1]
ret i64 %r22

}

define i64 @main() {
prologue:
%r0 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r1 = load i64, i64* @.read_scratch
%r2 = icmp slt i64 %r1, 10000
br i1 %r2, label %lab0, label %returnLabel

lab0:
%r3 = phi i64 [%r1, %prologue], [%r6, %lab0]
%r4 = call i64 @fun1(i64 3, i64 %r3, i64 5)
%r5 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r4)
%r6 = add i64 %r3, 1
%r7 = icmp slt i64 %r6, 10000
br i1 %r7, label %lab0, label %returnLabel

returnLabel:
ret i64 0

}

