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
%r3 = icmp sge i64 %r2, %r1
br i1 %r3, label %returnLabel, label %lab2

lab2:
%r6 = getelementptr inbounds i64, i64* %r0, i64 %r2
%r7 = load i64, i64* %r6
%r9 = add i64 %r2, 1
%r10 = call i64 @sum(i64* %r0, i64 %r1, i64 %r9)
%r11 = add i64 %r7, %r10
br label %returnLabel

returnLabel:
%r12 = phi i64 [0, %prologue], [%r11, %lab2]
ret i64 %r12

}

define i64 @main() {
prologue:
%r0 = alloca [10 x i64]
%r1 = bitcast [10 x i64]* %r0 to i64*
br i1 true, label %lab0, label %returnLabel

lab0:
%r4 = phi i64 [0, %prologue], [%r8, %lab0]
%r5 = getelementptr inbounds i64, i64* %r1, i64 %r4
%r6 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r7 = load i64, i64* @.read_scratch
store i64 %r7, i64* %r5
%r8 = add i64 %r4, 1
%r9 = icmp slt i64 %r8, 10
br i1 %r9, label %lab0, label %returnLabel

returnLabel:
%r10 = phi i64* [%r1, %prologue], [%r1, %lab0]
%r12 = call i64 @sum(i64* %r10, i64 10, i64 0)
%r13 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r12)
ret i64 0

}

