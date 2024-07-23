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
%r2 = icmp eq i64 %r0, 1
br i1 %r2, label %lab0, label %lab1

lab0:
%r3 = load %struct.plate*, %struct.plate** @peg1
%r4 = load %struct.plate*, %struct.plate** @peg1
%r5 = getelementptr inbounds %struct.plate, %struct.plate* %r4, i32 0, i32 1
%r6 = load %struct.plate*, %struct.plate** %r5
store %struct.plate* %r6, %struct.plate** @peg1
br label %lab5

lab1:
%r8 = icmp eq i64 %r0, 2
br i1 %r8, label %lab2, label %lab3

lab2:
%r9 = load %struct.plate*, %struct.plate** @peg2
%r10 = load %struct.plate*, %struct.plate** @peg2
%r11 = getelementptr inbounds %struct.plate, %struct.plate* %r10, i32 0, i32 1
%r12 = load %struct.plate*, %struct.plate** %r11
store %struct.plate* %r12, %struct.plate** @peg2
br label %lab4

lab3:
%r13 = load %struct.plate*, %struct.plate** @peg3
%r14 = load %struct.plate*, %struct.plate** @peg3
%r15 = getelementptr inbounds %struct.plate, %struct.plate* %r14, i32 0, i32 1
%r16 = load %struct.plate*, %struct.plate** %r15
store %struct.plate* %r16, %struct.plate** @peg3
br label %lab4

lab4:
%r17 = phi %struct.plate* [%r9, %lab2], [%r13, %lab3]
br label %lab5

lab5:
%r18 = phi %struct.plate* [%r3, %lab0], [%r17, %lab4]
%r19 = phi i64 [%r1, %lab0], [%r1, %lab4]
%r20 = icmp eq i64 %r19, 1
br i1 %r20, label %lab6, label %lab7

lab6:
%r22 = getelementptr inbounds %struct.plate, %struct.plate* %r18, i32 0, i32 1
%r23 = load %struct.plate*, %struct.plate** @peg1
store %struct.plate* %r23, %struct.plate** %r22
store %struct.plate* %r18, %struct.plate** @peg1
br label %returnLabel

lab7:
%r25 = icmp eq i64 %r19, 2
br i1 %r25, label %lab8, label %lab9

lab8:
%r27 = getelementptr inbounds %struct.plate, %struct.plate* %r18, i32 0, i32 1
%r28 = load %struct.plate*, %struct.plate** @peg2
store %struct.plate* %r28, %struct.plate** %r27
store %struct.plate* %r18, %struct.plate** @peg2
br label %returnLabel

lab9:
%r30 = getelementptr inbounds %struct.plate, %struct.plate* %r18, i32 0, i32 1
%r31 = load %struct.plate*, %struct.plate** @peg3
store %struct.plate* %r31, %struct.plate** %r30
store %struct.plate* %r18, %struct.plate** @peg3
br label %returnLabel

returnLabel:
%r34 = load i64, i64* @numMoves
%r35 = add i64 %r34, 1
store i64 %r35, i64* @numMoves
ret void

}

define void @hanoi(i64 %r0, i64 %r1, i64 %r2, i64 %r3) {
prologue:
%r4 = icmp eq i64 %r0, 1
br i1 %r4, label %lab0, label %lab1

lab0:
call void @move(i64 %r1, i64 %r2)
br label %returnLabel

lab1:
%r8 = sub i64 %r0, 1
call void @hanoi(i64 %r8, i64 %r1, i64 %r3, i64 %r2)
call void @move(i64 %r1, i64 %r2)
%r12 = sub i64 %r0, 1
call void @hanoi(i64 %r12, i64 %r3, i64 %r2, i64 %r1)
br label %returnLabel

returnLabel:
ret void

}

define void @printPeg(%struct.plate* %r0) {
prologue:
%r1 = icmp ne %struct.plate* %r0, null
br i1 %r1, label %lab0, label %returnLabel

lab0:
%r3 = phi %struct.plate* [%r0, %prologue], [%r8, %lab0]
%r4 = getelementptr inbounds %struct.plate, %struct.plate* %r3, i32 0, i32 0
%r5 = load i64, i64* %r4
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r5)
%r7 = getelementptr inbounds %struct.plate, %struct.plate* %r3, i32 0, i32 1
%r8 = load %struct.plate*, %struct.plate** %r7
%r9 = icmp ne %struct.plate* %r8, null
br i1 %r9, label %lab0, label %returnLabel

returnLabel:
ret void

}

define i64 @main() {
prologue:
store %struct.plate* null, %struct.plate** @peg1
store %struct.plate* null, %struct.plate** @peg2
store %struct.plate* null, %struct.plate** @peg3
store i64 0, i64* @numMoves
%r0 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r1 = load i64, i64* @.read_scratch
%r2 = icmp sge i64 %r1, 1
br i1 %r2, label %lab0, label %returnLabel

lab0:
%r4 = icmp ne i64 %r1, 0
br i1 %r4, label %lab1, label %lab2

lab1:
%r6 = phi i64 [%r1, %lab0], [%r12, %lab1]
%r7 = call i8* @malloc(i64 16)
%r8 = bitcast i8* %r7 to %struct.plate*
%r9 = getelementptr inbounds %struct.plate, %struct.plate* %r8, i32 0, i32 0
store i64 %r6, i64* %r9
%r10 = getelementptr inbounds %struct.plate, %struct.plate* %r8, i32 0, i32 1
%r11 = load %struct.plate*, %struct.plate** @peg1
store %struct.plate* %r11, %struct.plate** %r10
store %struct.plate* %r8, %struct.plate** @peg1
%r12 = sub i64 %r6, 1
%r13 = icmp ne i64 %r12, 0
br i1 %r13, label %lab1, label %lab2

lab2:
%r14 = phi i64 [%r1, %lab0], [%r1, %lab1]
%r16 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
%r17 = load %struct.plate*, %struct.plate** @peg1
call void @printPeg(%struct.plate* %r17)
%r18 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 2)
%r19 = load %struct.plate*, %struct.plate** @peg2
call void @printPeg(%struct.plate* %r19)
%r20 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 3)
%r21 = load %struct.plate*, %struct.plate** @peg3
call void @printPeg(%struct.plate* %r21)
call void @hanoi(i64 %r14, i64 1, i64 3, i64 2)
%r22 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
%r23 = load %struct.plate*, %struct.plate** @peg1
call void @printPeg(%struct.plate* %r23)
%r24 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 2)
%r25 = load %struct.plate*, %struct.plate** @peg2
call void @printPeg(%struct.plate* %r25)
%r26 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 3)
%r27 = load %struct.plate*, %struct.plate** @peg3
call void @printPeg(%struct.plate* %r27)
%r28 = load i64, i64* @numMoves
%r29 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r28)
%r30 = load %struct.plate*, %struct.plate** @peg3
%r31 = icmp ne %struct.plate* %r30, null
br i1 %r31, label %lab3, label %returnLabel

lab3:
%r35 = load %struct.plate*, %struct.plate** @peg3
%r36 = load %struct.plate*, %struct.plate** @peg3
%r37 = getelementptr inbounds %struct.plate, %struct.plate* %r36, i32 0, i32 1
%r38 = load %struct.plate*, %struct.plate** %r37
store %struct.plate* %r38, %struct.plate** @peg3
%r39 = bitcast %struct.plate* %r35 to i8*
call void @free(i8* %r39)
%r40 = load %struct.plate*, %struct.plate** @peg3
%r41 = icmp ne %struct.plate* %r40, null
br i1 %r41, label %lab3, label %returnLabel

returnLabel:
ret i64 0

}

