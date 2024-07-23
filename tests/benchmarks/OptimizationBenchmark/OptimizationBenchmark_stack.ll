declare i8* @malloc(i64)
declare void @free(i8*)
declare i64 @printf(i8*, ...)
declare i64 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

@global1 = common global i64 0
@global2 = common global i64 0
@global3 = common global i64 0

define i64 @constantFolding() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = mul i64 8, 9
%r3 = sdiv i64 %r2, 4
%r4 = add i64 %r3, 2
%r5 = mul i64 5, 8
%r6 = sub i64 %r4, %r5
%r7 = add i64 %r6, 9
%r8 = sub i64 %r7, 12
%r9 = add i64 %r8, 6
%r10 = sub i64 %r9, 9
%r11 = sub i64 %r10, 18
%r12 = mul i64 23, 3
%r13 = sdiv i64 %r12, 23
%r14 = mul i64 %r13, 90
%r15 = add i64 %r11, %r14
store i64 %r15, i64* %r1
%r16 = load i64, i64* %r1
store i64 %r16, i64* %r0
br label %returnLabel

returnLabel:
%r17 = load i64, i64* %r0
ret i64 %r17

}

define i64 @constantPropagation() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca i64
%r7 = alloca i64
%r8 = alloca i64
%r9 = alloca i64
%r10 = alloca i64
%r11 = alloca i64
%r12 = alloca i64
%r13 = alloca i64
%r14 = alloca i64
%r15 = alloca i64
%r16 = alloca i64
%r17 = alloca i64
%r18 = alloca i64
%r19 = alloca i64
%r20 = alloca i64
%r21 = alloca i64
%r22 = alloca i64
%r23 = alloca i64
%r24 = alloca i64
%r25 = alloca i64
%r26 = alloca i64
store i64 4, i64* %r1
store i64 7, i64* %r2
store i64 8, i64* %r3
store i64 5, i64* %r4
store i64 11, i64* %r5
store i64 21, i64* %r6
%r27 = load i64, i64* %r1
%r28 = load i64, i64* %r2
%r29 = add i64 %r27, %r28
store i64 %r29, i64* %r7
%r30 = load i64, i64* %r3
%r31 = load i64, i64* %r4
%r32 = add i64 %r30, %r31
store i64 %r32, i64* %r8
%r33 = load i64, i64* %r5
%r34 = load i64, i64* %r6
%r35 = add i64 %r33, %r34
store i64 %r35, i64* %r9
%r36 = load i64, i64* %r7
%r37 = load i64, i64* %r8
%r38 = add i64 %r36, %r37
store i64 %r38, i64* %r10
%r39 = load i64, i64* %r9
%r40 = load i64, i64* %r10
%r41 = mul i64 %r39, %r40
store i64 %r41, i64* %r11
%r42 = load i64, i64* %r5
%r43 = load i64, i64* %r8
%r44 = load i64, i64* %r9
%r45 = mul i64 %r43, %r44
%r46 = add i64 %r42, %r45
%r47 = load i64, i64* %r11
%r48 = sub i64 %r46, %r47
store i64 %r48, i64* %r12
%r49 = load i64, i64* %r8
%r50 = load i64, i64* %r9
%r51 = load i64, i64* %r10
%r52 = mul i64 %r50, %r51
%r53 = sub i64 %r49, %r52
%r54 = load i64, i64* %r11
%r55 = load i64, i64* %r12
%r56 = sdiv i64 %r54, %r55
%r57 = add i64 %r53, %r56
store i64 %r57, i64* %r13
%r58 = load i64, i64* %r5
%r59 = load i64, i64* %r6
%r60 = add i64 %r58, %r59
%r61 = load i64, i64* %r7
%r62 = add i64 %r60, %r61
%r63 = load i64, i64* %r8
%r64 = add i64 %r62, %r63
%r65 = load i64, i64* %r9
%r66 = add i64 %r64, %r65
%r67 = load i64, i64* %r10
%r68 = sub i64 %r66, %r67
store i64 %r68, i64* %r14
%r69 = load i64, i64* %r14
%r70 = load i64, i64* %r13
%r71 = sub i64 %r69, %r70
%r72 = load i64, i64* %r8
%r73 = add i64 %r71, %r72
%r74 = load i64, i64* %r1
%r75 = sub i64 %r73, %r74
%r76 = load i64, i64* %r2
%r77 = sub i64 %r75, %r76
store i64 %r77, i64* %r15
%r78 = load i64, i64* %r11
%r79 = load i64, i64* %r12
%r80 = add i64 %r78, %r79
%r81 = load i64, i64* %r7
%r82 = sub i64 %r80, %r81
%r83 = load i64, i64* %r8
%r84 = sub i64 %r82, %r83
store i64 %r84, i64* %r16
%r85 = load i64, i64* %r2
%r86 = load i64, i64* %r1
%r87 = sub i64 %r85, %r86
%r88 = load i64, i64* %r4
%r89 = mul i64 %r87, %r88
%r90 = load i64, i64* %r9
%r91 = sub i64 %r89, %r90
store i64 %r91, i64* %r17
%r92 = load i64, i64* %r12
%r93 = load i64, i64* %r3
%r94 = mul i64 %r92, %r93
%r95 = load i64, i64* %r4
%r96 = mul i64 %r94, %r95
%r97 = load i64, i64* %r15
%r98 = add i64 %r96, %r97
store i64 %r98, i64* %r18
%r99 = load i64, i64* %r2
%r100 = load i64, i64* %r1
%r101 = mul i64 %r99, %r100
%r102 = load i64, i64* %r3
%r103 = mul i64 %r101, %r102
%r104 = load i64, i64* %r5
%r105 = sdiv i64 %r103, %r104
%r106 = load i64, i64* %r15
%r107 = sub i64 %r105, %r106
store i64 %r107, i64* %r19
%r108 = load i64, i64* %r9
%r109 = load i64, i64* %r11
%r110 = add i64 %r108, %r109
%r111 = load i64, i64* %r3
%r112 = add i64 %r110, %r111
%r113 = load i64, i64* %r16
%r114 = sub i64 %r112, %r113
store i64 %r114, i64* %r20
%r115 = load i64, i64* %r14
%r116 = load i64, i64* %r15
%r117 = add i64 %r115, %r116
%r118 = load i64, i64* %r6
%r119 = load i64, i64* %r1
%r120 = mul i64 %r118, %r119
%r121 = sub i64 %r117, %r120
store i64 %r121, i64* %r21
%r122 = load i64, i64* %r1
%r123 = load i64, i64* %r2
%r124 = mul i64 %r122, %r123
%r125 = load i64, i64* %r11
%r126 = sub i64 %r124, %r125
%r127 = load i64, i64* %r12
%r128 = sub i64 %r126, %r127
store i64 %r128, i64* %r22
%r129 = load i64, i64* %r22
%r130 = load i64, i64* %r19
%r131 = sub i64 %r129, %r130
%r132 = load i64, i64* %r18
%r133 = load i64, i64* %r4
%r134 = mul i64 %r132, %r133
%r135 = sub i64 %r131, %r134
store i64 %r135, i64* %r23
%r136 = load i64, i64* %r15
%r137 = load i64, i64* %r23
%r138 = sub i64 %r136, %r137
%r139 = load i64, i64* %r22
%r140 = sub i64 %r138, %r139
%r141 = load i64, i64* %r14
%r142 = sub i64 %r140, %r141
store i64 %r142, i64* %r24
%r143 = load i64, i64* %r16
%r144 = load i64, i64* %r24
%r145 = mul i64 %r143, %r144
%r146 = load i64, i64* %r20
%r147 = add i64 %r145, %r146
%r148 = load i64, i64* %r23
%r149 = sub i64 %r147, %r148
store i64 %r149, i64* %r25
%r150 = load i64, i64* %r23
%r151 = load i64, i64* %r24
%r152 = sub i64 %r150, %r151
%r153 = load i64, i64* %r25
%r154 = add i64 %r152, %r153
%r155 = load i64, i64* %r11
%r156 = add i64 %r154, %r155
store i64 %r156, i64* %r26
%r157 = load i64, i64* %r26
store i64 %r157, i64* %r0
br label %returnLabel

returnLabel:
%r158 = load i64, i64* %r0
ret i64 %r158

}

define i64 @deadCodeElimination() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
store i64 4, i64* %r1
store i64 5, i64* %r1
store i64 7, i64* %r1
store i64 8, i64* %r1
store i64 6, i64* %r2
store i64 9, i64* %r2
store i64 12, i64* %r2
store i64 8, i64* %r2
store i64 10, i64* %r3
store i64 13, i64* %r3
store i64 9, i64* %r3
store i64 45, i64* %r4
store i64 12, i64* %r4
store i64 3, i64* %r4
store i64 23, i64* %r5
store i64 10, i64* %r5
store i64 11, i64* @global1
store i64 5, i64* @global1
store i64 9, i64* @global1
%r6 = load i64, i64* %r1
%r7 = load i64, i64* %r2
%r8 = add i64 %r6, %r7
%r9 = load i64, i64* %r3
%r10 = add i64 %r8, %r9
%r11 = load i64, i64* %r4
%r12 = add i64 %r10, %r11
%r13 = load i64, i64* %r5
%r14 = add i64 %r12, %r13
store i64 %r14, i64* %r0
br label %returnLabel

returnLabel:
%r15 = load i64, i64* %r0
ret i64 %r15

}

define i64 @sum(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
store i64 %r0, i64* %r2
store i64 0, i64* %r3
%r4 = load i64, i64* %r2
%r5 = icmp sgt i64 %r4, 0
br i1 %r5, label %lab0, label %lab1

lab0:
%r6 = load i64, i64* %r3
%r7 = load i64, i64* %r2
%r8 = add i64 %r6, %r7
store i64 %r8, i64* %r3
%r9 = load i64, i64* %r2
%r10 = sub i64 %r9, 1
store i64 %r10, i64* %r2
%r11 = load i64, i64* %r2
%r12 = icmp sgt i64 %r11, 0
br i1 %r12, label %lab0, label %lab1

lab1:
%r13 = load i64, i64* %r3
store i64 %r13, i64* %r1
br label %returnLabel

returnLabel:
%r14 = load i64, i64* %r1
ret i64 %r14

}

define i64 @doesntModifyGlobals() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
store i64 1, i64* %r1
store i64 2, i64* %r2
%r3 = load i64, i64* %r1
%r4 = load i64, i64* %r2
%r5 = add i64 %r3, %r4
store i64 %r5, i64* %r0
br label %returnLabel

returnLabel:
%r6 = load i64, i64* %r0
ret i64 %r6

}

define i64 @interProceduralOptimization() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
store i64 1, i64* @global1
store i64 0, i64* @global2
store i64 0, i64* @global3
%r2 = call i64 @sum(i64 100)
store i64 %r2, i64* %r1
%r3 = load i64, i64* @global1
%r4 = icmp eq i64 %r3, 1
br i1 %r4, label %lab0, label %lab1

lab0:
%r5 = call i64 @sum(i64 10000)
store i64 %r5, i64* %r1
br label %lab8

lab1:
%r6 = load i64, i64* @global2
%r7 = icmp eq i64 %r6, 2
br i1 %r7, label %lab2, label %lab3

lab2:
%r8 = call i64 @sum(i64 20000)
store i64 %r8, i64* %r1
br label %lab4

lab3:
br label %lab4

lab4:
%r9 = load i64, i64* @global3
%r10 = icmp eq i64 %r9, 3
br i1 %r10, label %lab5, label %lab6

lab5:
%r11 = call i64 @sum(i64 30000)
store i64 %r11, i64* %r1
br label %lab7

lab6:
br label %lab7

lab7:
br label %lab8

lab8:
%r12 = load i64, i64* %r1
store i64 %r12, i64* %r0
br label %returnLabel

returnLabel:
%r13 = load i64, i64* %r0
ret i64 %r13

}

define i64 @commonSubexpressionElimination() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca i64
%r7 = alloca i64
%r8 = alloca i64
%r9 = alloca i64
%r10 = alloca i64
%r11 = alloca i64
%r12 = alloca i64
%r13 = alloca i64
%r14 = alloca i64
%r15 = alloca i64
%r16 = alloca i64
%r17 = alloca i64
%r18 = alloca i64
%r19 = alloca i64
%r20 = alloca i64
%r21 = alloca i64
%r22 = alloca i64
%r23 = alloca i64
%r24 = alloca i64
%r25 = alloca i64
%r26 = alloca i64
store i64 11, i64* %r1
store i64 22, i64* %r2
store i64 33, i64* %r3
store i64 44, i64* %r4
store i64 55, i64* %r5
store i64 66, i64* %r6
store i64 77, i64* %r7
%r27 = load i64, i64* %r1
%r28 = load i64, i64* %r2
%r29 = mul i64 %r27, %r28
store i64 %r29, i64* %r8
%r30 = load i64, i64* %r3
%r31 = load i64, i64* %r4
%r32 = sdiv i64 %r30, %r31
store i64 %r32, i64* %r9
%r33 = load i64, i64* %r5
%r34 = load i64, i64* %r6
%r35 = mul i64 %r33, %r34
store i64 %r35, i64* %r10
%r36 = load i64, i64* %r1
%r37 = load i64, i64* %r2
%r38 = mul i64 %r36, %r37
%r39 = load i64, i64* %r3
%r40 = load i64, i64* %r4
%r41 = sdiv i64 %r39, %r40
%r42 = add i64 %r38, %r41
%r43 = load i64, i64* %r5
%r44 = load i64, i64* %r6
%r45 = mul i64 %r43, %r44
%r46 = sub i64 %r42, %r45
%r47 = load i64, i64* %r7
%r48 = add i64 %r46, %r47
store i64 %r48, i64* %r11
%r49 = load i64, i64* %r1
%r50 = load i64, i64* %r2
%r51 = mul i64 %r49, %r50
%r52 = load i64, i64* %r3
%r53 = load i64, i64* %r4
%r54 = sdiv i64 %r52, %r53
%r55 = add i64 %r51, %r54
%r56 = load i64, i64* %r5
%r57 = load i64, i64* %r6
%r58 = mul i64 %r56, %r57
%r59 = sub i64 %r55, %r58
%r60 = load i64, i64* %r7
%r61 = add i64 %r59, %r60
store i64 %r61, i64* %r12
%r62 = load i64, i64* %r1
%r63 = load i64, i64* %r2
%r64 = mul i64 %r62, %r63
%r65 = load i64, i64* %r3
%r66 = load i64, i64* %r4
%r67 = sdiv i64 %r65, %r66
%r68 = add i64 %r64, %r67
%r69 = load i64, i64* %r5
%r70 = load i64, i64* %r6
%r71 = mul i64 %r69, %r70
%r72 = sub i64 %r68, %r71
%r73 = load i64, i64* %r7
%r74 = add i64 %r72, %r73
store i64 %r74, i64* %r13
%r75 = load i64, i64* %r1
%r76 = load i64, i64* %r2
%r77 = mul i64 %r75, %r76
%r78 = load i64, i64* %r3
%r79 = load i64, i64* %r4
%r80 = sdiv i64 %r78, %r79
%r81 = add i64 %r77, %r80
%r82 = load i64, i64* %r5
%r83 = load i64, i64* %r6
%r84 = mul i64 %r82, %r83
%r85 = sub i64 %r81, %r84
%r86 = load i64, i64* %r7
%r87 = add i64 %r85, %r86
store i64 %r87, i64* %r14
%r88 = load i64, i64* %r1
%r89 = load i64, i64* %r2
%r90 = mul i64 %r88, %r89
%r91 = load i64, i64* %r3
%r92 = load i64, i64* %r4
%r93 = sdiv i64 %r91, %r92
%r94 = add i64 %r90, %r93
%r95 = load i64, i64* %r5
%r96 = load i64, i64* %r6
%r97 = mul i64 %r95, %r96
%r98 = sub i64 %r94, %r97
%r99 = load i64, i64* %r7
%r100 = add i64 %r98, %r99
store i64 %r100, i64* %r15
%r101 = load i64, i64* %r1
%r102 = load i64, i64* %r2
%r103 = mul i64 %r101, %r102
%r104 = load i64, i64* %r3
%r105 = load i64, i64* %r4
%r106 = sdiv i64 %r104, %r105
%r107 = add i64 %r103, %r106
%r108 = load i64, i64* %r5
%r109 = load i64, i64* %r6
%r110 = mul i64 %r108, %r109
%r111 = sub i64 %r107, %r110
%r112 = load i64, i64* %r7
%r113 = add i64 %r111, %r112
store i64 %r113, i64* %r16
%r114 = load i64, i64* %r1
%r115 = load i64, i64* %r2
%r116 = mul i64 %r114, %r115
%r117 = load i64, i64* %r3
%r118 = load i64, i64* %r4
%r119 = sdiv i64 %r117, %r118
%r120 = add i64 %r116, %r119
%r121 = load i64, i64* %r5
%r122 = load i64, i64* %r6
%r123 = mul i64 %r121, %r122
%r124 = sub i64 %r120, %r123
%r125 = load i64, i64* %r7
%r126 = add i64 %r124, %r125
store i64 %r126, i64* %r17
%r127 = load i64, i64* %r1
%r128 = load i64, i64* %r2
%r129 = mul i64 %r127, %r128
%r130 = load i64, i64* %r3
%r131 = load i64, i64* %r4
%r132 = sdiv i64 %r130, %r131
%r133 = add i64 %r129, %r132
%r134 = load i64, i64* %r5
%r135 = load i64, i64* %r6
%r136 = mul i64 %r134, %r135
%r137 = sub i64 %r133, %r136
%r138 = load i64, i64* %r7
%r139 = add i64 %r137, %r138
store i64 %r139, i64* %r18
%r140 = load i64, i64* %r1
%r141 = load i64, i64* %r2
%r142 = mul i64 %r140, %r141
%r143 = load i64, i64* %r3
%r144 = load i64, i64* %r4
%r145 = sdiv i64 %r143, %r144
%r146 = add i64 %r142, %r145
%r147 = load i64, i64* %r5
%r148 = load i64, i64* %r6
%r149 = mul i64 %r147, %r148
%r150 = sub i64 %r146, %r149
%r151 = load i64, i64* %r7
%r152 = add i64 %r150, %r151
store i64 %r152, i64* %r19
%r153 = load i64, i64* %r1
%r154 = load i64, i64* %r2
%r155 = mul i64 %r153, %r154
%r156 = load i64, i64* %r3
%r157 = load i64, i64* %r4
%r158 = sdiv i64 %r156, %r157
%r159 = add i64 %r155, %r158
%r160 = load i64, i64* %r5
%r161 = load i64, i64* %r6
%r162 = mul i64 %r160, %r161
%r163 = sub i64 %r159, %r162
%r164 = load i64, i64* %r7
%r165 = add i64 %r163, %r164
store i64 %r165, i64* %r20
%r166 = load i64, i64* %r1
%r167 = load i64, i64* %r2
%r168 = mul i64 %r166, %r167
%r169 = load i64, i64* %r3
%r170 = load i64, i64* %r4
%r171 = sdiv i64 %r169, %r170
%r172 = add i64 %r168, %r171
%r173 = load i64, i64* %r5
%r174 = load i64, i64* %r6
%r175 = mul i64 %r173, %r174
%r176 = sub i64 %r172, %r175
%r177 = load i64, i64* %r7
%r178 = add i64 %r176, %r177
store i64 %r178, i64* %r21
%r179 = load i64, i64* %r2
%r180 = load i64, i64* %r1
%r181 = mul i64 %r179, %r180
%r182 = load i64, i64* %r3
%r183 = load i64, i64* %r4
%r184 = sdiv i64 %r182, %r183
%r185 = add i64 %r181, %r184
%r186 = load i64, i64* %r5
%r187 = load i64, i64* %r6
%r188 = mul i64 %r186, %r187
%r189 = sub i64 %r185, %r188
%r190 = load i64, i64* %r7
%r191 = add i64 %r189, %r190
store i64 %r191, i64* %r22
%r192 = load i64, i64* %r1
%r193 = load i64, i64* %r2
%r194 = mul i64 %r192, %r193
%r195 = load i64, i64* %r3
%r196 = load i64, i64* %r4
%r197 = sdiv i64 %r195, %r196
%r198 = add i64 %r194, %r197
%r199 = load i64, i64* %r6
%r200 = load i64, i64* %r5
%r201 = mul i64 %r199, %r200
%r202 = sub i64 %r198, %r201
%r203 = load i64, i64* %r7
%r204 = add i64 %r202, %r203
store i64 %r204, i64* %r23
%r205 = load i64, i64* %r7
%r206 = load i64, i64* %r1
%r207 = load i64, i64* %r2
%r208 = mul i64 %r206, %r207
%r209 = add i64 %r205, %r208
%r210 = load i64, i64* %r3
%r211 = load i64, i64* %r4
%r212 = sdiv i64 %r210, %r211
%r213 = add i64 %r209, %r212
%r214 = load i64, i64* %r5
%r215 = load i64, i64* %r6
%r216 = mul i64 %r214, %r215
%r217 = sub i64 %r213, %r216
store i64 %r217, i64* %r24
%r218 = load i64, i64* %r1
%r219 = load i64, i64* %r2
%r220 = mul i64 %r218, %r219
%r221 = load i64, i64* %r3
%r222 = load i64, i64* %r4
%r223 = sdiv i64 %r221, %r222
%r224 = add i64 %r220, %r223
%r225 = load i64, i64* %r5
%r226 = load i64, i64* %r6
%r227 = mul i64 %r225, %r226
%r228 = sub i64 %r224, %r227
%r229 = load i64, i64* %r7
%r230 = add i64 %r228, %r229
store i64 %r230, i64* %r25
%r231 = load i64, i64* %r3
%r232 = load i64, i64* %r4
%r233 = sdiv i64 %r231, %r232
%r234 = load i64, i64* %r1
%r235 = load i64, i64* %r2
%r236 = mul i64 %r234, %r235
%r237 = add i64 %r233, %r236
%r238 = load i64, i64* %r5
%r239 = load i64, i64* %r6
%r240 = mul i64 %r238, %r239
%r241 = sub i64 %r237, %r240
%r242 = load i64, i64* %r7
%r243 = add i64 %r241, %r242
store i64 %r243, i64* %r26
%r244 = load i64, i64* %r1
%r245 = load i64, i64* %r2
%r246 = add i64 %r244, %r245
%r247 = load i64, i64* %r3
%r248 = add i64 %r246, %r247
%r249 = load i64, i64* %r4
%r250 = add i64 %r248, %r249
%r251 = load i64, i64* %r5
%r252 = add i64 %r250, %r251
%r253 = load i64, i64* %r6
%r254 = add i64 %r252, %r253
%r255 = load i64, i64* %r7
%r256 = add i64 %r254, %r255
%r257 = load i64, i64* %r8
%r258 = add i64 %r256, %r257
%r259 = load i64, i64* %r9
%r260 = add i64 %r258, %r259
%r261 = load i64, i64* %r10
%r262 = add i64 %r260, %r261
%r263 = load i64, i64* %r11
%r264 = add i64 %r262, %r263
%r265 = load i64, i64* %r12
%r266 = add i64 %r264, %r265
%r267 = load i64, i64* %r13
%r268 = add i64 %r266, %r267
%r269 = load i64, i64* %r14
%r270 = add i64 %r268, %r269
%r271 = load i64, i64* %r15
%r272 = add i64 %r270, %r271
%r273 = load i64, i64* %r16
%r274 = add i64 %r272, %r273
%r275 = load i64, i64* %r17
%r276 = add i64 %r274, %r275
%r277 = load i64, i64* %r18
%r278 = add i64 %r276, %r277
%r279 = load i64, i64* %r19
%r280 = add i64 %r278, %r279
%r281 = load i64, i64* %r20
%r282 = add i64 %r280, %r281
%r283 = load i64, i64* %r21
%r284 = add i64 %r282, %r283
%r285 = load i64, i64* %r22
%r286 = add i64 %r284, %r285
%r287 = load i64, i64* %r23
%r288 = add i64 %r286, %r287
%r289 = load i64, i64* %r24
%r290 = add i64 %r288, %r289
%r291 = load i64, i64* %r25
%r292 = add i64 %r290, %r291
%r293 = load i64, i64* %r26
%r294 = add i64 %r292, %r293
store i64 %r294, i64* %r0
br label %returnLabel

returnLabel:
%r295 = load i64, i64* %r0
ret i64 %r295

}

define i64 @hoisting() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca i64
%r7 = alloca i64
%r8 = alloca i64
%r9 = alloca i64
store i64 1, i64* %r1
store i64 2, i64* %r2
store i64 3, i64* %r3
store i64 4, i64* %r4
store i64 0, i64* %r9
%r10 = load i64, i64* %r9
%r11 = icmp slt i64 %r10, 1000000
br i1 %r11, label %lab0, label %lab1

lab0:
store i64 5, i64* %r5
%r12 = load i64, i64* %r1
%r13 = load i64, i64* %r2
%r14 = add i64 %r12, %r13
%r15 = load i64, i64* %r3
%r16 = add i64 %r14, %r15
store i64 %r16, i64* %r7
%r17 = load i64, i64* %r3
%r18 = load i64, i64* %r4
%r19 = add i64 %r17, %r18
%r20 = load i64, i64* %r7
%r21 = add i64 %r19, %r20
store i64 %r21, i64* %r8
%r22 = load i64, i64* %r9
%r23 = add i64 %r22, 1
store i64 %r23, i64* %r9
%r24 = load i64, i64* %r9
%r25 = icmp slt i64 %r24, 1000000
br i1 %r25, label %lab0, label %lab1

lab1:
%r26 = load i64, i64* %r2
store i64 %r26, i64* %r0
br label %returnLabel

returnLabel:
%r27 = load i64, i64* %r0
ret i64 %r27

}

define i64 @doubleIf() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
store i64 1, i64* %r1
store i64 2, i64* %r2
store i64 3, i64* %r3
store i64 0, i64* %r4
%r5 = load i64, i64* %r1
%r6 = icmp eq i64 %r5, 1
br i1 %r6, label %lab0, label %lab4

lab0:
store i64 20, i64* %r2
%r7 = load i64, i64* %r1
%r8 = icmp eq i64 %r7, 1
br i1 %r8, label %lab1, label %lab2

lab1:
store i64 200, i64* %r2
store i64 300, i64* %r3
br label %lab3

lab2:
store i64 1, i64* %r1
store i64 2, i64* %r2
store i64 3, i64* %r3
br label %lab3

lab3:
store i64 50, i64* %r4
br label %lab5

lab4:
br label %lab5

lab5:
%r9 = load i64, i64* %r4
store i64 %r9, i64* %r0
br label %returnLabel

returnLabel:
%r10 = load i64, i64* %r0
ret i64 %r10

}

define i64 @integerDivide() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
store i64 3000, i64* %r1
%r2 = load i64, i64* %r1
%r3 = sdiv i64 %r2, 2
store i64 %r3, i64* %r1
%r4 = load i64, i64* %r1
%r5 = mul i64 %r4, 4
store i64 %r5, i64* %r1
%r6 = load i64, i64* %r1
%r7 = sdiv i64 %r6, 8
store i64 %r7, i64* %r1
%r8 = load i64, i64* %r1
%r9 = sdiv i64 %r8, 16
store i64 %r9, i64* %r1
%r10 = load i64, i64* %r1
%r11 = mul i64 %r10, 32
store i64 %r11, i64* %r1
%r12 = load i64, i64* %r1
%r13 = sdiv i64 %r12, 64
store i64 %r13, i64* %r1
%r14 = load i64, i64* %r1
%r15 = mul i64 %r14, 128
store i64 %r15, i64* %r1
%r16 = load i64, i64* %r1
%r17 = sdiv i64 %r16, 4
store i64 %r17, i64* %r1
%r18 = load i64, i64* %r1
store i64 %r18, i64* %r0
br label %returnLabel

returnLabel:
%r19 = load i64, i64* %r0
ret i64 %r19

}

define i64 @association() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
store i64 10, i64* %r1
%r2 = load i64, i64* %r1
%r3 = mul i64 %r2, 2
store i64 %r3, i64* %r1
%r4 = load i64, i64* %r1
%r5 = sdiv i64 %r4, 2
store i64 %r5, i64* %r1
%r6 = load i64, i64* %r1
%r7 = mul i64 3, %r6
store i64 %r7, i64* %r1
%r8 = load i64, i64* %r1
%r9 = sdiv i64 %r8, 3
store i64 %r9, i64* %r1
%r10 = load i64, i64* %r1
%r11 = mul i64 %r10, 4
store i64 %r11, i64* %r1
%r12 = load i64, i64* %r1
%r13 = sdiv i64 %r12, 4
store i64 %r13, i64* %r1
%r14 = load i64, i64* %r1
%r15 = add i64 %r14, 4
store i64 %r15, i64* %r1
%r16 = load i64, i64* %r1
%r17 = sub i64 %r16, 4
store i64 %r17, i64* %r1
%r18 = load i64, i64* %r1
%r19 = mul i64 %r18, 50
store i64 %r19, i64* %r1
%r20 = load i64, i64* %r1
%r21 = sdiv i64 %r20, 50
store i64 %r21, i64* %r1
%r22 = load i64, i64* %r1
store i64 %r22, i64* %r0
br label %returnLabel

returnLabel:
%r23 = load i64, i64* %r0
ret i64 %r23

}

define i64 @tailRecursionHelper(i64 %r0, i64 %r1) {
prologue:
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
store i64 %r0, i64* %r3
store i64 %r1, i64* %r4
%r5 = load i64, i64* %r3
%r6 = icmp eq i64 %r5, 0
br i1 %r6, label %lab0, label %lab1

lab0:
%r7 = load i64, i64* %r4
store i64 %r7, i64* %r2
br label %returnLabel

lab1:
%r8 = load i64, i64* %r3
%r9 = sub i64 %r8, 1
%r10 = load i64, i64* %r4
%r11 = load i64, i64* %r3
%r12 = add i64 %r10, %r11
%r13 = call i64 @tailRecursionHelper(i64 %r9, i64 %r12)
store i64 %r13, i64* %r2
br label %returnLabel

returnLabel:
%r14 = load i64, i64* %r2
ret i64 %r14

}

define i64 @tailRecursion(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
store i64 %r0, i64* %r2
%r3 = load i64, i64* %r2
%r4 = call i64 @tailRecursionHelper(i64 %r3, i64 0)
store i64 %r4, i64* %r1
br label %returnLabel

returnLabel:
%r5 = load i64, i64* %r1
ret i64 %r5

}

define i64 @unswitching() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
store i64 1, i64* %r1
store i64 2, i64* %r2
%r3 = load i64, i64* %r1
%r4 = icmp slt i64 %r3, 1000000
br i1 %r4, label %lab0, label %lab4

lab0:
%r5 = load i64, i64* %r2
%r6 = icmp eq i64 %r5, 2
br i1 %r6, label %lab1, label %lab2

lab1:
%r7 = load i64, i64* %r1
%r8 = add i64 %r7, 1
store i64 %r8, i64* %r1
br label %lab3

lab2:
%r9 = load i64, i64* %r1
%r10 = add i64 %r9, 2
store i64 %r10, i64* %r1
br label %lab3

lab3:
%r11 = load i64, i64* %r1
%r12 = icmp slt i64 %r11, 1000000
br i1 %r12, label %lab0, label %lab4

lab4:
%r13 = load i64, i64* %r1
store i64 %r13, i64* %r0
br label %returnLabel

returnLabel:
%r14 = load i64, i64* %r0
ret i64 %r14

}

define i64 @randomCalculation(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca i64
%r7 = alloca i64
%r8 = alloca i64
%r9 = alloca i64
store i64 %r0, i64* %r2
store i64 0, i64* %r8
store i64 0, i64* %r9
%r10 = load i64, i64* %r8
%r11 = load i64, i64* %r2
%r12 = icmp slt i64 %r10, %r11
br i1 %r12, label %lab0, label %lab1

lab0:
store i64 4, i64* %r3
store i64 7, i64* %r4
store i64 8, i64* %r5
%r13 = load i64, i64* %r3
%r14 = load i64, i64* %r4
%r15 = add i64 %r13, %r14
store i64 %r15, i64* %r6
%r16 = load i64, i64* %r6
%r17 = load i64, i64* %r5
%r18 = add i64 %r16, %r17
store i64 %r18, i64* %r7
%r19 = load i64, i64* %r9
%r20 = load i64, i64* %r7
%r21 = add i64 %r19, %r20
store i64 %r21, i64* %r9
%r22 = load i64, i64* %r8
%r23 = mul i64 %r22, 2
store i64 %r23, i64* %r8
%r24 = load i64, i64* %r8
%r25 = sdiv i64 %r24, 2
store i64 %r25, i64* %r8
%r26 = load i64, i64* %r8
%r27 = mul i64 3, %r26
store i64 %r27, i64* %r8
%r28 = load i64, i64* %r8
%r29 = sdiv i64 %r28, 3
store i64 %r29, i64* %r8
%r30 = load i64, i64* %r8
%r31 = mul i64 %r30, 4
store i64 %r31, i64* %r8
%r32 = load i64, i64* %r8
%r33 = sdiv i64 %r32, 4
store i64 %r33, i64* %r8
%r34 = load i64, i64* %r8
%r35 = add i64 %r34, 1
store i64 %r35, i64* %r8
%r36 = load i64, i64* %r8
%r37 = load i64, i64* %r2
%r38 = icmp slt i64 %r36, %r37
br i1 %r38, label %lab0, label %lab1

lab1:
%r39 = load i64, i64* %r9
store i64 %r39, i64* %r1
br label %returnLabel

returnLabel:
%r40 = load i64, i64* %r1
ret i64 %r40

}

define i64 @iterativeFibonacci(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = alloca i64
%r5 = alloca i64
%r6 = alloca i64
%r7 = alloca i64
store i64 %r0, i64* %r2
%r8 = sub i64 0, 1
store i64 %r8, i64* %r3
store i64 1, i64* %r4
store i64 0, i64* %r6
%r9 = load i64, i64* %r6
%r10 = load i64, i64* %r2
%r11 = icmp slt i64 %r9, %r10
br i1 %r11, label %lab0, label %lab1

lab0:
%r12 = load i64, i64* %r4
%r13 = load i64, i64* %r3
%r14 = add i64 %r12, %r13
store i64 %r14, i64* %r7
%r15 = load i64, i64* %r4
store i64 %r15, i64* %r3
%r16 = load i64, i64* %r7
store i64 %r16, i64* %r4
%r17 = load i64, i64* %r6
%r18 = add i64 %r17, 1
store i64 %r18, i64* %r6
%r19 = load i64, i64* %r6
%r20 = load i64, i64* %r2
%r21 = icmp slt i64 %r19, %r20
br i1 %r21, label %lab0, label %lab1

lab1:
%r22 = load i64, i64* %r4
store i64 %r22, i64* %r1
br label %returnLabel

returnLabel:
%r23 = load i64, i64* %r1
ret i64 %r23

}

define i64 @recursiveFibonacci(i64 %r0) {
prologue:
%r1 = alloca i64
%r2 = alloca i64
store i64 %r0, i64* %r2
%r3 = load i64, i64* %r2
%r4 = icmp sle i64 %r3, 0
%r5 = load i64, i64* %r2
%r6 = icmp eq i64 %r5, 1
%r7 = or i1 %r4, %r6
br i1 %r7, label %lab0, label %lab1

lab0:
%r8 = load i64, i64* %r2
store i64 %r8, i64* %r1
br label %returnLabel

lab1:
%r9 = load i64, i64* %r2
%r10 = sub i64 %r9, 1
%r11 = call i64 @recursiveFibonacci(i64 %r10)
%r12 = load i64, i64* %r2
%r13 = sub i64 %r12, 2
%r14 = call i64 @recursiveFibonacci(i64 %r13)
%r15 = add i64 %r11, %r14
store i64 %r15, i64* %r1
br label %returnLabel

returnLabel:
%r16 = load i64, i64* %r1
ret i64 %r16

}

define i64 @main() {
prologue:
%r0 = alloca i64
%r1 = alloca i64
%r2 = alloca i64
%r3 = alloca i64
%r4 = call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i64 0, i64 0), i64* @.read_scratch)
%r5 = load i64, i64* @.read_scratch
store i64 %r5, i64* %r1
store i64 1, i64* %r3
%r6 = load i64, i64* %r3
%r7 = load i64, i64* %r1
%r8 = icmp slt i64 %r6, %r7
br i1 %r8, label %lab0, label %lab1

lab0:
%r9 = call i64 @constantFolding()
store i64 %r9, i64* %r2
%r10 = load i64, i64* %r2
%r11 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r10)
%r12 = call i64 @constantPropagation()
store i64 %r12, i64* %r2
%r13 = load i64, i64* %r2
%r14 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r13)
%r15 = call i64 @deadCodeElimination()
store i64 %r15, i64* %r2
%r16 = load i64, i64* %r2
%r17 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r16)
%r18 = call i64 @interProceduralOptimization()
store i64 %r18, i64* %r2
%r19 = load i64, i64* %r2
%r20 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r19)
%r21 = call i64 @commonSubexpressionElimination()
store i64 %r21, i64* %r2
%r22 = load i64, i64* %r2
%r23 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r22)
%r24 = call i64 @hoisting()
store i64 %r24, i64* %r2
%r25 = load i64, i64* %r2
%r26 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r25)
%r27 = call i64 @doubleIf()
store i64 %r27, i64* %r2
%r28 = load i64, i64* %r2
%r29 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r28)
%r30 = call i64 @integerDivide()
store i64 %r30, i64* %r2
%r31 = load i64, i64* %r2
%r32 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r31)
%r33 = call i64 @association()
store i64 %r33, i64* %r2
%r34 = load i64, i64* %r2
%r35 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r34)
%r36 = load i64, i64* %r1
%r37 = sdiv i64 %r36, 1000
%r38 = call i64 @tailRecursion(i64 %r37)
store i64 %r38, i64* %r2
%r39 = load i64, i64* %r2
%r40 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r39)
%r41 = call i64 @unswitching()
store i64 %r41, i64* %r2
%r42 = load i64, i64* %r2
%r43 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r42)
%r44 = load i64, i64* %r1
%r45 = call i64 @randomCalculation(i64 %r44)
store i64 %r45, i64* %r2
%r46 = load i64, i64* %r2
%r47 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r46)
%r48 = load i64, i64* %r1
%r49 = sdiv i64 %r48, 5
%r50 = call i64 @iterativeFibonacci(i64 %r49)
store i64 %r50, i64* %r2
%r51 = load i64, i64* %r2
%r52 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r51)
%r53 = load i64, i64* %r1
%r54 = sdiv i64 %r53, 1000
%r55 = call i64 @recursiveFibonacci(i64 %r54)
store i64 %r55, i64* %r2
%r56 = load i64, i64* %r2
%r57 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %r56)
%r58 = load i64, i64* %r3
%r59 = add i64 %r58, 1
store i64 %r59, i64* %r3
%r60 = load i64, i64* %r3
%r61 = load i64, i64* %r1
%r62 = icmp slt i64 %r60, %r61
br i1 %r62, label %lab0, label %lab1

lab1:
%r63 = call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 9999)
store i64 0, i64* %r0
br label %returnLabel

returnLabel:
%r64 = load i64, i64* %r0
ret i64 %r64

}

