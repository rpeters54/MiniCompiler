isqrt.prologue:
CMP 1, %r0
CSET %r1, le
CMP %r1, 0
MOV %r3, 1
MOV %r4, 3
MOV %r10, 3
bne lab0:
b returnLabel:

inter.isqrt.lab0:
MOV %r3, %r5
MOV %r4, %r6
b isqrt.lab0:

isqrt.lab0:
%r3 = phi i64 [1, %isqrt.prologue], [%r5, %inter.isqrt.lab0]
%r4 = phi i64 [3, %isqrt.prologue], [%r6, %inter.isqrt.lab0]
ADD %r5, %r3, %r4
ADD %r6, %r4, 2
CMP %r5, %r0
CSET %r7, le
CMP %r7, 0
MOV %r10, %r6
b inter.isqrt.lab0:
bne lab0:

isqrt.returnLabel:
%r10 = phi i64 [3, %isqrt.prologue], [%r6, %isqrt.lab0]
SDIV %r11, %r10, 2
SUB %r12, %r11, 1
ret %r12

prime.prologue:
CMP %r0, 2
CSET %r1, lt
CMP %r1, 0
MOV %r19, false
b lab1:
bne returnLabel:

prime.lab1:
MOV %x0, %r0
bl isqrt
MOV %r3, %x0
CMP 2, %r3
CSET %r4, le
CMP %r4, 0
MOV %r6, 2
MOV %r19, false
bne lab2:
b returnLabel:

inter.prime.lab2:
MOV %r6, %r13
b prime.lab2:

prime.lab2:
%r6 = phi i64 [2, %prime.lab1], [%r13, %inter.prime.lab2]
SDIV %r8, %r0, %r6
MUL %r9, %r8, %r6
SUB %r10, %r0, %r9
CMP %r10, 0
CSET %r11, eq
CMP %r11, 0
MOV %r19, true
b lab5:
bne returnLabel:

prime.lab5:
ADD %r13, %r6, 1
CMP %r13, %r3
CSET %r15, le
CMP %r15, 0
MOV %r19, true
b inter.prime.lab2:
bne lab2:

prime.returnLabel:
%r19 = phi i1 [false, %prime.prologue], [false, %prime.lab1], [true, %prime.lab2], [true, %prime.lab5]
ret %r19

main.prologue:
MOV %x0, read
MOV %x1, read_scratch
bl scanf
MOV %r0, %x0
ldr %r1, [read_scratch]
CMP 0, %r1
CSET %r2, le
CMP %r2, 0
MOV %r3, 0
b returnLabel:
bne lab0:

inter.main.lab0:
MOV %r3, %r9
b main.lab0:

main.lab0:
%r3 = phi i64 [0, %main.prologue], [%r9, %inter.main.lab0]
MOV %x0, %r3
bl prime
MOV %r5, %x0
CMP %r5, 0
MOV %r8, %r3
MOV %r10, %r1
b lab3:
bne lab1:

main.lab1:
MOV %x0, println
MOV %x1, %r3
bl printf
MOV %r7, %x0
MOV %r8, %r3
MOV %r10, %r1
b lab3:

main.lab3:
%r8 = phi i64 [%r3, %main.lab0], [%r3, %main.lab1]
%r10 = phi i64 [%r1, %main.lab0], [%r1, %main.lab1]
ADD %r9, %r8, 1
CMP %r9, %r10
CSET %r11, le
CMP %r11, 0
bne lab0:
b inter.main.lab0:

main.returnLabel:
ret 0

