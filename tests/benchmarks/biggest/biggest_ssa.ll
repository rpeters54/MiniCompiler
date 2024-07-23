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
%r0 = call i8* @malloc(i64 16)
%r1 = bitcast i8* %r0 to %struct.IntList*
%r2 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r3 = load i64, i64* @.read_scratch
%r5 = icmp eq i64 %r3, -1
br i1 %r5, label %lab0, label %lab1

lab0:
%r7 = getelementptr inbounds %struct.IntList, %struct.IntList* %r1, i32 0, i32 0
store i64 %r3, i64* %r7
%r9 = getelementptr inbounds %struct.IntList, %struct.IntList* %r1, i32 0, i32 1
store %struct.IntList* null, %struct.IntList** %r9
br label %returnLabel

lab1:
%r11 = getelementptr inbounds %struct.IntList, %struct.IntList* %r1, i32 0, i32 0
store i64 %r3, i64* %r11
%r13 = getelementptr inbounds %struct.IntList, %struct.IntList* %r1, i32 0, i32 1
%r14 = call %struct.IntList* @getIntList()
store %struct.IntList* %r14, %struct.IntList** %r13
br label %returnLabel

returnLabel:
%r15 = phi %struct.IntList* [%r1, %lab0], [%r1, %lab1]
ret %struct.IntList* %r15

}

define i64 @biggest(i64 %r0, i64 %r1) {
prologue:
%r2 = icmp sgt i64 %r0, %r1
%r6 = select i1 %r2, i64 %r0, i64 %r1
ret i64 %r6

}

define i64 @biggestInList(%struct.IntList* %r0) {
prologue:
%r1 = getelementptr inbounds %struct.IntList, %struct.IntList* %r0, i32 0, i32 0
%r2 = load i64, i64* %r1
%r3 = getelementptr inbounds %struct.IntList, %struct.IntList* %r0, i32 0, i32 1
%r4 = load %struct.IntList*, %struct.IntList** %r3
%r5 = icmp ne %struct.IntList* %r4, null
br i1 %r5, label %lab0, label %returnLabel

lab0:
%r6 = phi i64 [%r2, %prologue], [%r10, %lab0]
%r7 = phi %struct.IntList* [%r0, %prologue], [%r12, %lab0]
%r8 = getelementptr inbounds %struct.IntList, %struct.IntList* %r7, i32 0, i32 0
%r9 = load i64, i64* %r8
%r10 = call i64 @biggest(i64 %r6, i64 %r9)
%r11 = getelementptr inbounds %struct.IntList, %struct.IntList* %r7, i32 0, i32 1
%r12 = load %struct.IntList*, %struct.IntList** %r11
%r13 = getelementptr inbounds %struct.IntList, %struct.IntList* %r12, i32 0, i32 1
%r14 = load %struct.IntList*, %struct.IntList** %r13
%r15 = icmp ne %struct.IntList* %r14, null
br i1 %r15, label %lab0, label %returnLabel

returnLabel:
%r16 = phi i64 [%r2, %prologue], [%r10, %lab0]
ret i64 %r16

}

define i64 @main() {
prologue:
%r0 = call %struct.IntList* @getIntList()
%r1 = call i64 @biggestInList(%struct.IntList* %r0)
%r2 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r1)
ret i64 0

}

