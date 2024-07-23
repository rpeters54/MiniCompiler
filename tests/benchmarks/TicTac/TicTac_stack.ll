declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.gameBoard = type {i64, i64, i64, i64, i64, i64, i64, i64, i64}

define void @cleanBoard(%struct.gameBoard* %r0) {
prologue:
%r1 = alloca %struct.gameBoard*
store %struct.gameBoard* %r0, %struct.gameBoard** %r1
%r2 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r3 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r2, i32 0, i32 0
store i64 0, i64* %r3
%r4 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r5 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r4, i32 0, i32 1
store i64 0, i64* %r5
%r6 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r7 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r6, i32 0, i32 2
store i64 0, i64* %r7
%r8 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r9 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r8, i32 0, i32 3
store i64 0, i64* %r9
%r10 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r11 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r10, i32 0, i32 4
store i64 0, i64* %r11
%r12 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r13 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r12, i32 0, i32 5
store i64 0, i64* %r13
%r14 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r15 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r14, i32 0, i32 6
store i64 0, i64* %r15
%r16 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r17 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r16, i32 0, i32 7
store i64 0, i64* %r17
%r18 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r19 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r18, i32 0, i32 8
store i64 0, i64* %r19
br label %returnLabel

returnLabel:
ret void

}

define void @printBoard(%struct.gameBoard* %r0) {
prologue:
%r1 = alloca %struct.gameBoard*
store %struct.gameBoard* %r0, %struct.gameBoard** %r1
%r2 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r3 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r2, i32 0, i32 0
%r4 = load i64, i64* %r3
%r5 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r4)
%r6 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r7 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r6, i32 0, i32 1
%r8 = load i64, i64* %r7
%r9 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r8)
%r10 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r11 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r10, i32 0, i32 2
%r12 = load i64, i64* %r11
%r13 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r12)
%r14 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r15 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r14, i32 0, i32 3
%r16 = load i64, i64* %r15
%r17 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r16)
%r18 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r19 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r18, i32 0, i32 4
%r20 = load i64, i64* %r19
%r21 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r20)
%r22 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r23 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r22, i32 0, i32 5
%r24 = load i64, i64* %r23
%r25 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r24)
%r26 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r27 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r26, i32 0, i32 6
%r28 = load i64, i64* %r27
%r29 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r28)
%r30 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r31 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r30, i32 0, i32 7
%r32 = load i64, i64* %r31
%r33 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r32)
%r34 = load %struct.gameBoard*, %struct.gameBoard** %r1
%r35 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r34, i32 0, i32 8
%r36 = load i64, i64* %r35
%r37 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r36)
br label %returnLabel

returnLabel:
ret void

}

define void @printMoveBoard() {
prologue:
%r0 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 123)
%r1 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 456)
%r2 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 789)
br label %returnLabel

returnLabel:
ret void

}

define void @placePiece(%struct.gameBoard* %r0, i64 %r1, i64 %r2) {
prologue:
%r3 = alloca %struct.gameBoard*
%r4 = alloca i64
%r5 = alloca i64
store %struct.gameBoard* %r0, %struct.gameBoard** %r3
store i64 %r1, i64* %r4
store i64 %r2, i64* %r5
%r6 = load i64, i64* %r5
%r7 = icmp eq i64 %r6, 1
br i1 %r7, label %lab0, label %lab1

lab0:
%r8 = load %struct.gameBoard*, %struct.gameBoard** %r3
%r9 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r8, i32 0, i32 0
%r10 = load i64, i64* %r4
store i64 %r10, i64* %r9
br label %lab26

lab1:
%r11 = load i64, i64* %r5
%r12 = icmp eq i64 %r11, 2
br i1 %r12, label %lab2, label %lab3

lab2:
%r13 = load %struct.gameBoard*, %struct.gameBoard** %r3
%r14 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r13, i32 0, i32 1
%r15 = load i64, i64* %r4
store i64 %r15, i64* %r14
br label %lab25

lab3:
%r16 = load i64, i64* %r5
%r17 = icmp eq i64 %r16, 3
br i1 %r17, label %lab4, label %lab5

lab4:
%r18 = load %struct.gameBoard*, %struct.gameBoard** %r3
%r19 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r18, i32 0, i32 2
%r20 = load i64, i64* %r4
store i64 %r20, i64* %r19
br label %lab24

lab5:
%r21 = load i64, i64* %r5
%r22 = icmp eq i64 %r21, 4
br i1 %r22, label %lab6, label %lab7

lab6:
%r23 = load %struct.gameBoard*, %struct.gameBoard** %r3
%r24 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r23, i32 0, i32 3
%r25 = load i64, i64* %r4
store i64 %r25, i64* %r24
br label %lab23

lab7:
%r26 = load i64, i64* %r5
%r27 = icmp eq i64 %r26, 5
br i1 %r27, label %lab8, label %lab9

lab8:
%r28 = load %struct.gameBoard*, %struct.gameBoard** %r3
%r29 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r28, i32 0, i32 4
%r30 = load i64, i64* %r4
store i64 %r30, i64* %r29
br label %lab22

lab9:
%r31 = load i64, i64* %r5
%r32 = icmp eq i64 %r31, 6
br i1 %r32, label %lab10, label %lab11

lab10:
%r33 = load %struct.gameBoard*, %struct.gameBoard** %r3
%r34 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r33, i32 0, i32 5
%r35 = load i64, i64* %r4
store i64 %r35, i64* %r34
br label %lab21

lab11:
%r36 = load i64, i64* %r5
%r37 = icmp eq i64 %r36, 7
br i1 %r37, label %lab12, label %lab13

lab12:
%r38 = load %struct.gameBoard*, %struct.gameBoard** %r3
%r39 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r38, i32 0, i32 6
%r40 = load i64, i64* %r4
store i64 %r40, i64* %r39
br label %lab20

lab13:
%r41 = load i64, i64* %r5
%r42 = icmp eq i64 %r41, 8
br i1 %r42, label %lab14, label %lab15

lab14:
%r43 = load %struct.gameBoard*, %struct.gameBoard** %r3
%r44 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r43, i32 0, i32 7
%r45 = load i64, i64* %r4
store i64 %r45, i64* %r44
br label %lab19

lab15:
%r46 = load i64, i64* %r5
%r47 = icmp eq i64 %r46, 9
br i1 %r47, label %lab16, label %lab17

lab16:
%r48 = load %struct.gameBoard*, %struct.gameBoard** %r3
%r49 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r48, i32 0, i32 8
%r50 = load i64, i64* %r4
store i64 %r50, i64* %r49
br label %lab18

lab17:
br label %lab18

lab18:
br label %lab19

lab19:
br label %lab20

lab20:
br label %lab21

lab21:
br label %lab22

lab22:
br label %lab23

lab23:
br label %lab24

lab24:
br label %lab25

lab25:
br label %lab26

lab26:
br label %returnLabel

returnLabel:
ret void

}

define i64 @checkWinner(%struct.gameBoard* %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca %struct.gameBoard*
store %struct.gameBoard* %r0, %struct.gameBoard** %r2
%r3 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r4 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r3, i32 0, i32 0
%r5 = load i64, i64* %r4
%r6 = icmp eq i64 %r5, 1
br i1 %r6, label %lab0, label %lab7

lab0:
%r7 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r8 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r7, i32 0, i32 1
%r9 = load i64, i64* %r8
%r10 = icmp eq i64 %r9, 1
br i1 %r10, label %lab1, label %lab5

lab1:
%r11 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r12 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r11, i32 0, i32 2
%r13 = load i64, i64* %r12
%r14 = icmp eq i64 %r13, 1
br i1 %r14, label %lab2, label %lab3

lab2:
store i64 0, i64* %r1
br label %returnLabel

lab3:
br label %lab4

lab4:
br label %lab6

lab5:
br label %lab6

lab6:
br label %lab8

lab7:
br label %lab8

lab8:
%r15 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r16 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r15, i32 0, i32 0
%r17 = load i64, i64* %r16
%r18 = icmp eq i64 %r17, 2
br i1 %r18, label %lab9, label %lab16

lab9:
%r19 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r20 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r19, i32 0, i32 1
%r21 = load i64, i64* %r20
%r22 = icmp eq i64 %r21, 2
br i1 %r22, label %lab10, label %lab14

lab10:
%r23 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r24 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r23, i32 0, i32 2
%r25 = load i64, i64* %r24
%r26 = icmp eq i64 %r25, 2
br i1 %r26, label %lab11, label %lab12

lab11:
store i64 1, i64* %r1
br label %returnLabel

lab12:
br label %lab13

lab13:
br label %lab15

lab14:
br label %lab15

lab15:
br label %lab17

lab16:
br label %lab17

lab17:
%r27 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r28 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r27, i32 0, i32 3
%r29 = load i64, i64* %r28
%r30 = icmp eq i64 %r29, 1
br i1 %r30, label %lab18, label %lab25

lab18:
%r31 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r32 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r31, i32 0, i32 4
%r33 = load i64, i64* %r32
%r34 = icmp eq i64 %r33, 1
br i1 %r34, label %lab19, label %lab23

lab19:
%r35 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r36 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r35, i32 0, i32 5
%r37 = load i64, i64* %r36
%r38 = icmp eq i64 %r37, 1
br i1 %r38, label %lab20, label %lab21

lab20:
store i64 0, i64* %r1
br label %returnLabel

lab21:
br label %lab22

lab22:
br label %lab24

lab23:
br label %lab24

lab24:
br label %lab26

lab25:
br label %lab26

lab26:
%r39 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r40 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r39, i32 0, i32 3
%r41 = load i64, i64* %r40
%r42 = icmp eq i64 %r41, 2
br i1 %r42, label %lab27, label %lab34

lab27:
%r43 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r44 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r43, i32 0, i32 4
%r45 = load i64, i64* %r44
%r46 = icmp eq i64 %r45, 2
br i1 %r46, label %lab28, label %lab32

lab28:
%r47 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r48 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r47, i32 0, i32 5
%r49 = load i64, i64* %r48
%r50 = icmp eq i64 %r49, 2
br i1 %r50, label %lab29, label %lab30

lab29:
store i64 1, i64* %r1
br label %returnLabel

lab30:
br label %lab31

lab31:
br label %lab33

lab32:
br label %lab33

lab33:
br label %lab35

lab34:
br label %lab35

lab35:
%r51 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r52 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r51, i32 0, i32 6
%r53 = load i64, i64* %r52
%r54 = icmp eq i64 %r53, 1
br i1 %r54, label %lab36, label %lab43

lab36:
%r55 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r56 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r55, i32 0, i32 7
%r57 = load i64, i64* %r56
%r58 = icmp eq i64 %r57, 1
br i1 %r58, label %lab37, label %lab41

lab37:
%r59 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r60 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r59, i32 0, i32 8
%r61 = load i64, i64* %r60
%r62 = icmp eq i64 %r61, 1
br i1 %r62, label %lab38, label %lab39

lab38:
store i64 0, i64* %r1
br label %returnLabel

lab39:
br label %lab40

lab40:
br label %lab42

lab41:
br label %lab42

lab42:
br label %lab44

lab43:
br label %lab44

lab44:
%r63 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r64 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r63, i32 0, i32 6
%r65 = load i64, i64* %r64
%r66 = icmp eq i64 %r65, 2
br i1 %r66, label %lab45, label %lab52

lab45:
%r67 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r68 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r67, i32 0, i32 7
%r69 = load i64, i64* %r68
%r70 = icmp eq i64 %r69, 2
br i1 %r70, label %lab46, label %lab50

lab46:
%r71 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r72 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r71, i32 0, i32 8
%r73 = load i64, i64* %r72
%r74 = icmp eq i64 %r73, 2
br i1 %r74, label %lab47, label %lab48

lab47:
store i64 1, i64* %r1
br label %returnLabel

lab48:
br label %lab49

lab49:
br label %lab51

lab50:
br label %lab51

lab51:
br label %lab53

lab52:
br label %lab53

lab53:
%r75 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r76 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r75, i32 0, i32 0
%r77 = load i64, i64* %r76
%r78 = icmp eq i64 %r77, 1
br i1 %r78, label %lab54, label %lab61

lab54:
%r79 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r80 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r79, i32 0, i32 3
%r81 = load i64, i64* %r80
%r82 = icmp eq i64 %r81, 1
br i1 %r82, label %lab55, label %lab59

lab55:
%r83 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r84 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r83, i32 0, i32 6
%r85 = load i64, i64* %r84
%r86 = icmp eq i64 %r85, 1
br i1 %r86, label %lab56, label %lab57

lab56:
store i64 0, i64* %r1
br label %returnLabel

lab57:
br label %lab58

lab58:
br label %lab60

lab59:
br label %lab60

lab60:
br label %lab62

lab61:
br label %lab62

lab62:
%r87 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r88 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r87, i32 0, i32 0
%r89 = load i64, i64* %r88
%r90 = icmp eq i64 %r89, 2
br i1 %r90, label %lab63, label %lab70

lab63:
%r91 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r92 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r91, i32 0, i32 3
%r93 = load i64, i64* %r92
%r94 = icmp eq i64 %r93, 2
br i1 %r94, label %lab64, label %lab68

lab64:
%r95 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r96 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r95, i32 0, i32 6
%r97 = load i64, i64* %r96
%r98 = icmp eq i64 %r97, 2
br i1 %r98, label %lab65, label %lab66

lab65:
store i64 1, i64* %r1
br label %returnLabel

lab66:
br label %lab67

lab67:
br label %lab69

lab68:
br label %lab69

lab69:
br label %lab71

lab70:
br label %lab71

lab71:
%r99 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r100 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r99, i32 0, i32 1
%r101 = load i64, i64* %r100
%r102 = icmp eq i64 %r101, 1
br i1 %r102, label %lab72, label %lab79

lab72:
%r103 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r104 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r103, i32 0, i32 4
%r105 = load i64, i64* %r104
%r106 = icmp eq i64 %r105, 1
br i1 %r106, label %lab73, label %lab77

lab73:
%r107 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r108 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r107, i32 0, i32 7
%r109 = load i64, i64* %r108
%r110 = icmp eq i64 %r109, 1
br i1 %r110, label %lab74, label %lab75

lab74:
store i64 0, i64* %r1
br label %returnLabel

lab75:
br label %lab76

lab76:
br label %lab78

lab77:
br label %lab78

lab78:
br label %lab80

lab79:
br label %lab80

lab80:
%r111 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r112 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r111, i32 0, i32 1
%r113 = load i64, i64* %r112
%r114 = icmp eq i64 %r113, 2
br i1 %r114, label %lab81, label %lab88

lab81:
%r115 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r116 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r115, i32 0, i32 4
%r117 = load i64, i64* %r116
%r118 = icmp eq i64 %r117, 2
br i1 %r118, label %lab82, label %lab86

lab82:
%r119 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r120 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r119, i32 0, i32 7
%r121 = load i64, i64* %r120
%r122 = icmp eq i64 %r121, 2
br i1 %r122, label %lab83, label %lab84

lab83:
store i64 1, i64* %r1
br label %returnLabel

lab84:
br label %lab85

lab85:
br label %lab87

lab86:
br label %lab87

lab87:
br label %lab89

lab88:
br label %lab89

lab89:
%r123 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r124 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r123, i32 0, i32 2
%r125 = load i64, i64* %r124
%r126 = icmp eq i64 %r125, 1
br i1 %r126, label %lab90, label %lab97

lab90:
%r127 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r128 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r127, i32 0, i32 5
%r129 = load i64, i64* %r128
%r130 = icmp eq i64 %r129, 1
br i1 %r130, label %lab91, label %lab95

lab91:
%r131 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r132 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r131, i32 0, i32 8
%r133 = load i64, i64* %r132
%r134 = icmp eq i64 %r133, 1
br i1 %r134, label %lab92, label %lab93

lab92:
store i64 0, i64* %r1
br label %returnLabel

lab93:
br label %lab94

lab94:
br label %lab96

lab95:
br label %lab96

lab96:
br label %lab98

lab97:
br label %lab98

lab98:
%r135 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r136 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r135, i32 0, i32 2
%r137 = load i64, i64* %r136
%r138 = icmp eq i64 %r137, 2
br i1 %r138, label %lab99, label %lab106

lab99:
%r139 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r140 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r139, i32 0, i32 5
%r141 = load i64, i64* %r140
%r142 = icmp eq i64 %r141, 2
br i1 %r142, label %lab100, label %lab104

lab100:
%r143 = load %struct.gameBoard*, %struct.gameBoard** %r2
%r144 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r143, i32 0, i32 8
%r145 = load i64, i64* %r144
%r146 = icmp eq i64 %r145, 2
br i1 %r146, label %lab101, label %lab102

lab101:
store i64 1, i64* %r1
br label %returnLabel

lab102:
br label %lab103

lab103:
br label %lab105

lab104:
br label %lab105

lab105:
br label %lab107

lab106:
br label %lab107

lab107:
%r147 = sub i64 0, 1
store i64 %r147, i64* %r1
br label %returnLabel

returnLabel:
%r148 = load i64, i64* %r1
ret i64 %r148

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca %struct.gameBoard*
store i64 0, i64* %r5
store i64 0, i64* %r1
store i64 0, i64* %r2
store i64 0, i64* %r3
%r7 = sub i64 0, 1
store i64 %r7, i64* %r4
%r8 = call i8* @malloc(i64 72)
%r9 = bitcast i8* %r8 to %struct.gameBoard*
store %struct.gameBoard* %r9, %struct.gameBoard** %r6
%r10 = load %struct.gameBoard*, %struct.gameBoard** %r6
call void @cleanBoard(%struct.gameBoard* %r10)
%r11 = load i64, i64* %r4
%r12 = icmp slt i64 %r11, 0
%r13 = load i64, i64* %r5
%r14 = icmp ne i64 %r13, 8
%r15 = and i1 %r12, %r14
br i1 %r15, label %lab0, label %lab4

lab0:
%r16 = load %struct.gameBoard*, %struct.gameBoard** %r6
call void @printBoard(%struct.gameBoard* %r16)
%r17 = load i64, i64* %r1
%r18 = icmp eq i64 %r17, 0
br i1 %r18, label %lab1, label %lab2

lab1:
%r19 = load i64, i64* %r1
%r20 = add i64 %r19, 1
store i64 %r20, i64* %r1
%r21 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r22 = load i64, i64* @.read_scratch
store i64 %r22, i64* %r2
%r23 = load %struct.gameBoard*, %struct.gameBoard** %r6
%r24 = load i64, i64* %r2
call void @placePiece(%struct.gameBoard* %r23, i64 1, i64 %r24)
br label %lab3

lab2:
%r25 = load i64, i64* %r1
%r26 = sub i64 %r25, 1
store i64 %r26, i64* %r1
%r27 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r28 = load i64, i64* @.read_scratch
store i64 %r28, i64* %r3
%r29 = load %struct.gameBoard*, %struct.gameBoard** %r6
%r30 = load i64, i64* %r3
call void @placePiece(%struct.gameBoard* %r29, i64 2, i64 %r30)
br label %lab3

lab3:
%r31 = load %struct.gameBoard*, %struct.gameBoard** %r6
%r32 = call i64 @checkWinner(%struct.gameBoard* %r31)
store i64 %r32, i64* %r4
%r33 = load i64, i64* %r5
%r34 = add i64 %r33, 1
store i64 %r34, i64* %r5
%r35 = load i64, i64* %r4
%r36 = icmp slt i64 %r35, 0
%r37 = load i64, i64* %r5
%r38 = icmp ne i64 %r37, 8
%r39 = and i1 %r36, %r38
br i1 %r39, label %lab0, label %lab4

lab4:
%r40 = load i64, i64* %r4
%r41 = add i64 %r40, 1
%r42 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r41)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r43 = load i64, i64* %r0
ret i64 %r43

}

