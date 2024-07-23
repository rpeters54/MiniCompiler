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
%r1 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 1)
%r2 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r3 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 1)
%r4 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r5 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 1)
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r7 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r0)
ret void

}

define i1 @setcounter(i64 %r0) {
prologue:
store i64 %r0, i64* @counter
ret i1 true

}

define void @takealltypes(i64 %r0, i1 %r1, %struct.thing* %r2) {
prologue:
%r3 = icmp eq i64 %r0, 3
br i1 %r3, label %lab0, label %lab1

lab0:
%r4 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab2

lab1:
%r5 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab2

lab2:
%r6 = phi i1 [%r1, %lab0], [%r1, %lab1]
br i1 %r6, label %lab3, label %lab4

lab3:
%r7 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab5

lab4:
%r8 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab5

lab5:
%r9 = phi %struct.thing* [%r2, %lab3], [%r2, %lab4]
%r10 = getelementptr inbounds %struct.thing, %struct.thing* %r9, i32 0, i32 1
%r11 = load i1, i1* %r10
br i1 %r11, label %lab6, label %lab7

lab6:
%r12 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %returnLabel

lab7:
%r13 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %returnLabel

returnLabel:
ret void

}

define void @tonofargs(i64 %r0, i64 %r1, i64 %r2, i64 %r3, i64 %r4, i64 %r5, i64 %r6, i64 %r7) {
prologue:
%r8 = icmp eq i64 %r4, 5
br i1 %r8, label %lab0, label %lab1

lab0:
%r9 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab2

lab1:
%r10 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r12 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r4)
br label %lab2

lab2:
%r14 = phi i64 [%r5, %lab0], [%r5, %lab1]
%r15 = icmp eq i64 %r14, 6
br i1 %r15, label %lab3, label %lab4

lab3:
%r16 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab5

lab4:
%r17 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r19 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r14)
br label %lab5

lab5:
%r21 = phi i64 [%r6, %lab3], [%r6, %lab4]
%r22 = icmp eq i64 %r21, 7
br i1 %r22, label %lab6, label %lab7

lab6:
%r23 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab8

lab7:
%r24 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r26 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r21)
br label %lab8

lab8:
%r28 = phi i64 [%r7, %lab6], [%r7, %lab7]
%r29 = icmp eq i64 %r28, 8
br i1 %r29, label %lab9, label %lab10

lab9:
%r30 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %returnLabel

lab10:
%r31 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r33 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r28)
br label %returnLabel

returnLabel:
ret void

}

define i64 @returnint(i64 %r0) {
returnLabel:
ret i64 %r0

}

define i1 @returnbool(i1 %r0) {
returnLabel:
ret i1 %r0

}

define %struct.thing* @returnstruct(%struct.thing* %r0) {
returnLabel:
ret %struct.thing* %r0

}

define i64 @main() {
prologue:
store i64 0, i64* @counter
call void @printgroup(i64 1)
br i1 false, label %lab0, label %lab1

lab0:
%r1 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 false, label %lab3, label %lab4

lab1:
%r2 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 false, label %lab3, label %lab4

lab3:
%r4 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 false, label %lab6, label %lab7

lab4:
%r5 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 false, label %lab6, label %lab7

lab6:
%r7 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 true, label %lab9, label %lab10

lab7:
%r8 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab9, label %lab10

lab9:
%r10 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab11

lab10:
%r11 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab11

lab11:
store i64 0, i64* @counter
call void @printgroup(i64 2)
br i1 true, label %lab12, label %lab13

lab12:
%r13 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab15, label %lab16

lab13:
%r14 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 true, label %lab15, label %lab16

lab15:
%r16 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab18, label %lab19

lab16:
%r17 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 true, label %lab18, label %lab19

lab18:
%r19 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 false, label %lab21, label %lab22

lab19:
%r20 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 false, label %lab21, label %lab22

lab21:
%r22 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab23

lab22:
%r23 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab23

lab23:
call void @printgroup(i64 3)
br i1 true, label %lab24, label %lab25

lab24:
%r25 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab27, label %lab28

lab25:
%r26 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 true, label %lab27, label %lab28

lab27:
%r28 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 false, label %lab30, label %lab31

lab28:
%r29 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 false, label %lab30, label %lab31

lab30:
%r31 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 false, label %lab33, label %lab34

lab31:
%r32 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 false, label %lab33, label %lab34

lab33:
%r34 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 false, label %lab36, label %lab37

lab34:
%r35 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 false, label %lab36, label %lab37

lab36:
%r37 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 true, label %lab39, label %lab40

lab37:
%r38 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab39, label %lab40

lab39:
%r40 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab42, label %lab43

lab40:
%r41 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 true, label %lab42, label %lab43

lab42:
%r42 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 false, label %lab45, label %lab46

lab43:
%r43 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 false, label %lab45, label %lab46

lab45:
%r45 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 false, label %lab48, label %lab49

lab46:
%r46 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 false, label %lab48, label %lab49

lab48:
%r47 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 true, label %lab51, label %lab52

lab49:
%r48 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab51, label %lab52

lab51:
%r50 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab54, label %lab55

lab52:
%r51 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 true, label %lab54, label %lab55

lab54:
%r53 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab56

lab55:
%r54 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab56

lab56:
call void @printgroup(i64 4)
br i1 true, label %lab57, label %lab58

lab57:
%r57 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab60, label %lab61

lab58:
%r58 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r60 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 5)
br i1 true, label %lab60, label %lab61

lab60:
%r63 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab63, label %lab64

lab61:
%r64 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r66 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 6)
br i1 true, label %lab63, label %lab64

lab63:
%r69 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab66, label %lab67

lab64:
%r70 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r72 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab66, label %lab67

lab66:
%r75 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab69, label %lab70

lab67:
%r76 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r78 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 2)
br i1 true, label %lab69, label %lab70

lab69:
%r81 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab71

lab70:
%r82 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab71

lab71:
call void @printgroup(i64 5)
br i1 true, label %lab72, label %lab73

lab72:
%r84 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab75, label %lab76

lab73:
%r85 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 true, label %lab75, label %lab76

lab75:
%r88 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 true, label %lab78, label %lab79

lab76:
%r89 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 true, label %lab78, label %lab79

lab78:
%r90 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab80

lab79:
%r91 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab80

lab80:
%r92 = phi i1 [true, %lab78], [true, %lab79]
%r93 = xor i1 true, %r92
br i1 %r93, label %lab81, label %lab82

lab81:
%r94 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br i1 false, label %lab84, label %lab85

lab82:
%r95 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br i1 false, label %lab84, label %lab85

lab84:
%r96 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab86

lab85:
%r97 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab86

lab86:
%r98 = phi i1 [false, %lab84], [false, %lab85]
%r99 = xor i1 true, %r98
br i1 %r99, label %lab87, label %lab88

lab87:
%r100 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab89

lab88:
%r101 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab89

lab89:
%r102 = phi i1 [%r98, %lab87], [%r98, %lab88]
br i1 %r102, label %lab90, label %lab91

lab90:
%r103 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab92

lab91:
%r104 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab92

lab92:
call void @printgroup(i64 6)
br i1 true, label %lab93, label %lab97

lab93:
%r106 = phi i64 [0, %lab92], [%r110, %lab96]
%r107 = icmp sge i64 %r106, 5
br i1 %r107, label %lab94, label %lab96

lab94:
%r108 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab96

lab96:
%r109 = phi i64 [%r106, %lab94], [%r106, %lab93]
%r110 = add i64 %r109, 5
%r111 = icmp slt i64 %r110, 5
br i1 %r111, label %lab93, label %lab97

lab97:
%r112 = phi i64 [0, %lab92], [%r110, %lab96]
%r113 = icmp eq i64 %r112, 5
br i1 %r113, label %lab98, label %lab99

lab98:
%r114 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab100

lab99:
%r115 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r117 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r112)
br label %lab100

lab100:
call void @printgroup(i64 7)
%r119 = call i8* @malloc(i64 17)
%r120 = bitcast i8* %r119 to %struct.thing*
%r121 = getelementptr inbounds %struct.thing, %struct.thing* %r120, i32 0, i32 0
store i64 42, i64* %r121
%r122 = getelementptr inbounds %struct.thing, %struct.thing* %r120, i32 0, i32 1
store i1 true, i1* %r122
%r123 = getelementptr inbounds %struct.thing, %struct.thing* %r120, i32 0, i32 0
%r124 = load i64, i64* %r123
%r125 = icmp eq i64 %r124, 42
br i1 %r125, label %lab101, label %lab102

lab101:
%r126 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab103

lab102:
%r127 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r129 = getelementptr inbounds %struct.thing, %struct.thing* %r120, i32 0, i32 0
%r130 = load i64, i64* %r129
%r131 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r130)
br label %lab103

lab103:
%r132 = phi %struct.thing* [%r120, %lab101], [%r120, %lab102]
%r133 = getelementptr inbounds %struct.thing, %struct.thing* %r132, i32 0, i32 1
%r134 = load i1, i1* %r133
br i1 %r134, label %lab104, label %lab105

lab104:
%r135 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab106

lab105:
%r136 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab106

lab106:
%r137 = phi %struct.thing* [%r132, %lab104], [%r132, %lab105]
%r138 = getelementptr inbounds %struct.thing, %struct.thing* %r137, i32 0, i32 2
%r139 = call i8* @malloc(i64 17)
%r140 = bitcast i8* %r139 to %struct.thing*
store %struct.thing* %r140, %struct.thing** %r138
%r141 = getelementptr inbounds %struct.thing, %struct.thing* %r137, i32 0, i32 2
%r142 = load %struct.thing*, %struct.thing** %r141
%r143 = getelementptr inbounds %struct.thing, %struct.thing* %r142, i32 0, i32 0
store i64 13, i64* %r143
%r144 = getelementptr inbounds %struct.thing, %struct.thing* %r137, i32 0, i32 2
%r145 = load %struct.thing*, %struct.thing** %r144
%r146 = getelementptr inbounds %struct.thing, %struct.thing* %r145, i32 0, i32 1
store i1 false, i1* %r146
%r147 = getelementptr inbounds %struct.thing, %struct.thing* %r137, i32 0, i32 2
%r148 = load %struct.thing*, %struct.thing** %r147
%r149 = getelementptr inbounds %struct.thing, %struct.thing* %r148, i32 0, i32 0
%r150 = load i64, i64* %r149
%r151 = icmp eq i64 %r150, 13
br i1 %r151, label %lab107, label %lab108

lab107:
%r152 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab109

lab108:
%r153 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r155 = getelementptr inbounds %struct.thing, %struct.thing* %r137, i32 0, i32 2
%r156 = load %struct.thing*, %struct.thing** %r155
%r157 = getelementptr inbounds %struct.thing, %struct.thing* %r156, i32 0, i32 0
%r158 = load i64, i64* %r157
%r159 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r158)
br label %lab109

lab109:
%r160 = phi %struct.thing* [%r137, %lab107], [%r137, %lab108]
%r161 = getelementptr inbounds %struct.thing, %struct.thing* %r160, i32 0, i32 2
%r162 = load %struct.thing*, %struct.thing** %r161
%r163 = getelementptr inbounds %struct.thing, %struct.thing* %r162, i32 0, i32 1
%r164 = load i1, i1* %r163
%r165 = xor i1 true, %r164
br i1 %r165, label %lab110, label %lab111

lab110:
%r166 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab112

lab111:
%r167 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab112

lab112:
%r168 = phi %struct.thing* [%r160, %lab110], [%r160, %lab111]
%r169 = icmp eq %struct.thing* %r168, %r168
br i1 %r169, label %lab113, label %lab114

lab113:
%r170 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab115

lab114:
%r171 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab115

lab115:
%r172 = phi %struct.thing* [%r168, %lab113], [%r168, %lab114]
%r173 = getelementptr inbounds %struct.thing, %struct.thing* %r172, i32 0, i32 2
%r174 = load %struct.thing*, %struct.thing** %r173
%r175 = icmp ne %struct.thing* %r172, %r174
br i1 %r175, label %lab116, label %lab117

lab116:
%r176 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab118

lab117:
%r177 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab118

lab118:
%r178 = phi %struct.thing* [%r172, %lab116], [%r172, %lab117]
%r179 = getelementptr inbounds %struct.thing, %struct.thing* %r178, i32 0, i32 2
%r180 = load %struct.thing*, %struct.thing** %r179
%r181 = bitcast %struct.thing* %r180 to i8*
call void @free(i8* %r181)
%r182 = bitcast %struct.thing* %r178 to i8*
call void @free(i8* %r182)
call void @printgroup(i64 8)
store i64 7, i64* @gi1
%r183 = load i64, i64* @gi1
%r184 = icmp eq i64 %r183, 7
br i1 %r184, label %lab119, label %lab120

lab119:
%r185 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab121

lab120:
%r186 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r187 = load i64, i64* @gi1
%r188 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r187)
br label %lab121

lab121:
store i1 true, i1* @gb1
%r189 = load i1, i1* @gb1
br i1 %r189, label %lab122, label %lab123

lab122:
%r190 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab124

lab123:
%r191 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab124

lab124:
%r192 = call i8* @malloc(i64 17)
%r193 = bitcast i8* %r192 to %struct.thing*
store %struct.thing* %r193, %struct.thing** @gs1
%r194 = load %struct.thing*, %struct.thing** @gs1
%r195 = getelementptr inbounds %struct.thing, %struct.thing* %r194, i32 0, i32 0
store i64 34, i64* %r195
%r196 = load %struct.thing*, %struct.thing** @gs1
%r197 = getelementptr inbounds %struct.thing, %struct.thing* %r196, i32 0, i32 1
store i1 false, i1* %r197
%r198 = load %struct.thing*, %struct.thing** @gs1
%r199 = getelementptr inbounds %struct.thing, %struct.thing* %r198, i32 0, i32 0
%r200 = load i64, i64* %r199
%r201 = icmp eq i64 %r200, 34
br i1 %r201, label %lab125, label %lab126

lab125:
%r202 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab127

lab126:
%r203 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r204 = load %struct.thing*, %struct.thing** @gs1
%r205 = getelementptr inbounds %struct.thing, %struct.thing* %r204, i32 0, i32 0
%r206 = load i64, i64* %r205
%r207 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r206)
br label %lab127

lab127:
%r208 = load %struct.thing*, %struct.thing** @gs1
%r209 = getelementptr inbounds %struct.thing, %struct.thing* %r208, i32 0, i32 1
%r210 = load i1, i1* %r209
%r211 = xor i1 true, %r210
br i1 %r211, label %lab128, label %lab129

lab128:
%r212 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab130

lab129:
%r213 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab130

lab130:
%r214 = load %struct.thing*, %struct.thing** @gs1
%r215 = getelementptr inbounds %struct.thing, %struct.thing* %r214, i32 0, i32 2
%r216 = call i8* @malloc(i64 17)
%r217 = bitcast i8* %r216 to %struct.thing*
store %struct.thing* %r217, %struct.thing** %r215
%r218 = load %struct.thing*, %struct.thing** @gs1
%r219 = getelementptr inbounds %struct.thing, %struct.thing* %r218, i32 0, i32 2
%r220 = load %struct.thing*, %struct.thing** %r219
%r221 = getelementptr inbounds %struct.thing, %struct.thing* %r220, i32 0, i32 0
store i64 16, i64* %r221
%r222 = load %struct.thing*, %struct.thing** @gs1
%r223 = getelementptr inbounds %struct.thing, %struct.thing* %r222, i32 0, i32 2
%r224 = load %struct.thing*, %struct.thing** %r223
%r225 = getelementptr inbounds %struct.thing, %struct.thing* %r224, i32 0, i32 1
store i1 true, i1* %r225
%r226 = load %struct.thing*, %struct.thing** @gs1
%r227 = getelementptr inbounds %struct.thing, %struct.thing* %r226, i32 0, i32 2
%r228 = load %struct.thing*, %struct.thing** %r227
%r229 = getelementptr inbounds %struct.thing, %struct.thing* %r228, i32 0, i32 0
%r230 = load i64, i64* %r229
%r231 = icmp eq i64 %r230, 16
br i1 %r231, label %lab131, label %lab132

lab131:
%r232 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab133

lab132:
%r233 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r234 = load %struct.thing*, %struct.thing** @gs1
%r235 = getelementptr inbounds %struct.thing, %struct.thing* %r234, i32 0, i32 2
%r236 = load %struct.thing*, %struct.thing** %r235
%r237 = getelementptr inbounds %struct.thing, %struct.thing* %r236, i32 0, i32 0
%r238 = load i64, i64* %r237
%r239 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r238)
br label %lab133

lab133:
%r240 = load %struct.thing*, %struct.thing** @gs1
%r241 = getelementptr inbounds %struct.thing, %struct.thing* %r240, i32 0, i32 2
%r242 = load %struct.thing*, %struct.thing** %r241
%r243 = getelementptr inbounds %struct.thing, %struct.thing* %r242, i32 0, i32 1
%r244 = load i1, i1* %r243
br i1 %r244, label %lab134, label %lab135

lab134:
%r245 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab136

lab135:
%r246 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab136

lab136:
%r247 = load %struct.thing*, %struct.thing** @gs1
%r248 = getelementptr inbounds %struct.thing, %struct.thing* %r247, i32 0, i32 2
%r249 = load %struct.thing*, %struct.thing** %r248
%r250 = bitcast %struct.thing* %r249 to i8*
call void @free(i8* %r250)
%r251 = load %struct.thing*, %struct.thing** @gs1
%r252 = bitcast %struct.thing* %r251 to i8*
call void @free(i8* %r252)
call void @printgroup(i64 9)
%r253 = call i8* @malloc(i64 17)
%r254 = bitcast i8* %r253 to %struct.thing*
%r255 = getelementptr inbounds %struct.thing, %struct.thing* %r254, i32 0, i32 1
store i1 true, i1* %r255
call void @takealltypes(i64 3, i1 true, %struct.thing* %r254)
%r256 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 2)
call void @tonofargs(i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7, i64 8)
%r257 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 3)
%r258 = call i64 @returnint(i64 3)
%r259 = icmp eq i64 %r258, 3
br i1 %r259, label %lab137, label %lab138

lab137:
%r260 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab139

lab138:
%r261 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
%r263 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r258)
br label %lab139

lab139:
%r265 = call i1 @returnbool(i1 true)
br i1 %r265, label %lab140, label %lab141

lab140:
%r266 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %lab142

lab141:
%r267 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %lab142

lab142:
%r268 = call i8* @malloc(i64 17)
%r269 = bitcast i8* %r268 to %struct.thing*
%r270 = call %struct.thing* @returnstruct(%struct.thing* %r269)
%r271 = icmp eq %struct.thing* %r269, %r270
br i1 %r271, label %lab143, label %lab144

lab143:
%r272 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
br label %returnLabel

lab144:
%r273 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
br label %returnLabel

returnLabel:
call void @printgroup(i64 10)
ret i64 0

}

