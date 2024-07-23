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
%r1 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 0
store i64 0, i64* %r1
%r2 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 1
store i64 0, i64* %r2
%r3 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 2
store i64 0, i64* %r3
%r4 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 3
store i64 0, i64* %r4
%r5 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 4
store i64 0, i64* %r5
%r6 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 5
store i64 0, i64* %r6
%r7 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 6
store i64 0, i64* %r7
%r8 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 7
store i64 0, i64* %r8
%r9 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 8
store i64 0, i64* %r9
ret void

}

define void @printBoard(%struct.gameBoard* %r0) {
prologue:
%r1 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 0
%r2 = load i64, i64* %r1
%r3 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r2)
%r4 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 1
%r5 = load i64, i64* %r4
%r6 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r5)
%r7 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 2
%r8 = load i64, i64* %r7
%r9 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r8)
%r10 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 3
%r11 = load i64, i64* %r10
%r12 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r11)
%r13 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 4
%r14 = load i64, i64* %r13
%r15 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r14)
%r16 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 5
%r17 = load i64, i64* %r16
%r18 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r17)
%r19 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 6
%r20 = load i64, i64* %r19
%r21 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r20)
%r22 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 7
%r23 = load i64, i64* %r22
%r24 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %r23)
%r25 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 8
%r26 = load i64, i64* %r25
%r27 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r26)
ret void

}

define void @printMoveBoard() {
prologue:
%r0 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 123)
%r1 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 456)
%r2 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 789)
ret void

}

define void @placePiece(%struct.gameBoard* %r0, i64 %r1, i64 %r2) {
prologue:
%r3 = icmp eq i64 %r2, 1
br i1 %r3, label %lab0, label %lab1

lab0:
%r5 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 0
store i64 %r1, i64* %r5
br label %returnLabel

lab1:
%r8 = icmp eq i64 %r2, 2
br i1 %r8, label %lab2, label %lab3

lab2:
%r10 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 1
store i64 %r1, i64* %r10
br label %returnLabel

lab3:
%r13 = icmp eq i64 %r2, 3
br i1 %r13, label %lab4, label %lab5

lab4:
%r15 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 2
store i64 %r1, i64* %r15
br label %returnLabel

lab5:
%r18 = icmp eq i64 %r2, 4
br i1 %r18, label %lab6, label %lab7

lab6:
%r20 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 3
store i64 %r1, i64* %r20
br label %returnLabel

lab7:
%r23 = icmp eq i64 %r2, 5
br i1 %r23, label %lab8, label %lab9

lab8:
%r25 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 4
store i64 %r1, i64* %r25
br label %returnLabel

lab9:
%r28 = icmp eq i64 %r2, 6
br i1 %r28, label %lab10, label %lab11

lab10:
%r30 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 5
store i64 %r1, i64* %r30
br label %returnLabel

lab11:
%r33 = icmp eq i64 %r2, 7
br i1 %r33, label %lab12, label %lab13

lab12:
%r35 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 6
store i64 %r1, i64* %r35
br label %returnLabel

lab13:
%r38 = icmp eq i64 %r2, 8
br i1 %r38, label %lab14, label %lab15

lab14:
%r40 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 7
store i64 %r1, i64* %r40
br label %returnLabel

lab15:
%r43 = icmp eq i64 %r2, 9
br i1 %r43, label %lab16, label %returnLabel

lab16:
%r45 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 8
store i64 %r1, i64* %r45
br label %returnLabel

returnLabel:
ret void

}

define i64 @checkWinner(%struct.gameBoard* %r0) {
prologue:
%r1 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 0
%r2 = load i64, i64* %r1
%r3 = icmp eq i64 %r2, 1
br i1 %r3, label %lab0, label %lab8

lab0:
%r5 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 1
%r6 = load i64, i64* %r5
%r7 = icmp eq i64 %r6, 1
br i1 %r7, label %lab1, label %lab8

lab1:
%r9 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r0, i32 0, i32 2
%r10 = load i64, i64* %r9
%r11 = icmp eq i64 %r10, 1
br i1 %r11, label %returnLabel, label %lab8

lab8:
%r12 = phi %struct.gameBoard* [%r0, %lab1], [%r0, %lab0], [%r0, %prologue]
%r13 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r12, i32 0, i32 0
%r14 = load i64, i64* %r13
%r15 = icmp eq i64 %r14, 2
br i1 %r15, label %lab9, label %lab17

lab9:
%r17 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r12, i32 0, i32 1
%r18 = load i64, i64* %r17
%r19 = icmp eq i64 %r18, 2
br i1 %r19, label %lab10, label %lab17

lab10:
%r21 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r12, i32 0, i32 2
%r22 = load i64, i64* %r21
%r23 = icmp eq i64 %r22, 2
br i1 %r23, label %returnLabel, label %lab17

lab17:
%r24 = phi %struct.gameBoard* [%r12, %lab10], [%r12, %lab9], [%r12, %lab8]
%r25 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r24, i32 0, i32 3
%r26 = load i64, i64* %r25
%r27 = icmp eq i64 %r26, 1
br i1 %r27, label %lab18, label %lab26

lab18:
%r29 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r24, i32 0, i32 4
%r30 = load i64, i64* %r29
%r31 = icmp eq i64 %r30, 1
br i1 %r31, label %lab19, label %lab26

lab19:
%r33 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r24, i32 0, i32 5
%r34 = load i64, i64* %r33
%r35 = icmp eq i64 %r34, 1
br i1 %r35, label %returnLabel, label %lab26

lab26:
%r36 = phi %struct.gameBoard* [%r24, %lab19], [%r24, %lab18], [%r24, %lab17]
%r37 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r36, i32 0, i32 3
%r38 = load i64, i64* %r37
%r39 = icmp eq i64 %r38, 2
br i1 %r39, label %lab27, label %lab35

lab27:
%r41 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r36, i32 0, i32 4
%r42 = load i64, i64* %r41
%r43 = icmp eq i64 %r42, 2
br i1 %r43, label %lab28, label %lab35

lab28:
%r45 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r36, i32 0, i32 5
%r46 = load i64, i64* %r45
%r47 = icmp eq i64 %r46, 2
br i1 %r47, label %returnLabel, label %lab35

lab35:
%r48 = phi %struct.gameBoard* [%r36, %lab28], [%r36, %lab27], [%r36, %lab26]
%r49 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r48, i32 0, i32 6
%r50 = load i64, i64* %r49
%r51 = icmp eq i64 %r50, 1
br i1 %r51, label %lab36, label %lab44

lab36:
%r53 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r48, i32 0, i32 7
%r54 = load i64, i64* %r53
%r55 = icmp eq i64 %r54, 1
br i1 %r55, label %lab37, label %lab44

lab37:
%r57 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r48, i32 0, i32 8
%r58 = load i64, i64* %r57
%r59 = icmp eq i64 %r58, 1
br i1 %r59, label %returnLabel, label %lab44

lab44:
%r60 = phi %struct.gameBoard* [%r48, %lab37], [%r48, %lab36], [%r48, %lab35]
%r61 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r60, i32 0, i32 6
%r62 = load i64, i64* %r61
%r63 = icmp eq i64 %r62, 2
br i1 %r63, label %lab45, label %lab53

lab45:
%r65 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r60, i32 0, i32 7
%r66 = load i64, i64* %r65
%r67 = icmp eq i64 %r66, 2
br i1 %r67, label %lab46, label %lab53

lab46:
%r69 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r60, i32 0, i32 8
%r70 = load i64, i64* %r69
%r71 = icmp eq i64 %r70, 2
br i1 %r71, label %returnLabel, label %lab53

lab53:
%r72 = phi %struct.gameBoard* [%r60, %lab46], [%r60, %lab45], [%r60, %lab44]
%r73 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r72, i32 0, i32 0
%r74 = load i64, i64* %r73
%r75 = icmp eq i64 %r74, 1
br i1 %r75, label %lab54, label %lab62

lab54:
%r77 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r72, i32 0, i32 3
%r78 = load i64, i64* %r77
%r79 = icmp eq i64 %r78, 1
br i1 %r79, label %lab55, label %lab62

lab55:
%r81 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r72, i32 0, i32 6
%r82 = load i64, i64* %r81
%r83 = icmp eq i64 %r82, 1
br i1 %r83, label %returnLabel, label %lab62

lab62:
%r84 = phi %struct.gameBoard* [%r72, %lab55], [%r72, %lab54], [%r72, %lab53]
%r85 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r84, i32 0, i32 0
%r86 = load i64, i64* %r85
%r87 = icmp eq i64 %r86, 2
br i1 %r87, label %lab63, label %lab71

lab63:
%r89 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r84, i32 0, i32 3
%r90 = load i64, i64* %r89
%r91 = icmp eq i64 %r90, 2
br i1 %r91, label %lab64, label %lab71

lab64:
%r93 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r84, i32 0, i32 6
%r94 = load i64, i64* %r93
%r95 = icmp eq i64 %r94, 2
br i1 %r95, label %returnLabel, label %lab71

lab71:
%r96 = phi %struct.gameBoard* [%r84, %lab64], [%r84, %lab63], [%r84, %lab62]
%r97 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r96, i32 0, i32 1
%r98 = load i64, i64* %r97
%r99 = icmp eq i64 %r98, 1
br i1 %r99, label %lab72, label %lab80

lab72:
%r101 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r96, i32 0, i32 4
%r102 = load i64, i64* %r101
%r103 = icmp eq i64 %r102, 1
br i1 %r103, label %lab73, label %lab80

lab73:
%r105 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r96, i32 0, i32 7
%r106 = load i64, i64* %r105
%r107 = icmp eq i64 %r106, 1
br i1 %r107, label %returnLabel, label %lab80

lab80:
%r108 = phi %struct.gameBoard* [%r96, %lab73], [%r96, %lab72], [%r96, %lab71]
%r109 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r108, i32 0, i32 1
%r110 = load i64, i64* %r109
%r111 = icmp eq i64 %r110, 2
br i1 %r111, label %lab81, label %lab89

lab81:
%r113 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r108, i32 0, i32 4
%r114 = load i64, i64* %r113
%r115 = icmp eq i64 %r114, 2
br i1 %r115, label %lab82, label %lab89

lab82:
%r117 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r108, i32 0, i32 7
%r118 = load i64, i64* %r117
%r119 = icmp eq i64 %r118, 2
br i1 %r119, label %returnLabel, label %lab89

lab89:
%r120 = phi %struct.gameBoard* [%r108, %lab82], [%r108, %lab81], [%r108, %lab80]
%r121 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r120, i32 0, i32 2
%r122 = load i64, i64* %r121
%r123 = icmp eq i64 %r122, 1
br i1 %r123, label %lab90, label %lab98

lab90:
%r125 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r120, i32 0, i32 5
%r126 = load i64, i64* %r125
%r127 = icmp eq i64 %r126, 1
br i1 %r127, label %lab91, label %lab98

lab91:
%r129 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r120, i32 0, i32 8
%r130 = load i64, i64* %r129
%r131 = icmp eq i64 %r130, 1
br i1 %r131, label %returnLabel, label %lab98

lab98:
%r132 = phi %struct.gameBoard* [%r120, %lab91], [%r120, %lab90], [%r120, %lab89]
%r133 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r132, i32 0, i32 2
%r134 = load i64, i64* %r133
%r135 = icmp eq i64 %r134, 2
br i1 %r135, label %lab99, label %returnLabel

lab99:
%r137 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r132, i32 0, i32 5
%r138 = load i64, i64* %r137
%r139 = icmp eq i64 %r138, 2
br i1 %r139, label %lab100, label %returnLabel

lab100:
%r141 = getelementptr inbounds %struct.gameBoard, %struct.gameBoard* %r132, i32 0, i32 8
%r142 = load i64, i64* %r141
%r143 = icmp eq i64 %r142, 2
%r146 = select i1 %r143, i64 1, i64 -1
br label %returnLabel

returnLabel:
%r145 = phi i64 [0, %lab1], [1, %lab10], [0, %lab19], [1, %lab28], [0, %lab37], [1, %lab46], [0, %lab55], [1, %lab64], [0, %lab73], [1, %lab82], [0, %lab91], [-1, %lab99], [-1, %lab98], [%r146, %lab100]
ret i64 %r145

}

define i64 @main() {
prologue:
%r1 = call i8* @malloc(i64 72)
%r2 = bitcast i8* %r1 to %struct.gameBoard*
call void @cleanBoard(%struct.gameBoard* %r2)
br i1 true, label %lab0, label %returnLabel

lab0:
%r7 = phi i64 [0, %prologue], [%r29, %lab3]
%r9 = phi i64 [0, %prologue], [%r24, %lab3]
%r11 = phi %struct.gameBoard* [%r2, %prologue], [%r25, %lab3]
call void @printBoard(%struct.gameBoard* %r11)
%r12 = icmp eq i64 %r9, 0
br i1 %r12, label %lab1, label %lab2

lab1:
%r14 = add i64 %r9, 1
%r15 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r16 = load i64, i64* @.read_scratch
call void @placePiece(%struct.gameBoard* %r11, i64 1, i64 %r16)
br label %lab3

lab2:
%r19 = sub i64 %r9, 1
%r20 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r21 = load i64, i64* @.read_scratch
call void @placePiece(%struct.gameBoard* %r11, i64 2, i64 %r21)
br label %lab3

lab3:
%r24 = phi i64 [%r14, %lab1], [%r19, %lab2]
%r25 = phi %struct.gameBoard* [%r11, %lab1], [%r11, %lab2]
%r28 = phi i64 [%r7, %lab1], [%r7, %lab2]
%r27 = call i64 @checkWinner(%struct.gameBoard* %r25)
%r29 = add i64 %r28, 1
%r30 = icmp slt i64 %r27, 0
%r31 = icmp ne i64 %r29, 8
%r32 = and i1 %r30, %r31
br i1 %r32, label %lab0, label %returnLabel

returnLabel:
%r33 = phi i64 [-1, %prologue], [%r27, %lab3]
%r39 = add i64 %r33, 1
%r40 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r39)
ret i64 0

}

