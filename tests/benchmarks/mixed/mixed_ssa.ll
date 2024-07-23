declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.simple = type {i64}
%struct.foo = type {i64, i1, %struct.simple*}
@globalfoo = common global %struct.foo* null

define void @tailrecursive(i64 %r0) {
prologue:
%r1 = icmp sle i64 %r0, 0
br i1 %r1, label %returnLabel, label %lab2

lab2:
%r3 = sub i64 %r0, 1
call void @tailrecursive(i64 %r3)
br label %returnLabel

returnLabel:
ret void

}

define i64 @add(i64 %r0, i64 %r1) {
prologue:
%r2 = add i64 %r0, %r1
ret i64 %r2

}

define void @domath(i64 %r0) {
prologue:
%r1 = call i8* @malloc(i64 17)
%r2 = bitcast i8* %r1 to %struct.foo*
%r3 = getelementptr inbounds %struct.foo, %struct.foo* %r2, i32 0, i32 2
%r4 = call i8* @malloc(i64 8)
%r5 = bitcast i8* %r4 to %struct.simple*
store %struct.simple* %r5, %struct.simple** %r3
%r6 = call i8* @malloc(i64 17)
%r7 = bitcast i8* %r6 to %struct.foo*
%r8 = getelementptr inbounds %struct.foo, %struct.foo* %r7, i32 0, i32 2
%r9 = call i8* @malloc(i64 8)
%r10 = bitcast i8* %r9 to %struct.simple*
store %struct.simple* %r10, %struct.simple** %r8
%r11 = getelementptr inbounds %struct.foo, %struct.foo* %r2, i32 0, i32 0
store i64 %r0, i64* %r11
%r12 = getelementptr inbounds %struct.foo, %struct.foo* %r7, i32 0, i32 0
store i64 3, i64* %r12
%r13 = getelementptr inbounds %struct.foo, %struct.foo* %r2, i32 0, i32 2
%r14 = load %struct.simple*, %struct.simple** %r13
%r15 = getelementptr inbounds %struct.simple, %struct.simple* %r14, i32 0, i32 0
%r16 = getelementptr inbounds %struct.foo, %struct.foo* %r2, i32 0, i32 0
%r17 = load i64, i64* %r16
store i64 %r17, i64* %r15
%r18 = getelementptr inbounds %struct.foo, %struct.foo* %r7, i32 0, i32 2
%r19 = load %struct.simple*, %struct.simple** %r18
%r20 = getelementptr inbounds %struct.simple, %struct.simple* %r19, i32 0, i32 0
%r21 = getelementptr inbounds %struct.foo, %struct.foo* %r7, i32 0, i32 0
%r22 = load i64, i64* %r21
store i64 %r22, i64* %r20
%r23 = icmp sgt i64 %r0, 0
br i1 %r23, label %lab0, label %returnLabel

lab0:
%r25 = phi i64 [%r0, %prologue], [%r52, %lab0]
%r27 = getelementptr inbounds %struct.foo, %struct.foo* %r2, i32 0, i32 0
%r28 = load i64, i64* %r27
%r29 = getelementptr inbounds %struct.foo, %struct.foo* %r7, i32 0, i32 0
%r30 = load i64, i64* %r29
%r32 = getelementptr inbounds %struct.foo, %struct.foo* %r2, i32 0, i32 2
%r33 = load %struct.simple*, %struct.simple** %r32
%r34 = getelementptr inbounds %struct.simple, %struct.simple* %r33, i32 0, i32 0
%r35 = load i64, i64* %r34
%r37 = getelementptr inbounds %struct.foo, %struct.foo* %r7, i32 0, i32 0
%r38 = load i64, i64* %r37
%r40 = getelementptr inbounds %struct.foo, %struct.foo* %r7, i32 0, i32 2
%r41 = load %struct.simple*, %struct.simple** %r40
%r42 = getelementptr inbounds %struct.simple, %struct.simple* %r41, i32 0, i32 0
%r43 = load i64, i64* %r42
%r44 = getelementptr inbounds %struct.foo, %struct.foo* %r2, i32 0, i32 0
%r45 = load i64, i64* %r44
%r46 = call i64 @add(i64 %r43, i64 %r45)
%r47 = getelementptr inbounds %struct.foo, %struct.foo* %r7, i32 0, i32 0
%r48 = load i64, i64* %r47
%r49 = getelementptr inbounds %struct.foo, %struct.foo* %r2, i32 0, i32 0
%r50 = load i64, i64* %r49
%r52 = sub i64 %r25, 1
%r53 = icmp sgt i64 %r52, 0
br i1 %r53, label %lab0, label %returnLabel

returnLabel:
%r54 = phi %struct.foo* [%r2, %prologue], [%r2, %lab0]
%r56 = phi %struct.foo* [%r7, %prologue], [%r7, %lab0]
%r57 = getelementptr inbounds %struct.foo, %struct.foo* %r54, i32 0, i32 2
%r58 = load %struct.simple*, %struct.simple** %r57
%r59 = bitcast %struct.simple* %r58 to i8*
call void @free(i8* %r59)
%r60 = getelementptr inbounds %struct.foo, %struct.foo* %r56, i32 0, i32 2
%r61 = load %struct.simple*, %struct.simple** %r60
%r62 = bitcast %struct.simple* %r61 to i8*
call void @free(i8* %r62)
%r63 = bitcast %struct.foo* %r54 to i8*
call void @free(i8* %r63)
%r64 = bitcast %struct.foo* %r56 to i8*
call void @free(i8* %r64)
ret void

}

define void @objinstantiation(i64 %r0) {
prologue:
%r1 = icmp sgt i64 %r0, 0
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r2 = phi i64 [%r0, %prologue], [%r6, %lab0]
%r3 = call i8* @malloc(i64 17)
%r4 = bitcast i8* %r3 to %struct.foo*
%r5 = bitcast %struct.foo* %r4 to i8*
call void @free(i8* %r5)
%r6 = sub i64 %r2, 1
%r7 = icmp sgt i64 %r6, 0
br i1 %r7, label %lab0, label %returnLabel

returnLabel:
ret void

}

define i64 @ackermann(i64 %r0, i64 %r1) {
prologue:
%r2 = icmp eq i64 %r0, 0
br i1 %r2, label %lab0, label %lab2

lab0:
%r4 = add i64 %r1, 1
br label %returnLabel

lab2:
%r6 = icmp eq i64 %r1, 0
br i1 %r6, label %lab3, label %lab4

lab3:
%r8 = sub i64 %r0, 1
%r9 = call i64 @ackermann(i64 %r8, i64 1)
br label %returnLabel

lab4:
%r11 = sub i64 %r0, 1
%r13 = sub i64 %r1, 1
%r14 = call i64 @ackermann(i64 %r0, i64 %r13)
%r15 = call i64 @ackermann(i64 %r11, i64 %r14)
br label %returnLabel

returnLabel:
%r16 = phi i64 [%r4, %lab0], [%r9, %lab3], [%r15, %lab4]
ret i64 %r16

}

define i64 @main() {
prologue:
%r0 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r1 = load i64, i64* @.read_scratch
%r2 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r3 = load i64, i64* @.read_scratch
%r4 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r5 = load i64, i64* @.read_scratch
%r6 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r7 = load i64, i64* @.read_scratch
%r8 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r9 = load i64, i64* @.read_scratch
call void @tailrecursive(i64 %r1)
%r10 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r1)
call void @domath(i64 %r3)
%r11 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r3)
call void @objinstantiation(i64 %r5)
%r12 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r5)
%r13 = call i64 @ackermann(i64 %r7, i64 %r9)
%r14 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r13)
ret i64 0

}

