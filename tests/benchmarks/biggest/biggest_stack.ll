declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.IntList = type {i64, %struct.IntList*}

define %struct.IntList* @getIntList() {
prologue:
%r0 = alloca %struct.IntList*
%r1 = alloca %struct.IntList*
%r2 = alloca i64
%r3 = call i8* @malloc(i64 16)
%r4 = bitcast i8* %r3 to %struct.IntList*
store %struct.IntList* %r4, %struct.IntList** %r1
%r5 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r6 = load i64, i64* @.read_scratch
store i64 %r6, i64* %r2
%r7 = load i64, i64* %r2
%r8 = sub i64 0, 1
%r9 = icmp eq i64 %r7, %r8
br i1 %r9, label %lab0, label %lab1

lab0:
%r10 = load %struct.IntList*, %struct.IntList** %r1
%r11 = getelementptr inbounds %struct.IntList, %struct.IntList* %r10, i32 0, i32 0
%r12 = load i64, i64* %r2
store i64 %r12, i64* %r11
%r13 = load %struct.IntList*, %struct.IntList** %r1
%r14 = getelementptr inbounds %struct.IntList, %struct.IntList* %r13, i32 0, i32 1
store %struct.IntList* null, %struct.IntList** %r14
%r15 = load %struct.IntList*, %struct.IntList** %r1
store %struct.IntList* %r15, %struct.IntList** %r0
br label %returnLabel

lab1:
%r16 = load %struct.IntList*, %struct.IntList** %r1
%r17 = getelementptr inbounds %struct.IntList, %struct.IntList* %r16, i32 0, i32 0
%r18 = load i64, i64* %r2
store i64 %r18, i64* %r17
%r19 = load %struct.IntList*, %struct.IntList** %r1
%r20 = getelementptr inbounds %struct.IntList, %struct.IntList* %r19, i32 0, i32 1
%r21 = call %struct.IntList* @getIntList()
store %struct.IntList* %r21, %struct.IntList** %r20
%r22 = load %struct.IntList*, %struct.IntList** %r1
store %struct.IntList* %r22, %struct.IntList** %r0
br label %returnLabel

returnLabel:
%r23 = load %struct.IntList*, %struct.IntList** %r0
ret %struct.IntList* %r23

}

define i64 @biggest(i64 %r0, i64 %r1) {
prologue:
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
store i64 %r0, i64* %r3
store i64 %r1, i64* %r4
%r5 = load i64, i64* %r3
%r6 = load i64, i64* %r4
%r7 = icmp sgt i64 %r5, %r6
br i1 %r7, label %lab0, label %lab1

lab0:
%r8 = load i64, i64* %r3
store i64 %r8, i64* %r2
br label %returnLabel

lab1:
%r9 = load i64, i64* %r4
store i64 %r9, i64* %r2
br label %returnLabel

returnLabel:
%r10 = load i64, i64* %r2
ret i64 %r10

}

define i64 @biggestInList(%struct.IntList* %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca %struct.IntList*
%r3 = alloca i64
store %struct.IntList* %r0, %struct.IntList** %r2
%r4 = load %struct.IntList*, %struct.IntList** %r2
%r5 = getelementptr inbounds %struct.IntList, %struct.IntList* %r4, i32 0, i32 0
%r6 = load i64, i64* %r5
store i64 %r6, i64* %r3
%r7 = load %struct.IntList*, %struct.IntList** %r2
%r8 = getelementptr inbounds %struct.IntList, %struct.IntList* %r7, i32 0, i32 1
%r9 = load %struct.IntList*, %struct.IntList** %r8
%r10 = icmp ne %struct.IntList* %r9, null
br i1 %r10, label %lab0, label %lab1

lab0:
%r11 = load i64, i64* %r3
%r12 = load %struct.IntList*, %struct.IntList** %r2
%r13 = getelementptr inbounds %struct.IntList, %struct.IntList* %r12, i32 0, i32 0
%r14 = load i64, i64* %r13
%r15 = call i64 @biggest(i64 %r11, i64 %r14)
store i64 %r15, i64* %r3
%r16 = load %struct.IntList*, %struct.IntList** %r2
%r17 = getelementptr inbounds %struct.IntList, %struct.IntList* %r16, i32 0, i32 1
%r18 = load %struct.IntList*, %struct.IntList** %r17
store %struct.IntList* %r18, %struct.IntList** %r2
%r19 = load %struct.IntList*, %struct.IntList** %r2
%r20 = getelementptr inbounds %struct.IntList, %struct.IntList* %r19, i32 0, i32 1
%r21 = load %struct.IntList*, %struct.IntList** %r20
%r22 = icmp ne %struct.IntList* %r21, null
br i1 %r22, label %lab0, label %lab1

lab1:
%r23 = load i64, i64* %r3
store i64 %r23, i64* %r1
br label %returnLabel

returnLabel:
%r24 = load i64, i64* %r1
ret i64 %r24

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca %struct.IntList*
%r2 = call %struct.IntList* @getIntList()
store %struct.IntList* %r2, %struct.IntList** %r1
%r3 = load %struct.IntList*, %struct.IntList** %r1
%r4 = call i64 @biggestInList(%struct.IntList* %r3)
%r5 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r4)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r6 = load i64, i64* %r0
ret i64 %r6

}

