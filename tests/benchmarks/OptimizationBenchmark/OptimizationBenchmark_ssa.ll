declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

@global1 = common global i64 0
@global2 = common global i64 0
@global3 = common global i64 0

define i64 @constantFolding() {
returnLabel:
ret i64 226

}

define i64 @constantPropagation() {
returnLabel:
ret i64 -25457889

}

define i64 @deadCodeElimination() {
prologue:
store i64 11, i64* @global1
store i64 5, i64* @global1
store i64 9, i64* @global1
ret i64 38

}

define i64 @sum(i64 %r0) {
prologue:
%r1 = icmp sgt i64 %r0, 0
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r2 = phi i64 [%r0, %prologue], [%r5, %lab0]
%r3 = phi i64 [0, %prologue], [%r4, %lab0]
%r4 = add i64 %r3, %r2
%r5 = sub i64 %r2, 1
%r6 = icmp sgt i64 %r5, 0
br i1 %r6, label %lab0, label %returnLabel

returnLabel:
%r8 = phi i64 [0, %prologue], [%r4, %lab0]
ret i64 %r8

}

define i64 @doesntModifyGlobals() {
returnLabel:
ret i64 3

}

define i64 @interProceduralOptimization() {
prologue:
store i64 1, i64* @global1
store i64 0, i64* @global2
store i64 0, i64* @global3
%r0 = call i64 @sum(i64 100)
%r1 = load i64, i64* @global1
%r2 = icmp eq i64 %r1, 1
br i1 %r2, label %lab0, label %lab1

lab0:
%r3 = call i64 @sum(i64 10000)
br label %returnLabel

lab1:
%r4 = load i64, i64* @global2
%r5 = icmp eq i64 %r4, 2
br i1 %r5, label %lab2, label %lab4

lab2:
%r6 = call i64 @sum(i64 20000)
br label %lab4

lab4:
%r7 = phi i64 [%r6, %lab2], [%r0, %lab1]
%r8 = load i64, i64* @global3
%r9 = icmp eq i64 %r8, 3
br i1 %r9, label %lab5, label %lab7

lab5:
%r10 = call i64 @sum(i64 30000)
br label %lab7

lab7:
%r11 = phi i64 [%r10, %lab5], [%r7, %lab4]
br label %returnLabel

returnLabel:
%r12 = phi i64 [%r3, %lab0], [%r11, %lab7]
ret i64 %r12

}

define i64 @commonSubexpressionElimination() {
returnLabel:
ret i64 -48796

}

define i64 @hoisting() {
prologue:
br i1 true, label %lab0, label %returnLabel

lab0:
%r5 = phi i64 [0, %prologue], [%r10, %lab0]
%r10 = add i64 %r5, 1
%r11 = icmp slt i64 %r10, 1000000
br i1 %r11, label %lab0, label %returnLabel

returnLabel:
%r13 = phi i64 [2, %prologue], [2, %lab0]
ret i64 %r13

}

define i64 @doubleIf() {
prologue:
%r11 = select i1 true, i64 50, i64 0
ret i64 %r11

}

define i64 @integerDivide() {
returnLabel:
ret i64 736

}

define i64 @association() {
returnLabel:
ret i64 10

}

define i64 @tailRecursionHelper(i64 %r0, i64 %r1) {
prologue:
%r2 = icmp eq i64 %r0, 0
br i1 %r2, label %returnLabel, label %lab1

lab1:
%r5 = sub i64 %r0, 1
%r7 = add i64 %r1, %r0
%r8 = call i64 @tailRecursionHelper(i64 %r5, i64 %r7)
br label %returnLabel

returnLabel:
%r9 = phi i64 [%r1, %prologue], [%r8, %lab1]
ret i64 %r9

}

define i64 @tailRecursion(i64 %r0) {
prologue:
%r1 = call i64 @tailRecursionHelper(i64 %r0, i64 0)
ret i64 %r1

}

define i64 @unswitching() {
prologue:
br i1 true, label %lab0, label %returnLabel

lab0:
%r1 = phi i64 [1, %prologue], [%r8, %lab3]
br i1 true, label %lab1, label %lab2

lab1:
%r5 = add i64 %r1, 1
br label %lab3

lab2:
%r7 = add i64 %r1, 2
br label %lab3

lab3:
%r8 = phi i64 [%r5, %lab1], [%r7, %lab2]
%r9 = icmp slt i64 %r8, 1000000
br i1 %r9, label %lab0, label %returnLabel

returnLabel:
%r10 = phi i64 [1, %prologue], [%r8, %lab3]
ret i64 %r10

}

define i64 @randomCalculation(i64 %r0) {
prologue:
%r1 = icmp slt i64 0, %r0
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r3 = phi i64 [0, %prologue], [%r14, %lab0]
%r4 = phi i64 [0, %prologue], [%r7, %lab0]
%r7 = add i64 %r4, 19
%r8 = mul i64 %r3, 2
%r9 = sdiv i64 %r8, 2
%r10 = mul i64 3, %r9
%r11 = sdiv i64 %r10, 3
%r12 = mul i64 %r11, 4
%r13 = sdiv i64 %r12, 4
%r14 = add i64 %r13, 1
%r15 = icmp slt i64 %r14, %r0
br i1 %r15, label %lab0, label %returnLabel

returnLabel:
%r18 = phi i64 [0, %prologue], [%r7, %lab0]
ret i64 %r18

}

define i64 @iterativeFibonacci(i64 %r0) {
prologue:
%r2 = icmp slt i64 0, %r0
br i1 %r2, label %lab0, label %returnLabel

lab0:
%r3 = phi i64 [1, %prologue], [%r7, %lab0]
%r5 = phi i64 [-1, %prologue], [%r3, %lab0]
%r6 = phi i64 [0, %prologue], [%r8, %lab0]
%r7 = add i64 %r3, %r5
%r8 = add i64 %r6, 1
%r9 = icmp slt i64 %r8, %r0
br i1 %r9, label %lab0, label %returnLabel

returnLabel:
%r10 = phi i64 [1, %prologue], [%r7, %lab0]
ret i64 %r10

}

define i64 @recursiveFibonacci(i64 %r0) {
prologue:
%r1 = icmp sle i64 %r0, 0
%r2 = icmp eq i64 %r0, 1
%r3 = or i1 %r1, %r2
br i1 %r3, label %returnLabel, label %lab1

lab1:
%r6 = sub i64 %r0, 1
%r7 = call i64 @recursiveFibonacci(i64 %r6)
%r8 = sub i64 %r0, 2
%r9 = call i64 @recursiveFibonacci(i64 %r8)
%r10 = add i64 %r7, %r9
br label %returnLabel

returnLabel:
%r11 = phi i64 [%r0, %prologue], [%r10, %lab1]
ret i64 %r11

}

define i64 @main() {
prologue:
%r0 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r1 = load i64, i64* @.read_scratch
%r2 = icmp slt i64 1, %r1
br i1 %r2, label %lab0, label %returnLabel

lab0:
%r4 = phi i64 [1, %prologue], [%r36, %lab0]
%r5 = call i64 @constantFolding()
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r5)
%r7 = call i64 @constantPropagation()
%r8 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r7)
%r9 = call i64 @deadCodeElimination()
%r10 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r9)
%r11 = call i64 @interProceduralOptimization()
%r12 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r11)
%r13 = call i64 @commonSubexpressionElimination()
%r14 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r13)
%r15 = call i64 @hoisting()
%r16 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r15)
%r17 = call i64 @doubleIf()
%r18 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r17)
%r19 = call i64 @integerDivide()
%r20 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r19)
%r21 = call i64 @association()
%r22 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r21)
%r23 = sdiv i64 %r1, 1000
%r24 = call i64 @tailRecursion(i64 %r23)
%r25 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r24)
%r26 = call i64 @unswitching()
%r27 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r26)
%r28 = call i64 @randomCalculation(i64 %r1)
%r29 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r28)
%r30 = sdiv i64 %r1, 5
%r31 = call i64 @iterativeFibonacci(i64 %r30)
%r32 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r31)
%r33 = sdiv i64 %r1, 1000
%r34 = call i64 @recursiveFibonacci(i64 %r33)
%r35 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r34)
%r36 = add i64 %r4, 1
%r37 = icmp slt i64 %r36, %r1
br i1 %r37, label %lab0, label %returnLabel

returnLabel:
%r40 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 9999)
ret i64 0

}

