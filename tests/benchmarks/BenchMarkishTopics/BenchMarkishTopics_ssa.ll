declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.intList = type {i64, %struct.intList*}
@intList = common global i64 0

define i64 @length(%struct.intList* %r0) {
prologue:
%r1 = icmp eq %struct.intList* %r0, null
br i1 %r1, label %returnLabel, label %lab2

lab2:
%r3 = getelementptr inbounds %struct.intList, %struct.intList* %r0, i32 0, i32 1
%r4 = load %struct.intList*, %struct.intList** %r3
%r5 = call i64 @length(%struct.intList* %r4)
%r6 = add i64 1, %r5
br label %returnLabel

returnLabel:
%r7 = phi i64 [0, %prologue], [%r6, %lab2]
ret i64 %r7

}

define %struct.intList* @addToFront(%struct.intList* %r0, i64 %r1) {
prologue:
%r2 = icmp eq %struct.intList* %r0, null
br i1 %r2, label %lab0, label %lab2

lab0:
%r3 = call i8* @malloc(i64 16)
%r4 = bitcast i8* %r3 to %struct.intList*
%r5 = getelementptr inbounds %struct.intList, %struct.intList* %r4, i32 0, i32 0
store i64 %r1, i64* %r5
%r7 = getelementptr inbounds %struct.intList, %struct.intList* %r4, i32 0, i32 1
store %struct.intList* null, %struct.intList** %r7
br label %returnLabel

lab2:
%r8 = call i8* @malloc(i64 16)
%r9 = bitcast i8* %r8 to %struct.intList*
%r10 = getelementptr inbounds %struct.intList, %struct.intList* %r9, i32 0, i32 0
store i64 %r1, i64* %r10
%r12 = getelementptr inbounds %struct.intList, %struct.intList* %r9, i32 0, i32 1
store %struct.intList* %r0, %struct.intList** %r12
br label %returnLabel

returnLabel:
%r14 = phi %struct.intList* [%r4, %lab0], [%r9, %lab2]
ret %struct.intList* %r14

}

define %struct.intList* @deleteFirst(%struct.intList* %r0) {
prologue:
%r1 = icmp eq %struct.intList* %r0, null
br i1 %r1, label %returnLabel, label %lab2

lab2:
%r3 = getelementptr inbounds %struct.intList, %struct.intList* %r0, i32 0, i32 1
%r4 = load %struct.intList*, %struct.intList** %r3
%r5 = bitcast %struct.intList* %r0 to i8*
call void @free(i8* %r5)
br label %returnLabel

returnLabel:
%r6 = phi %struct.intList* [null, %prologue], [%r4, %lab2]
ret %struct.intList* %r6

}

define i64 @main() {
prologue:
%r0 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r1 = load i64, i64* @.read_scratch
store i64 %r1, i64* @intList
%r2 = load i64, i64* @intList
%r3 = icmp sgt i64 %r2, 0
br i1 %r3, label %lab0, label %lab1

lab0:
%r5 = phi %struct.intList* [null, %prologue], [%r7, %lab0]
%r6 = load i64, i64* @intList
%r7 = call %struct.intList* @addToFront(%struct.intList* %r5, i64 %r6)
%r8 = getelementptr inbounds %struct.intList, %struct.intList* %r7, i32 0, i32 0
%r9 = load i64, i64* %r8
%r10 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r9)
%r11 = load i64, i64* @intList
%r12 = sub i64 %r11, 1
store i64 %r12, i64* @intList
%r13 = load i64, i64* @intList
%r14 = icmp sgt i64 %r13, 0
br i1 %r14, label %lab0, label %lab1

lab1:
%r15 = phi i64 [0, %prologue], [0, %lab0]
%r16 = phi %struct.intList* [null, %prologue], [%r7, %lab0]
%r17 = call i64 @length(%struct.intList* %r16)
%r18 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r17)
%r19 = call i64 @length(%struct.intList* %r16)
%r20 = icmp sgt i64 %r19, 0
br i1 %r20, label %lab2, label %returnLabel

lab2:
%r21 = phi i64 [%r15, %lab1], [%r25, %lab2]
%r22 = phi %struct.intList* [%r16, %lab1], [%r28, %lab2]
%r23 = getelementptr inbounds %struct.intList, %struct.intList* %r22, i32 0, i32 0
%r24 = load i64, i64* %r23
%r25 = add i64 %r21, %r24
%r26 = call i64 @length(%struct.intList* %r22)
%r27 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r26)
%r28 = call %struct.intList* @deleteFirst(%struct.intList* %r22)
%r29 = call i64 @length(%struct.intList* %r28)
%r30 = icmp sgt i64 %r29, 0
br i1 %r30, label %lab2, label %returnLabel

returnLabel:
%r31 = phi i64 [%r15, %lab1], [%r25, %lab2]
%r33 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r31)
ret i64 0

}

