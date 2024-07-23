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
%r2 = alloca i64*
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca i64
store i64* %r0, i64** %r2
store i64 %r1, i64* %r3
store i64 0, i64* %r4
%r7 = load i64, i64* %r4
%r8 = load i64, i64* %r3
%r9 = icmp slt i64 %r7, %r8
br i1 %r9, label %lab0, label %lab3

lab0:
%r10 = load i64, i64* %r4
store i64 %r10, i64* %r6
%r11 = load i64, i64* %r6
%r12 = icmp sgt i64 %r11, 0
%r13 = load i64*, i64** %r2
%r14 = load i64, i64* %r6
%r15 = getelementptr inbounds i64, i64* %r13, i64 %r14
%r16 = load i64, i64* %r15
%r17 = load i64*, i64** %r2
%r18 = load i64, i64* %r6
%r19 = sub i64 %r18, 1
%r20 = getelementptr inbounds i64, i64* %r17, i64 %r19
%r21 = load i64, i64* %r20
%r22 = icmp slt i64 %r16, %r21
%r23 = and i1 %r12, %r22
br i1 %r23, label %lab1, label %lab2

lab1:
%r24 = load i64*, i64** %r2
%r25 = load i64, i64* %r6
%r26 = getelementptr inbounds i64, i64* %r24, i64 %r25
%r27 = load i64, i64* %r26
store i64 %r27, i64* %r5
%r28 = load i64*, i64** %r2
%r29 = load i64, i64* %r6
%r30 = getelementptr inbounds i64, i64* %r28, i64 %r29
%r31 = load i64*, i64** %r2
%r32 = load i64, i64* %r6
%r33 = sub i64 %r32, 1
%r34 = getelementptr inbounds i64, i64* %r31, i64 %r33
%r35 = load i64, i64* %r34
store i64 %r35, i64* %r30
%r36 = load i64*, i64** %r2
%r37 = load i64, i64* %r6
%r38 = sub i64 %r37, 1
%r39 = getelementptr inbounds i64, i64* %r36, i64 %r38
%r40 = load i64, i64* %r5
store i64 %r40, i64* %r39
%r41 = load i64, i64* %r6
%r42 = sub i64 %r41, 1
store i64 %r42, i64* %r6
%r43 = load i64, i64* %r6
%r44 = icmp sgt i64 %r43, 0
%r45 = load i64*, i64** %r2
%r46 = load i64, i64* %r6
%r47 = getelementptr inbounds i64, i64* %r45, i64 %r46
%r48 = load i64, i64* %r47
%r49 = load i64*, i64** %r2
%r50 = load i64, i64* %r6
%r51 = sub i64 %r50, 1
%r52 = getelementptr inbounds i64, i64* %r49, i64 %r51
%r53 = load i64, i64* %r52
%r54 = icmp slt i64 %r48, %r53
%r55 = and i1 %r44, %r54
br i1 %r55, label %lab1, label %lab2

lab2:
%r56 = load i64, i64* %r4
%r57 = add i64 %r56, 1
store i64 %r57, i64* %r4
%r58 = load i64, i64* %r4
%r59 = load i64, i64* %r3
%r60 = icmp slt i64 %r58, %r59
br i1 %r60, label %lab0, label %lab3

lab3:
br label %returnLabel

returnLabel:
ret void

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
call void @sort(i64* %r16, i64 10)
store i64 0, i64* %r2
%r17 = load i64, i64* %r2
%r18 = icmp slt i64 %r17, 10
br i1 %r18, label %lab2, label %lab3

lab2:
%r19 = load i64*, i64** %r1
%r20 = load i64, i64* %r2
%r21 = getelementptr inbounds i64, i64* %r19, i64 %r20
%r22 = load i64, i64* %r21
%r23 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r22)
%r24 = load i64, i64* %r2
%r25 = add i64 %r24, 1
store i64 %r25, i64* %r2
%r26 = load i64, i64* %r2
%r27 = icmp slt i64 %r26, 10
br i1 %r27, label %lab2, label %lab3

lab3:
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r28 = load i64, i64* %r0
ret i64 %r28

}

