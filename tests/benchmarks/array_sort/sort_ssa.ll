declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8


define void @sort(i64* %r0, i64 %r1) {
prologue:
%r2 = icmp slt i64 0, %r1
br i1 %r2, label %lab0, label %returnLabel

lab0:
%r3 = phi i64* [%r0, %prologue], [%r35, %lab2]
%r4 = phi i64 [%r1, %prologue], [%r36, %lab2]
%r5 = phi i64 [0, %prologue], [%r39, %lab2]
%r6 = icmp sgt i64 %r5, 0
%r7 = getelementptr inbounds i64, i64* %r3, i64 %r5
%r8 = load i64, i64* %r7
%r9 = sub i64 %r5, 1
%r10 = getelementptr inbounds i64, i64* %r3, i64 %r9
%r11 = load i64, i64* %r10
%r12 = icmp slt i64 %r8, %r11
%r13 = and i1 %r6, %r12
br i1 %r13, label %lab1, label %lab2

lab1:
%r17 = phi i64 [%r5, %lab0], [%r26, %lab1]
%r18 = getelementptr inbounds i64, i64* %r3, i64 %r17
%r19 = load i64, i64* %r18
%r20 = getelementptr inbounds i64, i64* %r3, i64 %r17
%r21 = sub i64 %r17, 1
%r22 = getelementptr inbounds i64, i64* %r3, i64 %r21
%r23 = load i64, i64* %r22
store i64 %r23, i64* %r20
%r24 = sub i64 %r17, 1
%r25 = getelementptr inbounds i64, i64* %r3, i64 %r24
store i64 %r19, i64* %r25
%r26 = sub i64 %r17, 1
%r27 = icmp sgt i64 %r26, 0
%r28 = getelementptr inbounds i64, i64* %r3, i64 %r26
%r29 = load i64, i64* %r28
%r30 = sub i64 %r26, 1
%r31 = getelementptr inbounds i64, i64* %r3, i64 %r30
%r32 = load i64, i64* %r31
%r33 = icmp slt i64 %r29, %r32
%r34 = and i1 %r27, %r33
br i1 %r34, label %lab1, label %lab2

lab2:
%r35 = phi i64* [%r3, %lab0], [%r3, %lab1]
%r36 = phi i64 [%r4, %lab0], [%r4, %lab1]
%r37 = phi i64 [%r5, %lab0], [%r5, %lab1]
%r39 = add i64 %r37, 1
%r40 = icmp slt i64 %r39, %r36
br i1 %r40, label %lab0, label %returnLabel

returnLabel:
ret void

}

define i64 @main() {
prologue:
%r0 = alloca [10 x i64]
%r1 = bitcast [10 x i64]* %r0 to i64*
br i1 true, label %lab0, label %lab1

lab0:
%r4 = phi i64 [0, %prologue], [%r8, %lab0]
%r5 = getelementptr inbounds i64, i64* %r1, i64 %r4
%r6 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r7 = load i64, i64* @.read_scratch
store i64 %r7, i64* %r5
%r8 = add i64 %r4, 1
%r9 = icmp slt i64 %r8, 10
br i1 %r9, label %lab0, label %lab1

lab1:
%r10 = phi i64* [%r1, %prologue], [%r1, %lab0]
call void @sort(i64* %r10, i64 10)
br i1 true, label %lab2, label %returnLabel

lab2:
%r14 = phi i64 [0, %lab1], [%r18, %lab2]
%r15 = getelementptr inbounds i64, i64* %r10, i64 %r14
%r16 = load i64, i64* %r15
%r17 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r16)
%r18 = add i64 %r14, 1
%r19 = icmp slt i64 %r18, 10
br i1 %r19, label %lab2, label %returnLabel

returnLabel:
ret i64 0

}

