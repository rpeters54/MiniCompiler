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
%r1 = alloca i64
%r2 = alloca %struct.intList*
store %struct.intList* %r0, %struct.intList** %r2
%r3 = load %struct.intList*, %struct.intList** %r2
%r4 = icmp eq %struct.intList* %r3, null
br i1 %r4, label %lab0, label %lab1

lab0:
store i64 0, i64* %r1
br label %returnLabel

lab1:
br label %lab2

lab2:
%r5 = load %struct.intList*, %struct.intList** %r2
%r6 = getelementptr inbounds %struct.intList, %struct.intList* %r5, i32 0, i32 1
%r7 = load %struct.intList*, %struct.intList** %r6
%r8 = call i64 @length(%struct.intList* %r7)
%r9 = add i64 1, %r8
store i64 %r9, i64* %r1
br label %returnLabel

returnLabel:
%r10 = load i64, i64* %r1
ret i64 %r10

}

define %struct.intList* @addToFront(%struct.intList* %r0, i64 %r1) {
prologue:
%r2 = alloca %struct.intList*
%r3 = alloca %struct.intList*
%r4 = alloca i64
%r5 = alloca %struct.intList*
store %struct.intList* %r0, %struct.intList** %r3
store i64 %r1, i64* %r4
%r6 = load %struct.intList*, %struct.intList** %r3
%r7 = icmp eq %struct.intList* %r6, null
br i1 %r7, label %lab0, label %lab1

lab0:
%r8 = call i8* @malloc(i64 16)
%r9 = bitcast i8* %r8 to %struct.intList*
store %struct.intList* %r9, %struct.intList** %r3
%r10 = load %struct.intList*, %struct.intList** %r3
%r11 = getelementptr inbounds %struct.intList, %struct.intList* %r10, i32 0, i32 0
%r12 = load i64, i64* %r4
store i64 %r12, i64* %r11
%r13 = load %struct.intList*, %struct.intList** %r3
%r14 = getelementptr inbounds %struct.intList, %struct.intList* %r13, i32 0, i32 1
store %struct.intList* null, %struct.intList** %r14
%r15 = load %struct.intList*, %struct.intList** %r3
store %struct.intList* %r15, %struct.intList** %r2
br label %returnLabel

lab1:
br label %lab2

lab2:
%r16 = call i8* @malloc(i64 16)
%r17 = bitcast i8* %r16 to %struct.intList*
store %struct.intList* %r17, %struct.intList** %r5
%r18 = load %struct.intList*, %struct.intList** %r5
%r19 = getelementptr inbounds %struct.intList, %struct.intList* %r18, i32 0, i32 0
%r20 = load i64, i64* %r4
store i64 %r20, i64* %r19
%r21 = load %struct.intList*, %struct.intList** %r5
%r22 = getelementptr inbounds %struct.intList, %struct.intList* %r21, i32 0, i32 1
%r23 = load %struct.intList*, %struct.intList** %r3
store %struct.intList* %r23, %struct.intList** %r22
%r24 = load %struct.intList*, %struct.intList** %r5
store %struct.intList* %r24, %struct.intList** %r2
br label %returnLabel

returnLabel:
%r25 = load %struct.intList*, %struct.intList** %r2
ret %struct.intList* %r25

}

define %struct.intList* @deleteFirst(%struct.intList* %r0) {
prologue:
%r1 = alloca %struct.intList*
%r2 = alloca %struct.intList*
%r3 = alloca %struct.intList*
store %struct.intList* %r0, %struct.intList** %r2
%r4 = load %struct.intList*, %struct.intList** %r2
%r5 = icmp eq %struct.intList* %r4, null
br i1 %r5, label %lab0, label %lab1

lab0:
store %struct.intList* null, %struct.intList** %r1
br label %returnLabel

lab1:
br label %lab2

lab2:
%r6 = load %struct.intList*, %struct.intList** %r2
store %struct.intList* %r6, %struct.intList** %r3
%r7 = load %struct.intList*, %struct.intList** %r2
%r8 = getelementptr inbounds %struct.intList, %struct.intList* %r7, i32 0, i32 1
%r9 = load %struct.intList*, %struct.intList** %r8
store %struct.intList* %r9, %struct.intList** %r2
%r10 = load %struct.intList*, %struct.intList** %r3
%r11 = bitcast %struct.intList* %r10 to i8*
call void @free(i8* %r11)
%r12 = load %struct.intList*, %struct.intList** %r2
store %struct.intList* %r12, %struct.intList** %r1
br label %returnLabel

returnLabel:
%r13 = load %struct.intList*, %struct.intList** %r1
ret %struct.intList* %r13

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca %struct.intList*
%r2 = alloca i64
%r3 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r4 = load i64, i64* @.read_scratch
store i64 %r4, i64* @intList
store i64 0, i64* %r2
store %struct.intList* null, %struct.intList** %r1
%r5 = load i64, i64* @intList
%r6 = icmp sgt i64 %r5, 0
br i1 %r6, label %lab0, label %lab1

lab0:
%r7 = load %struct.intList*, %struct.intList** %r1
%r8 = load i64, i64* @intList
%r9 = call %struct.intList* @addToFront(%struct.intList* %r7, i64 %r8)
store %struct.intList* %r9, %struct.intList** %r1
%r10 = load %struct.intList*, %struct.intList** %r1
%r11 = getelementptr inbounds %struct.intList, %struct.intList* %r10, i32 0, i32 0
%r12 = load i64, i64* %r11
%r13 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r12)
%r14 = load i64, i64* @intList
%r15 = sub i64 %r14, 1
store i64 %r15, i64* @intList
%r16 = load i64, i64* @intList
%r17 = icmp sgt i64 %r16, 0
br i1 %r17, label %lab0, label %lab1

lab1:
%r18 = load %struct.intList*, %struct.intList** %r1
%r19 = call i64 @length(%struct.intList* %r18)
%r20 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r19)
%r21 = load %struct.intList*, %struct.intList** %r1
%r22 = call i64 @length(%struct.intList* %r21)
%r23 = icmp sgt i64 %r22, 0
br i1 %r23, label %lab2, label %lab3

lab2:
%r24 = load i64, i64* %r2
%r25 = load %struct.intList*, %struct.intList** %r1
%r26 = getelementptr inbounds %struct.intList, %struct.intList* %r25, i32 0, i32 0
%r27 = load i64, i64* %r26
%r28 = add i64 %r24, %r27
store i64 %r28, i64* %r2
%r29 = load %struct.intList*, %struct.intList** %r1
%r30 = call i64 @length(%struct.intList* %r29)
%r31 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r30)
%r32 = load %struct.intList*, %struct.intList** %r1
%r33 = call %struct.intList* @deleteFirst(%struct.intList* %r32)
store %struct.intList* %r33, %struct.intList** %r1
%r34 = load %struct.intList*, %struct.intList** %r1
%r35 = call i64 @length(%struct.intList* %r34)
%r36 = icmp sgt i64 %r35, 0
br i1 %r36, label %lab2, label %lab3

lab3:
%r37 = load i64, i64* %r2
%r38 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r37)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r39 = load i64, i64* %r0
ret i64 %r39

}

