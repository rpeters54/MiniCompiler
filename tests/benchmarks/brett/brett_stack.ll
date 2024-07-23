declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.thing = type {i64, i1, %struct.thing*}
@gi1 = common global i64 0
@gb1 = common global i1 0
@gs1 = common global %struct.thing* null
@counter = common global i64 0

define void @printgroup(i64 %r0) {
prologue:
%r1 = alloca i64
store i64 %r0, i64* %r1
%r2 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 1)
%r3 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r4 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 1)
%r5 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 1)
%r7 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r8 = load i64, i64* %r1
%r9 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r8)
br label %returnLabel

returnLabel:
ret void

}

define i1 @setcounter(i64 %r0) {
prologue:
%r1 = alloca i1
%r2 = alloca i64
store i64 %r0, i64* %r2
%r3 = load i64, i64* %r2
store i64 %r3, i64* @counter
store i1 true, i1* %r1
br label %returnLabel

returnLabel:
%r4 = load i1, i1* %r1
ret i1 %r4

}

define void @takealltypes(i64 %r0, i1 %r1, %struct.thing* %r2) {
prologue:
%r3 = alloca i64
%r4 = alloca i1
%r5 = alloca %struct.thing*
store i64 %r0, i64* %r3
store i1 %r1, i1* %r4
store %struct.thing* %r2, %struct.thing** %r5
%r6 = load i64, i64* %r3
%r7 = icmp eq i64 %r6, 3
br i1 %r7, label %lab0, label %lab1

lab0:
%r8 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab2

lab1:
%r9 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab2

lab2:
%r10 = load i1, i1* %r4
br i1 %r10, label %lab3, label %lab4

lab3:
%r11 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab5

lab4:
%r12 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab5

lab5:
%r13 = load %struct.thing*, %struct.thing** %r5
%r14 = getelementptr inbounds %struct.thing, %struct.thing* %r13, i32 0, i32 1
%r15 = load i1, i1* %r14
br i1 %r15, label %lab6, label %lab7

lab6:
%r16 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab8

lab7:
%r17 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab8

lab8:
br label %returnLabel

returnLabel:
ret void

}

define void @tonofargs(i64 %r0, i64 %r1, i64 %r2, i64 %r3, i64 %r4, i64 %r5, i64 %r6, i64 %r7) {
prologue:
%r8 = alloca i64
%r9 = alloca i64
%r10 = alloca i64
%r11 = alloca i64
%r12 = alloca i64
%r13 = alloca i64
%r14 = alloca i64
%r15 = alloca i64
store i64 %r0, i64* %r8
store i64 %r1, i64* %r9
store i64 %r2, i64* %r10
store i64 %r3, i64* %r11
store i64 %r4, i64* %r12
store i64 %r5, i64* %r13
store i64 %r6, i64* %r14
store i64 %r7, i64* %r15
%r16 = load i64, i64* %r12
%r17 = icmp eq i64 %r16, 5
br i1 %r17, label %lab0, label %lab1

lab0:
%r18 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab2

lab1:
%r19 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r20 = load i64, i64* %r12
%r21 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r20)
br label %lab2

lab2:
%r22 = load i64, i64* %r13
%r23 = icmp eq i64 %r22, 6
br i1 %r23, label %lab3, label %lab4

lab3:
%r24 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab5

lab4:
%r25 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r26 = load i64, i64* %r13
%r27 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r26)
br label %lab5

lab5:
%r28 = load i64, i64* %r14
%r29 = icmp eq i64 %r28, 7
br i1 %r29, label %lab6, label %lab7

lab6:
%r30 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab8

lab7:
%r31 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r32 = load i64, i64* %r14
%r33 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r32)
br label %lab8

lab8:
%r34 = load i64, i64* %r15
%r35 = icmp eq i64 %r34, 8
br i1 %r35, label %lab9, label %lab10

lab9:
%r36 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab11

lab10:
%r37 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r38 = load i64, i64* %r15
%r39 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r38)
br label %lab11

lab11:
br label %returnLabel

returnLabel:
ret void

}

define i64 @returnint(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
store i64 %r0, i64* %r2
%r3 = load i64, i64* %r2
store i64 %r3, i64* %r1
br label %returnLabel

returnLabel:
%r4 = load i64, i64* %r1
ret i64 %r4

}

define i1 @returnbool(i1 %r0) {
prologue:
%r1 = alloca i1
%r2 = alloca i1
store i1 %r0, i1* %r2
%r3 = load i1, i1* %r2
store i1 %r3, i1* %r1
br label %returnLabel

returnLabel:
%r4 = load i1, i1* %r1
ret i1 %r4

}

define %struct.thing* @returnstruct(%struct.thing* %r0) {
prologue:
%r1 = alloca %struct.thing*
%r2 = alloca %struct.thing*
store %struct.thing* %r0, %struct.thing** %r2
%r3 = load %struct.thing*, %struct.thing** %r2
store %struct.thing* %r3, %struct.thing** %r1
br label %returnLabel

returnLabel:
%r4 = load %struct.thing*, %struct.thing** %r1
ret %struct.thing* %r4

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i1
%r2 = alloca i1
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca %struct.thing*
%r7 = alloca %struct.thing*
store i64 0, i64* @counter
call void @printgroup(i64 1)
store i1 false, i1* %r1
store i1 false, i1* %r2
%r8 = load i1, i1* %r1
%r9 = load i1, i1* %r2
%r10 = and i1 %r8, %r9
br i1 %r10, label %lab0, label %lab1

lab0:
%r11 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab2

lab1:
%r12 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab2

lab2:
store i1 true, i1* %r1
store i1 false, i1* %r2
%r13 = load i1, i1* %r1
%r14 = load i1, i1* %r2
%r15 = and i1 %r13, %r14
br i1 %r15, label %lab3, label %lab4

lab3:
%r16 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab5

lab4:
%r17 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab5

lab5:
store i1 false, i1* %r1
store i1 true, i1* %r2
%r18 = load i1, i1* %r1
%r19 = load i1, i1* %r2
%r20 = and i1 %r18, %r19
br i1 %r20, label %lab6, label %lab7

lab6:
%r21 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab8

lab7:
%r22 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab8

lab8:
store i1 true, i1* %r1
store i1 true, i1* %r2
%r23 = load i1, i1* %r1
%r24 = load i1, i1* %r2
%r25 = and i1 %r23, %r24
br i1 %r25, label %lab9, label %lab10

lab9:
%r26 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab11

lab10:
%r27 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab11

lab11:
store i64 0, i64* @counter
call void @printgroup(i64 2)
store i1 true, i1* %r1
store i1 true, i1* %r2
%r28 = load i1, i1* %r1
%r29 = load i1, i1* %r2
%r30 = or i1 %r28, %r29
br i1 %r30, label %lab12, label %lab13

lab12:
%r31 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab14

lab13:
%r32 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab14

lab14:
store i1 true, i1* %r1
store i1 false, i1* %r2
%r33 = load i1, i1* %r1
%r34 = load i1, i1* %r2
%r35 = or i1 %r33, %r34
br i1 %r35, label %lab15, label %lab16

lab15:
%r36 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab17

lab16:
%r37 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab17

lab17:
store i1 false, i1* %r1
store i1 true, i1* %r2
%r38 = load i1, i1* %r1
%r39 = load i1, i1* %r2
%r40 = or i1 %r38, %r39
br i1 %r40, label %lab18, label %lab19

lab18:
%r41 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab20

lab19:
%r42 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab20

lab20:
store i1 false, i1* %r1
store i1 false, i1* %r2
%r43 = load i1, i1* %r1
%r44 = load i1, i1* %r2
%r45 = or i1 %r43, %r44
br i1 %r45, label %lab21, label %lab22

lab21:
%r46 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab23

lab22:
%r47 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab23

lab23:
call void @printgroup(i64 3)
%r48 = icmp sgt i64 42, 1
br i1 %r48, label %lab24, label %lab25

lab24:
%r49 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab26

lab25:
%r50 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab26

lab26:
%r51 = icmp sge i64 42, 1
br i1 %r51, label %lab27, label %lab28

lab27:
%r52 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab29

lab28:
%r53 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab29

lab29:
%r54 = icmp slt i64 42, 1
br i1 %r54, label %lab30, label %lab31

lab30:
%r55 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab32

lab31:
%r56 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab32

lab32:
%r57 = icmp sle i64 42, 1
br i1 %r57, label %lab33, label %lab34

lab33:
%r58 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab35

lab34:
%r59 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab35

lab35:
%r60 = icmp eq i64 42, 1
br i1 %r60, label %lab36, label %lab37

lab36:
%r61 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab38

lab37:
%r62 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab38

lab38:
%r63 = icmp ne i64 42, 1
br i1 %r63, label %lab39, label %lab40

lab39:
%r64 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab41

lab40:
%r65 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab41

lab41:
br i1 true, label %lab42, label %lab43

lab42:
%r66 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab44

lab43:
%r67 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab44

lab44:
%r68 = xor i1 true, true
br i1 %r68, label %lab45, label %lab46

lab45:
%r69 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab47

lab46:
%r70 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab47

lab47:
br i1 false, label %lab48, label %lab49

lab48:
%r71 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab50

lab49:
%r72 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab50

lab50:
%r73 = xor i1 true, false
br i1 %r73, label %lab51, label %lab52

lab51:
%r74 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab53

lab52:
%r75 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab53

lab53:
%r76 = xor i1 true, false
br i1 %r76, label %lab54, label %lab55

lab54:
%r77 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab56

lab55:
%r78 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab56

lab56:
call void @printgroup(i64 4)
%r79 = add i64 2, 3
%r80 = icmp eq i64 %r79, 5
br i1 %r80, label %lab57, label %lab58

lab57:
%r81 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab59

lab58:
%r82 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r83 = add i64 2, 3
%r84 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r83)
br label %lab59

lab59:
%r85 = mul i64 2, 3
%r86 = icmp eq i64 %r85, 6
br i1 %r86, label %lab60, label %lab61

lab60:
%r87 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab62

lab61:
%r88 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r89 = mul i64 2, 3
%r90 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r89)
br label %lab62

lab62:
%r91 = sub i64 3, 2
%r92 = icmp eq i64 %r91, 1
br i1 %r92, label %lab63, label %lab64

lab63:
%r93 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab65

lab64:
%r94 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r95 = sub i64 3, 2
%r96 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r95)
br label %lab65

lab65:
%r97 = sdiv i64 6, 3
%r98 = icmp eq i64 %r97, 2
br i1 %r98, label %lab66, label %lab67

lab66:
%r99 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab68

lab67:
%r100 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r101 = sdiv i64 6, 3
%r102 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r101)
br label %lab68

lab68:
%r103 = sub i64 0, 6
%r104 = icmp slt i64 %r103, 0
br i1 %r104, label %lab69, label %lab70

lab69:
%r105 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab71

lab70:
%r106 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab71

lab71:
call void @printgroup(i64 5)
store i64 42, i64* %r3
%r107 = load i64, i64* %r3
%r108 = icmp eq i64 %r107, 42
br i1 %r108, label %lab72, label %lab73

lab72:
%r109 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab74

lab73:
%r110 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab74

lab74:
store i64 3, i64* %r3
store i64 2, i64* %r4
%r111 = load i64, i64* %r3
%r112 = load i64, i64* %r4
%r113 = add i64 %r111, %r112
store i64 %r113, i64* %r5
%r114 = load i64, i64* %r5
%r115 = icmp eq i64 %r114, 5
br i1 %r115, label %lab75, label %lab76

lab75:
%r116 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab77

lab76:
%r117 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab77

lab77:
store i1 true, i1* %r1
%r118 = load i1, i1* %r1
br i1 %r118, label %lab78, label %lab79

lab78:
%r119 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab80

lab79:
%r120 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab80

lab80:
%r121 = load i1, i1* %r1
%r122 = xor i1 true, %r121
br i1 %r122, label %lab81, label %lab82

lab81:
%r123 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab83

lab82:
%r124 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab83

lab83:
store i1 false, i1* %r1
%r125 = load i1, i1* %r1
br i1 %r125, label %lab84, label %lab85

lab84:
%r126 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab86

lab85:
%r127 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab86

lab86:
%r128 = load i1, i1* %r1
%r129 = xor i1 true, %r128
br i1 %r129, label %lab87, label %lab88

lab87:
%r130 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab89

lab88:
%r131 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab89

lab89:
%r132 = load i1, i1* %r1
br i1 %r132, label %lab90, label %lab91

lab90:
%r133 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab92

lab91:
%r134 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab92

lab92:
call void @printgroup(i64 6)
store i64 0, i64* %r3
%r135 = load i64, i64* %r3
%r136 = icmp slt i64 %r135, 5
br i1 %r136, label %lab93, label %lab97

lab93:
%r137 = load i64, i64* %r3
%r138 = icmp sge i64 %r137, 5
br i1 %r138, label %lab94, label %lab95

lab94:
%r139 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab96

lab95:
br label %lab96

lab96:
%r140 = load i64, i64* %r3
%r141 = add i64 %r140, 5
store i64 %r141, i64* %r3
%r142 = load i64, i64* %r3
%r143 = icmp slt i64 %r142, 5
br i1 %r143, label %lab93, label %lab97

lab97:
%r144 = load i64, i64* %r3
%r145 = icmp eq i64 %r144, 5
br i1 %r145, label %lab98, label %lab99

lab98:
%r146 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab100

lab99:
%r147 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r148 = load i64, i64* %r3
%r149 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r148)
br label %lab100

lab100:
call void @printgroup(i64 7)
%r150 = call i8* @malloc(i64 17)
%r151 = bitcast i8* %r150 to %struct.thing*
store %struct.thing* %r151, %struct.thing** %r6
%r152 = load %struct.thing*, %struct.thing** %r6
%r153 = getelementptr inbounds %struct.thing, %struct.thing* %r152, i32 0, i32 0
store i64 42, i64* %r153
%r154 = load %struct.thing*, %struct.thing** %r6
%r155 = getelementptr inbounds %struct.thing, %struct.thing* %r154, i32 0, i32 1
store i1 true, i1* %r155
%r156 = load %struct.thing*, %struct.thing** %r6
%r157 = getelementptr inbounds %struct.thing, %struct.thing* %r156, i32 0, i32 0
%r158 = load i64, i64* %r157
%r159 = icmp eq i64 %r158, 42
br i1 %r159, label %lab101, label %lab102

lab101:
%r160 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab103

lab102:
%r161 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r162 = load %struct.thing*, %struct.thing** %r6
%r163 = getelementptr inbounds %struct.thing, %struct.thing* %r162, i32 0, i32 0
%r164 = load i64, i64* %r163
%r165 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r164)
br label %lab103

lab103:
%r166 = load %struct.thing*, %struct.thing** %r6
%r167 = getelementptr inbounds %struct.thing, %struct.thing* %r166, i32 0, i32 1
%r168 = load i1, i1* %r167
br i1 %r168, label %lab104, label %lab105

lab104:
%r169 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab106

lab105:
%r170 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab106

lab106:
%r171 = load %struct.thing*, %struct.thing** %r6
%r172 = getelementptr inbounds %struct.thing, %struct.thing* %r171, i32 0, i32 2
%r173 = call i8* @malloc(i64 17)
%r174 = bitcast i8* %r173 to %struct.thing*
store %struct.thing* %r174, %struct.thing** %r172
%r175 = load %struct.thing*, %struct.thing** %r6
%r176 = getelementptr inbounds %struct.thing, %struct.thing* %r175, i32 0, i32 2
%r177 = load %struct.thing*, %struct.thing** %r176
%r178 = getelementptr inbounds %struct.thing, %struct.thing* %r177, i32 0, i32 0
store i64 13, i64* %r178
%r179 = load %struct.thing*, %struct.thing** %r6
%r180 = getelementptr inbounds %struct.thing, %struct.thing* %r179, i32 0, i32 2
%r181 = load %struct.thing*, %struct.thing** %r180
%r182 = getelementptr inbounds %struct.thing, %struct.thing* %r181, i32 0, i32 1
store i1 false, i1* %r182
%r183 = load %struct.thing*, %struct.thing** %r6
%r184 = getelementptr inbounds %struct.thing, %struct.thing* %r183, i32 0, i32 2
%r185 = load %struct.thing*, %struct.thing** %r184
%r186 = getelementptr inbounds %struct.thing, %struct.thing* %r185, i32 0, i32 0
%r187 = load i64, i64* %r186
%r188 = icmp eq i64 %r187, 13
br i1 %r188, label %lab107, label %lab108

lab107:
%r189 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab109

lab108:
%r190 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r191 = load %struct.thing*, %struct.thing** %r6
%r192 = getelementptr inbounds %struct.thing, %struct.thing* %r191, i32 0, i32 2
%r193 = load %struct.thing*, %struct.thing** %r192
%r194 = getelementptr inbounds %struct.thing, %struct.thing* %r193, i32 0, i32 0
%r195 = load i64, i64* %r194
%r196 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r195)
br label %lab109

lab109:
%r197 = load %struct.thing*, %struct.thing** %r6
%r198 = getelementptr inbounds %struct.thing, %struct.thing* %r197, i32 0, i32 2
%r199 = load %struct.thing*, %struct.thing** %r198
%r200 = getelementptr inbounds %struct.thing, %struct.thing* %r199, i32 0, i32 1
%r201 = load i1, i1* %r200
%r202 = xor i1 true, %r201
br i1 %r202, label %lab110, label %lab111

lab110:
%r203 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab112

lab111:
%r204 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab112

lab112:
%r205 = load %struct.thing*, %struct.thing** %r6
%r206 = load %struct.thing*, %struct.thing** %r6
%r207 = icmp eq %struct.thing* %r205, %r206
br i1 %r207, label %lab113, label %lab114

lab113:
%r208 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab115

lab114:
%r209 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab115

lab115:
%r210 = load %struct.thing*, %struct.thing** %r6
%r211 = load %struct.thing*, %struct.thing** %r6
%r212 = getelementptr inbounds %struct.thing, %struct.thing* %r211, i32 0, i32 2
%r213 = load %struct.thing*, %struct.thing** %r212
%r214 = icmp ne %struct.thing* %r210, %r213
br i1 %r214, label %lab116, label %lab117

lab116:
%r215 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab118

lab117:
%r216 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab118

lab118:
%r217 = load %struct.thing*, %struct.thing** %r6
%r218 = getelementptr inbounds %struct.thing, %struct.thing* %r217, i32 0, i32 2
%r219 = load %struct.thing*, %struct.thing** %r218
%r220 = bitcast %struct.thing* %r219 to i8*
call void @free(i8* %r220)
%r221 = load %struct.thing*, %struct.thing** %r6
%r222 = bitcast %struct.thing* %r221 to i8*
call void @free(i8* %r222)
call void @printgroup(i64 8)
store i64 7, i64* @gi1
%r223 = load i64, i64* @gi1
%r224 = icmp eq i64 %r223, 7
br i1 %r224, label %lab119, label %lab120

lab119:
%r225 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab121

lab120:
%r226 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r227 = load i64, i64* @gi1
%r228 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r227)
br label %lab121

lab121:
store i1 true, i1* @gb1
%r229 = load i1, i1* @gb1
br i1 %r229, label %lab122, label %lab123

lab122:
%r230 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab124

lab123:
%r231 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab124

lab124:
%r232 = call i8* @malloc(i64 17)
%r233 = bitcast i8* %r232 to %struct.thing*
store %struct.thing* %r233, %struct.thing** @gs1
%r234 = load %struct.thing*, %struct.thing** @gs1
%r235 = getelementptr inbounds %struct.thing, %struct.thing* %r234, i32 0, i32 0
store i64 34, i64* %r235
%r236 = load %struct.thing*, %struct.thing** @gs1
%r237 = getelementptr inbounds %struct.thing, %struct.thing* %r236, i32 0, i32 1
store i1 false, i1* %r237
%r238 = load %struct.thing*, %struct.thing** @gs1
%r239 = getelementptr inbounds %struct.thing, %struct.thing* %r238, i32 0, i32 0
%r240 = load i64, i64* %r239
%r241 = icmp eq i64 %r240, 34
br i1 %r241, label %lab125, label %lab126

lab125:
%r242 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab127

lab126:
%r243 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r244 = load %struct.thing*, %struct.thing** @gs1
%r245 = getelementptr inbounds %struct.thing, %struct.thing* %r244, i32 0, i32 0
%r246 = load i64, i64* %r245
%r247 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r246)
br label %lab127

lab127:
%r248 = load %struct.thing*, %struct.thing** @gs1
%r249 = getelementptr inbounds %struct.thing, %struct.thing* %r248, i32 0, i32 1
%r250 = load i1, i1* %r249
%r251 = xor i1 true, %r250
br i1 %r251, label %lab128, label %lab129

lab128:
%r252 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab130

lab129:
%r253 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab130

lab130:
%r254 = load %struct.thing*, %struct.thing** @gs1
%r255 = getelementptr inbounds %struct.thing, %struct.thing* %r254, i32 0, i32 2
%r256 = call i8* @malloc(i64 17)
%r257 = bitcast i8* %r256 to %struct.thing*
store %struct.thing* %r257, %struct.thing** %r255
%r258 = load %struct.thing*, %struct.thing** @gs1
%r259 = getelementptr inbounds %struct.thing, %struct.thing* %r258, i32 0, i32 2
%r260 = load %struct.thing*, %struct.thing** %r259
%r261 = getelementptr inbounds %struct.thing, %struct.thing* %r260, i32 0, i32 0
store i64 16, i64* %r261
%r262 = load %struct.thing*, %struct.thing** @gs1
%r263 = getelementptr inbounds %struct.thing, %struct.thing* %r262, i32 0, i32 2
%r264 = load %struct.thing*, %struct.thing** %r263
%r265 = getelementptr inbounds %struct.thing, %struct.thing* %r264, i32 0, i32 1
store i1 true, i1* %r265
%r266 = load %struct.thing*, %struct.thing** @gs1
%r267 = getelementptr inbounds %struct.thing, %struct.thing* %r266, i32 0, i32 2
%r268 = load %struct.thing*, %struct.thing** %r267
%r269 = getelementptr inbounds %struct.thing, %struct.thing* %r268, i32 0, i32 0
%r270 = load i64, i64* %r269
%r271 = icmp eq i64 %r270, 16
br i1 %r271, label %lab131, label %lab132

lab131:
%r272 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab133

lab132:
%r273 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r274 = load %struct.thing*, %struct.thing** @gs1
%r275 = getelementptr inbounds %struct.thing, %struct.thing* %r274, i32 0, i32 2
%r276 = load %struct.thing*, %struct.thing** %r275
%r277 = getelementptr inbounds %struct.thing, %struct.thing* %r276, i32 0, i32 0
%r278 = load i64, i64* %r277
%r279 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r278)
br label %lab133

lab133:
%r280 = load %struct.thing*, %struct.thing** @gs1
%r281 = getelementptr inbounds %struct.thing, %struct.thing* %r280, i32 0, i32 2
%r282 = load %struct.thing*, %struct.thing** %r281
%r283 = getelementptr inbounds %struct.thing, %struct.thing* %r282, i32 0, i32 1
%r284 = load i1, i1* %r283
br i1 %r284, label %lab134, label %lab135

lab134:
%r285 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab136

lab135:
%r286 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab136

lab136:
%r287 = load %struct.thing*, %struct.thing** @gs1
%r288 = getelementptr inbounds %struct.thing, %struct.thing* %r287, i32 0, i32 2
%r289 = load %struct.thing*, %struct.thing** %r288
%r290 = bitcast %struct.thing* %r289 to i8*
call void @free(i8* %r290)
%r291 = load %struct.thing*, %struct.thing** @gs1
%r292 = bitcast %struct.thing* %r291 to i8*
call void @free(i8* %r292)
call void @printgroup(i64 9)
%r293 = call i8* @malloc(i64 17)
%r294 = bitcast i8* %r293 to %struct.thing*
store %struct.thing* %r294, %struct.thing** %r6
%r295 = load %struct.thing*, %struct.thing** %r6
%r296 = getelementptr inbounds %struct.thing, %struct.thing* %r295, i32 0, i32 1
store i1 true, i1* %r296
%r297 = load %struct.thing*, %struct.thing** %r6
call void @takealltypes(i64 3, i1 true, %struct.thing* %r297)
%r298 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 2)
call void @tonofargs(i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7, i64 8)
%r299 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 3)
%r300 = call i64 @returnint(i64 3)
store i64 %r300, i64* %r3
%r301 = load i64, i64* %r3
%r302 = icmp eq i64 %r301, 3
br i1 %r302, label %lab137, label %lab138

lab137:
%r303 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab139

lab138:
%r304 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r305 = load i64, i64* %r3
%r306 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r305)
br label %lab139

lab139:
%r307 = call i1 @returnbool(i1 true)
store i1 %r307, i1* %r1
%r308 = load i1, i1* %r1
br i1 %r308, label %lab140, label %lab141

lab140:
%r309 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab142

lab141:
%r310 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab142

lab142:
%r311 = call i8* @malloc(i64 17)
%r312 = bitcast i8* %r311 to %struct.thing*
store %struct.thing* %r312, %struct.thing** %r6
%r313 = load %struct.thing*, %struct.thing** %r6
%r314 = call %struct.thing* @returnstruct(%struct.thing* %r313)
store %struct.thing* %r314, %struct.thing** %r7
%r315 = load %struct.thing*, %struct.thing** %r6
%r316 = load %struct.thing*, %struct.thing** %r7
%r317 = icmp eq %struct.thing* %r315, %r316
br i1 %r317, label %lab143, label %lab144

lab143:
%r318 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab145

lab144:
%r319 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab145

lab145:
call void @printgroup(i64 10)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r320 = load i64, i64* %r0
ret i64 %r320

}

