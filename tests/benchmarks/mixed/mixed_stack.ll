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
%r1 = alloca i64
store i64 %r0, i64* %r1
%r2 = load i64, i64* %r1
%r3 = icmp sle i64 %r2, 0
br i1 %r3, label %lab0, label %lab1

lab0:
br label %returnLabel

lab1:
br label %lab2

lab2:
%r4 = load i64, i64* %r1
%r5 = sub i64 %r4, 1
call void @tailrecursive(i64 %r5)
br label %returnLabel

returnLabel:
ret void

}

define i64 @add(i64 %r0, i64 %r1) {
prologue:
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
store i64 %r0, i64* %r3
store i64 %r1, i64* %r4
%r5 = load i64, i64* %r3
%r6 = load i64, i64* %r4
%r7 = add i64 %r5, %r6
store i64 %r7, i64* %r2
br label %returnLabel

returnLabel:
%r8 = load i64, i64* %r2
ret i64 %r8

}

define void @domath(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca %struct.foo*
%r3 = alloca %struct.foo*
%r4 = alloca i64
store i64 %r0, i64* %r1
%r5 = call i8* @malloc(i64 17)
%r6 = bitcast i8* %r5 to %struct.foo*
store %struct.foo* %r6, %struct.foo** %r2
%r7 = load %struct.foo*, %struct.foo** %r2
%r8 = getelementptr inbounds %struct.foo, %struct.foo* %r7, i32 0, i32 2
%r9 = call i8* @malloc(i64 8)
%r10 = bitcast i8* %r9 to %struct.simple*
store %struct.simple* %r10, %struct.simple** %r8
%r11 = call i8* @malloc(i64 17)
%r12 = bitcast i8* %r11 to %struct.foo*
store %struct.foo* %r12, %struct.foo** %r3
%r13 = load %struct.foo*, %struct.foo** %r3
%r14 = getelementptr inbounds %struct.foo, %struct.foo* %r13, i32 0, i32 2
%r15 = call i8* @malloc(i64 8)
%r16 = bitcast i8* %r15 to %struct.simple*
store %struct.simple* %r16, %struct.simple** %r14
%r17 = load %struct.foo*, %struct.foo** %r2
%r18 = getelementptr inbounds %struct.foo, %struct.foo* %r17, i32 0, i32 0
%r19 = load i64, i64* %r1
store i64 %r19, i64* %r18
%r20 = load %struct.foo*, %struct.foo** %r3
%r21 = getelementptr inbounds %struct.foo, %struct.foo* %r20, i32 0, i32 0
store i64 3, i64* %r21
%r22 = load %struct.foo*, %struct.foo** %r2
%r23 = getelementptr inbounds %struct.foo, %struct.foo* %r22, i32 0, i32 2
%r24 = load %struct.simple*, %struct.simple** %r23
%r25 = getelementptr inbounds %struct.simple, %struct.simple* %r24, i32 0, i32 0
%r26 = load %struct.foo*, %struct.foo** %r2
%r27 = getelementptr inbounds %struct.foo, %struct.foo* %r26, i32 0, i32 0
%r28 = load i64, i64* %r27
store i64 %r28, i64* %r25
%r29 = load %struct.foo*, %struct.foo** %r3
%r30 = getelementptr inbounds %struct.foo, %struct.foo* %r29, i32 0, i32 2
%r31 = load %struct.simple*, %struct.simple** %r30
%r32 = getelementptr inbounds %struct.simple, %struct.simple* %r31, i32 0, i32 0
%r33 = load %struct.foo*, %struct.foo** %r3
%r34 = getelementptr inbounds %struct.foo, %struct.foo* %r33, i32 0, i32 0
%r35 = load i64, i64* %r34
store i64 %r35, i64* %r32
%r36 = load i64, i64* %r1
%r37 = icmp sgt i64 %r36, 0
br i1 %r37, label %lab0, label %lab1

lab0:
%r38 = load %struct.foo*, %struct.foo** %r2
%r39 = getelementptr inbounds %struct.foo, %struct.foo* %r38, i32 0, i32 0
%r40 = load i64, i64* %r39
%r41 = load %struct.foo*, %struct.foo** %r3
%r42 = getelementptr inbounds %struct.foo, %struct.foo* %r41, i32 0, i32 0
%r43 = load i64, i64* %r42
%r44 = mul i64 %r40, %r43
store i64 %r44, i64* %r4
%r45 = load i64, i64* %r4
%r46 = load %struct.foo*, %struct.foo** %r2
%r47 = getelementptr inbounds %struct.foo, %struct.foo* %r46, i32 0, i32 2
%r48 = load %struct.simple*, %struct.simple** %r47
%r49 = getelementptr inbounds %struct.simple, %struct.simple* %r48, i32 0, i32 0
%r50 = load i64, i64* %r49
%r51 = mul i64 %r45, %r50
%r52 = load %struct.foo*, %struct.foo** %r3
%r53 = getelementptr inbounds %struct.foo, %struct.foo* %r52, i32 0, i32 0
%r54 = load i64, i64* %r53
%r55 = sdiv i64 %r51, %r54
store i64 %r55, i64* %r4
%r56 = load %struct.foo*, %struct.foo** %r3
%r57 = getelementptr inbounds %struct.foo, %struct.foo* %r56, i32 0, i32 2
%r58 = load %struct.simple*, %struct.simple** %r57
%r59 = getelementptr inbounds %struct.simple, %struct.simple* %r58, i32 0, i32 0
%r60 = load i64, i64* %r59
%r61 = load %struct.foo*, %struct.foo** %r2
%r62 = getelementptr inbounds %struct.foo, %struct.foo* %r61, i32 0, i32 0
%r63 = load i64, i64* %r62
%r64 = call i64 @add(i64 %r60, i64 %r63)
store i64 %r64, i64* %r4
%r65 = load %struct.foo*, %struct.foo** %r3
%r66 = getelementptr inbounds %struct.foo, %struct.foo* %r65, i32 0, i32 0
%r67 = load i64, i64* %r66
%r68 = load %struct.foo*, %struct.foo** %r2
%r69 = getelementptr inbounds %struct.foo, %struct.foo* %r68, i32 0, i32 0
%r70 = load i64, i64* %r69
%r71 = sub i64 %r67, %r70
store i64 %r71, i64* %r4
%r72 = load i64, i64* %r1
%r73 = sub i64 %r72, 1
store i64 %r73, i64* %r1
%r74 = load i64, i64* %r1
%r75 = icmp sgt i64 %r74, 0
br i1 %r75, label %lab0, label %lab1

lab1:
%r76 = load %struct.foo*, %struct.foo** %r2
%r77 = getelementptr inbounds %struct.foo, %struct.foo* %r76, i32 0, i32 2
%r78 = load %struct.simple*, %struct.simple** %r77
%r79 = bitcast %struct.simple* %r78 to i8*
call void @free(i8* %r79)
%r80 = load %struct.foo*, %struct.foo** %r3
%r81 = getelementptr inbounds %struct.foo, %struct.foo* %r80, i32 0, i32 2
%r82 = load %struct.simple*, %struct.simple** %r81
%r83 = bitcast %struct.simple* %r82 to i8*
call void @free(i8* %r83)
%r84 = load %struct.foo*, %struct.foo** %r2
%r85 = bitcast %struct.foo* %r84 to i8*
call void @free(i8* %r85)
%r86 = load %struct.foo*, %struct.foo** %r3
%r87 = bitcast %struct.foo* %r86 to i8*
call void @free(i8* %r87)
br label %returnLabel

returnLabel:
ret void

}

define void @objinstantiation(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca %struct.foo*
store i64 %r0, i64* %r1
%r3 = load i64, i64* %r1
%r4 = icmp sgt i64 %r3, 0
br i1 %r4, label %lab0, label %lab1

lab0:
%r5 = call i8* @malloc(i64 17)
%r6 = bitcast i8* %r5 to %struct.foo*
store %struct.foo* %r6, %struct.foo** %r2
%r7 = load %struct.foo*, %struct.foo** %r2
%r8 = bitcast %struct.foo* %r7 to i8*
call void @free(i8* %r8)
%r9 = load i64, i64* %r1
%r10 = sub i64 %r9, 1
store i64 %r10, i64* %r1
%r11 = load i64, i64* %r1
%r12 = icmp sgt i64 %r11, 0
br i1 %r12, label %lab0, label %lab1

lab1:
br label %returnLabel

returnLabel:
ret void

}

define i64 @ackermann(i64 %r0, i64 %r1) {
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
%r8 = add i64 %r7, 1
store i64 %r8, i64* %r2
br label %returnLabel

lab1:
br label %lab2

lab2:
%r9 = load i64, i64* %r4
%r10 = icmp eq i64 %r9, 0
br i1 %r10, label %lab3, label %lab4

lab3:
%r11 = load i64, i64* %r3
%r12 = sub i64 %r11, 1
%r13 = call i64 @ackermann(i64 %r12, i64 1)
store i64 %r13, i64* %r2
br label %returnLabel

lab4:
%r14 = load i64, i64* %r3
%r15 = sub i64 %r14, 1
%r16 = load i64, i64* %r3
%r17 = load i64, i64* %r4
%r18 = sub i64 %r17, 1
%r19 = call i64 @ackermann(i64 %r16, i64 %r18)
%r20 = call i64 @ackermann(i64 %r15, i64 %r19)
store i64 %r20, i64* %r2
br label %returnLabel

returnLabel:
%r21 = load i64, i64* %r2
ret i64 %r21

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r7 = load i64, i64* @.read_scratch
store i64 %r7, i64* %r1
%r8 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r9 = load i64, i64* @.read_scratch
store i64 %r9, i64* %r2
%r10 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r11 = load i64, i64* @.read_scratch
store i64 %r11, i64* %r3
%r12 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r13 = load i64, i64* @.read_scratch
store i64 %r13, i64* %r4
%r14 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r15 = load i64, i64* @.read_scratch
store i64 %r15, i64* %r5
%r16 = load i64, i64* %r1
call void @tailrecursive(i64 %r16)
%r17 = load i64, i64* %r1
%r18 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r17)
%r19 = load i64, i64* %r2
call void @domath(i64 %r19)
%r20 = load i64, i64* %r2
%r21 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r20)
%r22 = load i64, i64* %r3
call void @objinstantiation(i64 %r22)
%r23 = load i64, i64* %r3
%r24 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r23)
%r25 = load i64, i64* %r4
%r26 = load i64, i64* %r5
%r27 = call i64 @ackermann(i64 %r25, i64 %r26)
%r28 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r27)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r29 = load i64, i64* %r0
ret i64 %r29

}

