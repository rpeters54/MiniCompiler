declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.plate = type {i64, %struct.plate*}
@peg1 = common global %struct.plate* null
@peg2 = common global %struct.plate* null
@peg3 = common global %struct.plate* null
@numMoves = common global i64 0

define void @move(i64 %r0, i64 %r1) {
prologue:
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca %struct.plate*
store i64 %r0, i64* %r2
store i64 %r1, i64* %r3
%r5 = load i64, i64* %r2
%r6 = icmp eq i64 %r5, 1
br i1 %r6, label %lab0, label %lab1

lab0:
%r7 = load %struct.plate*, %struct.plate** @peg1
store %struct.plate* %r7, %struct.plate** %r4
%r8 = load %struct.plate*, %struct.plate** @peg1
%r9 = getelementptr inbounds %struct.plate, %struct.plate* %r8, i32 0, i32 1
%r10 = load %struct.plate*, %struct.plate** %r9
store %struct.plate* %r10, %struct.plate** @peg1
br label %lab5

lab1:
%r11 = load i64, i64* %r2
%r12 = icmp eq i64 %r11, 2
br i1 %r12, label %lab2, label %lab3

lab2:
%r13 = load %struct.plate*, %struct.plate** @peg2
store %struct.plate* %r13, %struct.plate** %r4
%r14 = load %struct.plate*, %struct.plate** @peg2
%r15 = getelementptr inbounds %struct.plate, %struct.plate* %r14, i32 0, i32 1
%r16 = load %struct.plate*, %struct.plate** %r15
store %struct.plate* %r16, %struct.plate** @peg2
br label %lab4

lab3:
%r17 = load %struct.plate*, %struct.plate** @peg3
store %struct.plate* %r17, %struct.plate** %r4
%r18 = load %struct.plate*, %struct.plate** @peg3
%r19 = getelementptr inbounds %struct.plate, %struct.plate* %r18, i32 0, i32 1
%r20 = load %struct.plate*, %struct.plate** %r19
store %struct.plate* %r20, %struct.plate** @peg3
br label %lab4

lab4:
br label %lab5

lab5:
%r21 = load i64, i64* %r3
%r22 = icmp eq i64 %r21, 1
br i1 %r22, label %lab6, label %lab7

lab6:
%r23 = load %struct.plate*, %struct.plate** %r4
%r24 = getelementptr inbounds %struct.plate, %struct.plate* %r23, i32 0, i32 1
%r25 = load %struct.plate*, %struct.plate** @peg1
store %struct.plate* %r25, %struct.plate** %r24
%r26 = load %struct.plate*, %struct.plate** %r4
store %struct.plate* %r26, %struct.plate** @peg1
br label %lab11

lab7:
%r27 = load i64, i64* %r3
%r28 = icmp eq i64 %r27, 2
br i1 %r28, label %lab8, label %lab9

lab8:
%r29 = load %struct.plate*, %struct.plate** %r4
%r30 = getelementptr inbounds %struct.plate, %struct.plate* %r29, i32 0, i32 1
%r31 = load %struct.plate*, %struct.plate** @peg2
store %struct.plate* %r31, %struct.plate** %r30
%r32 = load %struct.plate*, %struct.plate** %r4
store %struct.plate* %r32, %struct.plate** @peg2
br label %lab10

lab9:
%r33 = load %struct.plate*, %struct.plate** %r4
%r34 = getelementptr inbounds %struct.plate, %struct.plate* %r33, i32 0, i32 1
%r35 = load %struct.plate*, %struct.plate** @peg3
store %struct.plate* %r35, %struct.plate** %r34
%r36 = load %struct.plate*, %struct.plate** %r4
store %struct.plate* %r36, %struct.plate** @peg3
br label %lab10

lab10:
br label %lab11

lab11:
%r37 = load i64, i64* @numMoves
%r38 = add i64 %r37, 1
store i64 %r38, i64* @numMoves
br label %returnLabel

returnLabel:
ret void

}

define void @hanoi(i64 %r0, i64 %r1, i64 %r2, i64 %r3) {
prologue:
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca i64
%r7 = alloca i64
store i64 %r0, i64* %r4
store i64 %r1, i64* %r5
store i64 %r2, i64* %r6
store i64 %r3, i64* %r7
%r8 = load i64, i64* %r4
%r9 = icmp eq i64 %r8, 1
br i1 %r9, label %lab0, label %lab1

lab0:
%r10 = load i64, i64* %r5
%r11 = load i64, i64* %r6
call void @move(i64 %r10, i64 %r11)
br label %lab2

lab1:
%r12 = load i64, i64* %r4
%r13 = sub i64 %r12, 1
%r14 = load i64, i64* %r5
%r15 = load i64, i64* %r7
%r16 = load i64, i64* %r6
call void @hanoi(i64 %r13, i64 %r14, i64 %r15, i64 %r16)
%r17 = load i64, i64* %r5
%r18 = load i64, i64* %r6
call void @move(i64 %r17, i64 %r18)
%r19 = load i64, i64* %r4
%r20 = sub i64 %r19, 1
%r21 = load i64, i64* %r7
%r22 = load i64, i64* %r6
%r23 = load i64, i64* %r5
call void @hanoi(i64 %r20, i64 %r21, i64 %r22, i64 %r23)
br label %lab2

lab2:
br label %returnLabel

returnLabel:
ret void

}

define void @printPeg(%struct.plate* %r0) {
prologue:
%r1 = alloca %struct.plate*
%r2 = alloca %struct.plate*
store %struct.plate* %r0, %struct.plate** %r1
%r3 = load %struct.plate*, %struct.plate** %r1
store %struct.plate* %r3, %struct.plate** %r2
%r4 = load %struct.plate*, %struct.plate** %r2
%r5 = icmp ne %struct.plate* %r4, null
br i1 %r5, label %lab0, label %lab1

lab0:
%r6 = load %struct.plate*, %struct.plate** %r2
%r7 = getelementptr inbounds %struct.plate, %struct.plate* %r6, i32 0, i32 0
%r8 = load i64, i64* %r7
%r9 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r8)
%r10 = load %struct.plate*, %struct.plate** %r2
%r11 = getelementptr inbounds %struct.plate, %struct.plate* %r10, i32 0, i32 1
%r12 = load %struct.plate*, %struct.plate** %r11
store %struct.plate* %r12, %struct.plate** %r2
%r13 = load %struct.plate*, %struct.plate** %r2
%r14 = icmp ne %struct.plate* %r13, null
br i1 %r14, label %lab0, label %lab1

lab1:
br label %returnLabel

returnLabel:
ret void

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca %struct.plate*
store %struct.plate* null, %struct.plate** @peg1
store %struct.plate* null, %struct.plate** @peg2
store %struct.plate* null, %struct.plate** @peg3
store i64 0, i64* @numMoves
%r4 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r5 = load i64, i64* @.read_scratch
store i64 %r5, i64* %r2
%r6 = load i64, i64* %r2
%r7 = icmp sge i64 %r6, 1
br i1 %r7, label %lab0, label %lab5

lab0:
%r8 = load i64, i64* %r2
store i64 %r8, i64* %r1
%r9 = load i64, i64* %r1
%r10 = icmp ne i64 %r9, 0
br i1 %r10, label %lab1, label %lab2

lab1:
%r11 = call i8* @malloc(i64 16)
%r12 = bitcast i8* %r11 to %struct.plate*
store %struct.plate* %r12, %struct.plate** %r3
%r13 = load %struct.plate*, %struct.plate** %r3
%r14 = getelementptr inbounds %struct.plate, %struct.plate* %r13, i32 0, i32 0
%r15 = load i64, i64* %r1
store i64 %r15, i64* %r14
%r16 = load %struct.plate*, %struct.plate** %r3
%r17 = getelementptr inbounds %struct.plate, %struct.plate* %r16, i32 0, i32 1
%r18 = load %struct.plate*, %struct.plate** @peg1
store %struct.plate* %r18, %struct.plate** %r17
%r19 = load %struct.plate*, %struct.plate** %r3
store %struct.plate* %r19, %struct.plate** @peg1
%r20 = load i64, i64* %r1
%r21 = sub i64 %r20, 1
store i64 %r21, i64* %r1
%r22 = load i64, i64* %r1
%r23 = icmp ne i64 %r22, 0
br i1 %r23, label %lab1, label %lab2

lab2:
%r24 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
%r25 = load %struct.plate*, %struct.plate** @peg1
call void @printPeg(%struct.plate* %r25)
%r26 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 2)
%r27 = load %struct.plate*, %struct.plate** @peg2
call void @printPeg(%struct.plate* %r27)
%r28 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 3)
%r29 = load %struct.plate*, %struct.plate** @peg3
call void @printPeg(%struct.plate* %r29)
%r30 = load i64, i64* %r2
call void @hanoi(i64 %r30, i64 1, i64 3, i64 2)
%r31 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
%r32 = load %struct.plate*, %struct.plate** @peg1
call void @printPeg(%struct.plate* %r32)
%r33 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 2)
%r34 = load %struct.plate*, %struct.plate** @peg2
call void @printPeg(%struct.plate* %r34)
%r35 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 3)
%r36 = load %struct.plate*, %struct.plate** @peg3
call void @printPeg(%struct.plate* %r36)
%r37 = load i64, i64* @numMoves
%r38 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r37)
%r39 = load %struct.plate*, %struct.plate** @peg3
%r40 = icmp ne %struct.plate* %r39, null
br i1 %r40, label %lab3, label %lab4

lab3:
%r41 = load %struct.plate*, %struct.plate** @peg3
store %struct.plate* %r41, %struct.plate** %r3
%r42 = load %struct.plate*, %struct.plate** @peg3
%r43 = getelementptr inbounds %struct.plate, %struct.plate* %r42, i32 0, i32 1
%r44 = load %struct.plate*, %struct.plate** %r43
store %struct.plate* %r44, %struct.plate** @peg3
%r45 = load %struct.plate*, %struct.plate** %r3
%r46 = bitcast %struct.plate* %r45 to i8*
call void @free(i8* %r46)
%r47 = load %struct.plate*, %struct.plate** @peg3
%r48 = icmp ne %struct.plate* %r47, null
br i1 %r48, label %lab3, label %lab4

lab4:
br label %lab6

lab5:
br label %lab6

lab6:
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r49 = load i64, i64* %r0
ret i64 %r49

}

