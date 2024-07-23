	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0
	.syntax unified
	.globl	_cleanBoard                     @ -- Begin function cleanBoard
	.p2align	2
	.code	32                              @ @cleanBoard
_cleanBoard:
@ %bb.0:                                @ %returnLabel
	mov	r1, #0
	str	r1, [r0, #64]
	str	r1, [r0, #68]
	str	r1, [r0, #32]
	str	r1, [r0, #36]
	str	r1, [r0, #40]
	str	r1, [r0, #44]
	str	r1, [r0, #48]
	str	r1, [r0, #52]
	str	r1, [r0, #56]
	str	r1, [r0, #60]
	str	r1, [r0]
	str	r1, [r0, #4]
	str	r1, [r0, #8]
	str	r1, [r0, #12]
	str	r1, [r0, #16]
	str	r1, [r0, #20]
	str	r1, [r0, #24]
	str	r1, [r0, #28]
	mov	pc, lr
                                        @ -- End function
	.globl	_printBoard                     @ -- Begin function printBoard
	.p2align	2
	.code	32                              @ @printBoard
_printBoard:
@ %bb.0:                                @ %returnLabel
	push	{r4, r5, r6, lr}
	ldm	r0, {r1, r2}
	mov	r4, r0
	ldr	r5, LCPI1_0
LPC1_0:
	add	r5, pc, r5
	mov	r0, r5
	bl	_printf
	ldr	r1, [r4, #8]
	mov	r0, r5
	ldr	r2, [r4, #12]
	bl	_printf
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #20]
	ldr	r6, LCPI1_1
LPC1_1:
	add	r6, pc, r6
	mov	r0, r6
	bl	_printf
	ldr	r1, [r4, #24]
	mov	r0, r5
	ldr	r2, [r4, #28]
	bl	_printf
	ldr	r1, [r4, #32]
	mov	r0, r5
	ldr	r2, [r4, #36]
	bl	_printf
	ldr	r1, [r4, #40]
	mov	r0, r6
	ldr	r2, [r4, #44]
	bl	_printf
	ldr	r1, [r4, #48]
	mov	r0, r5
	ldr	r2, [r4, #52]
	bl	_printf
	ldr	r1, [r4, #56]
	mov	r0, r5
	ldr	r2, [r4, #60]
	bl	_printf
	ldr	r1, [r4, #64]
	mov	r0, r6
	ldr	r2, [r4, #68]
	bl	_printf
	pop	{r4, r5, r6, lr}
	mov	pc, lr
	.p2align	2
@ %bb.1:
	.data_region
LCPI1_0:
	.long	L_.print-(LPC1_0+8)
LCPI1_1:
	.long	L_.println-(LPC1_1+8)
	.end_data_region
                                        @ -- End function
	.globl	_printMoveBoard                 @ -- Begin function printMoveBoard
	.p2align	2
	.code	32                              @ @printMoveBoard
_printMoveBoard:
@ %bb.0:                                @ %returnLabel
	push	{r4, lr}
	ldr	r4, LCPI2_0
	mov	r1, #123
	mov	r2, #0
LPC2_0:
	add	r4, pc, r4
	mov	r0, r4
	bl	_printf
	mov	r0, r4
	mov	r1, #456
	mov	r2, #0
	bl	_printf
	mov	r1, #21
	mov	r0, r4
	orr	r1, r1, #768
	mov	r2, #0
	bl	_printf
	pop	{r4, lr}
	mov	pc, lr
	.p2align	2
@ %bb.1:
	.data_region
LCPI2_0:
	.long	L_.println-(LPC2_0+8)
	.end_data_region
                                        @ -- End function
	.globl	_placePiece                     @ -- Begin function placePiece
	.p2align	2
	.code	32                              @ @placePiece
_placePiece:
@ %bb.0:                                @ %prologue
	push	{lr}
	ldr	r12, [sp, #4]
	eor	lr, r3, #1
	orrs	lr, lr, r12
	beq	LBB3_17
@ %bb.1:                                @ %lab1
	eor	lr, r3, #2
	orrs	lr, lr, r12
	bne	LBB3_3
@ %bb.2:                                @ %lab2
	add	r0, r0, #8
	b	LBB3_17
LBB3_3:                                 @ %lab3
	eor	lr, r3, #3
	orrs	lr, lr, r12
	bne	LBB3_5
@ %bb.4:                                @ %lab4
	add	r0, r0, #16
	b	LBB3_17
LBB3_5:                                 @ %lab5
	eor	lr, r3, #4
	orrs	lr, lr, r12
	bne	LBB3_7
@ %bb.6:                                @ %lab6
	add	r0, r0, #24
	b	LBB3_17
LBB3_7:                                 @ %lab7
	eor	lr, r3, #5
	orrs	lr, lr, r12
	bne	LBB3_9
@ %bb.8:                                @ %lab8
	add	r0, r0, #32
	b	LBB3_17
LBB3_9:                                 @ %lab9
	eor	lr, r3, #6
	orrs	lr, lr, r12
	bne	LBB3_11
@ %bb.10:                               @ %lab10
	add	r0, r0, #40
	b	LBB3_17
LBB3_11:                                @ %lab11
	eor	lr, r3, #7
	orrs	lr, lr, r12
	bne	LBB3_13
@ %bb.12:                               @ %lab12
	add	r0, r0, #48
	b	LBB3_17
LBB3_13:                                @ %lab13
	eor	lr, r3, #8
	orrs	lr, lr, r12
	bne	LBB3_15
@ %bb.14:                               @ %lab14
	add	r0, r0, #56
	b	LBB3_17
LBB3_15:                                @ %lab15
	eor	r3, r3, #9
	orrs	r3, r3, r12
	bne	LBB3_18
@ %bb.16:                               @ %lab16
	add	r0, r0, #64
LBB3_17:                                @ %returnLabel
	str	r1, [r0]
	str	r2, [r0, #4]
LBB3_18:                                @ %returnLabel
	pop	{lr}
	mov	pc, lr
                                        @ -- End function
	.globl	_checkWinner                    @ -- Begin function checkWinner
	.p2align	2
	.code	32                              @ @checkWinner
_checkWinner:
@ %bb.0:                                @ %prologue
	push	{r4, r5, r6, r7, r8, lr}
	ldm	r0, {r1, r2}
	add	r3, r0, #8
	add	lr, r0, #16
	eor	r1, r1, #1
	orrs	r1, r1, r2
	ldmeq	r3, {r1, r2}
	eoreq	r1, r1, #1
	orrseq	r1, r1, r2
	beq	LBB4_14
LBB4_1:                                 @ %lab8
	ldm	r0, {r1, r2}
	eor	r1, r1, #2
	orrs	r1, r1, r2
	bne	LBB4_3
@ %bb.2:                                @ %lab9
	ldm	r3, {r1, r2}
	eor	r1, r1, #2
	orrs	r1, r1, r2
	ldmeq	lr, {r1, r2}
	eoreq	r1, r1, #2
	orrseq	r1, r1, r2
	beq	LBB4_25
LBB4_3:                                 @ %lab17
	add	r7, r0, #24
	add	r5, r0, #32
	add	r12, r0, #40
	ldm	r7, {r1, r2}
	eor	r1, r1, #1
	orrs	r1, r1, r2
	ldmeq	r5, {r1, r2}
	eoreq	r1, r1, #1
	orrseq	r1, r1, r2
	beq	LBB4_15
LBB4_4:                                 @ %lab26
	ldm	r7, {r1, r2}
	eor	r1, r1, #2
	orrs	r1, r1, r2
	ldmeq	r5, {r1, r2}
	eoreq	r1, r1, #2
	orrseq	r1, r1, r2
	beq	LBB4_16
LBB4_5:                                 @ %lab35
	add	r4, r0, #48
	add	r6, r0, #56
	add	r8, r0, #64
	ldm	r4, {r1, r2}
	eor	r1, r1, #1
	orrs	r1, r1, r2
	ldmeq	r6, {r1, r2}
	eoreq	r1, r1, #1
	orrseq	r1, r1, r2
	beq	LBB4_17
LBB4_6:                                 @ %lab44
	ldm	r4, {r1, r2}
	eor	r1, r1, #2
	orrs	r1, r1, r2
	ldmeq	r6, {r1, r2}
	eoreq	r1, r1, #2
	orrseq	r1, r1, r2
	beq	LBB4_18
LBB4_7:                                 @ %lab53
	ldm	r0, {r1, r2}
	eor	r1, r1, #1
	orrs	r1, r1, r2
	ldmeq	r7, {r1, r2}
	eoreq	r1, r1, #1
	orrseq	r1, r1, r2
	beq	LBB4_19
LBB4_8:                                 @ %lab62
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	eor	r1, r1, #2
	orrs	r0, r1, r0
	ldmeq	r7, {r0, r1}
	eoreq	r0, r0, #2
	orrseq	r0, r0, r1
	beq	LBB4_20
LBB4_9:                                 @ %lab71
	ldm	r3, {r0, r1}
	eor	r0, r0, #1
	orrs	r0, r0, r1
	ldmeq	r5, {r0, r1}
	eoreq	r0, r0, #1
	orrseq	r0, r0, r1
	beq	LBB4_21
LBB4_10:                                @ %lab80
	ldm	r3, {r0, r1}
	eor	r0, r0, #2
	orrs	r0, r0, r1
	ldmeq	r5, {r0, r1}
	eoreq	r0, r0, #2
	orrseq	r0, r0, r1
	beq	LBB4_22
LBB4_11:                                @ %lab89
	ldm	lr, {r0, r1}
	eor	r0, r0, #1
	orrs	r0, r0, r1
	ldmeq	r12, {r0, r1}
	eoreq	r0, r0, #1
	orrseq	r0, r0, r1
	beq	LBB4_23
LBB4_12:                                @ %lab98
	ldm	lr, {r0, r1}
	mvn	r2, #0
	eor	r0, r0, #2
	orrs	r0, r0, r1
	ldmeq	r12, {r0, r1}
	eoreq	r0, r0, #2
	orrseq	r0, r0, r1
	beq	LBB4_24
LBB4_13:                                @ %lab102
	mvn	r1, #0
	b	LBB4_26
LBB4_14:                                @ %lab1
	ldm	lr, {r1, r2}
	eor	r1, r1, #1
	orrs	r1, r1, r2
	mov	r2, #0
	mov	r1, #0
	bne	LBB4_1
	b	LBB4_26
LBB4_15:                                @ %lab19
	ldm	r12, {r1, r2}
	eor	r1, r1, #1
	orrs	r1, r1, r2
	mov	r2, #0
	mov	r1, #0
	bne	LBB4_4
	b	LBB4_26
LBB4_16:                                @ %lab28
	ldm	r12, {r1, r2}
	eor	r1, r1, #2
	orrs	r1, r1, r2
	bne	LBB4_5
	b	LBB4_25
LBB4_17:                                @ %lab37
	ldm	r8, {r1, r2}
	eor	r1, r1, #1
	orrs	r1, r1, r2
	mov	r2, #0
	mov	r1, #0
	bne	LBB4_6
	b	LBB4_26
LBB4_18:                                @ %lab46
	ldm	r8, {r1, r2}
	eor	r1, r1, #2
	orrs	r1, r1, r2
	bne	LBB4_7
	b	LBB4_25
LBB4_19:                                @ %lab55
	ldm	r4, {r1, r2}
	eor	r1, r1, #1
	orrs	r1, r1, r2
	mov	r2, #0
	mov	r1, #0
	bne	LBB4_8
	b	LBB4_26
LBB4_20:                                @ %lab64
	ldm	r4, {r0, r1}
	eor	r0, r0, #2
	orrs	r0, r0, r1
	bne	LBB4_9
	b	LBB4_25
LBB4_21:                                @ %lab73
	ldm	r6, {r0, r1}
	mov	r2, #0
	eor	r0, r0, #1
	orrs	r0, r0, r1
	mov	r1, #0
	bne	LBB4_10
	b	LBB4_26
LBB4_22:                                @ %lab82
	ldm	r6, {r0, r1}
	eor	r0, r0, #2
	orrs	r0, r0, r1
	bne	LBB4_11
	b	LBB4_25
LBB4_23:                                @ %lab91
	ldm	r8, {r0, r1}
	mov	r2, #0
	eor	r0, r0, #1
	orrs	r0, r0, r1
	mov	r1, #0
	bne	LBB4_12
	b	LBB4_26
LBB4_24:                                @ %lab100
	ldm	r8, {r0, r1}
	eor	r0, r0, #2
	orrs	r0, r0, r1
	bne	LBB4_13
LBB4_25:
	mov	r1, #0
	mov	r2, #1
LBB4_26:                                @ %returnLabel
	mov	r0, r2
	pop	{r4, r5, r6, r7, r8, lr}
	mov	pc, lr
                                        @ -- End function
	.globl	_main                           @ -- Begin function main
	.p2align	2
	.code	32                              @ @main
_main:
@ %bb.0:                                @ %prologue
	push	{r4, r5, r6, r7, r8, r10, r11, lr}
	sub	sp, sp, #4
	mov	r0, #72
	mov	r1, #0
	mov	r7, #0
	bl	_malloc
	mov	r11, r0
	bl	_cleanBoard
	ldr	r8, LCPI5_0
	mov	r5, #0
	ldr	r10, LCPI5_1
	mov	r6, #0
LPC5_0:
	add	r8, pc, r8
	mov	r4, #0
LPC5_1:
	ldr	r10, [pc, r10]
LBB5_1:                                 @ %lab0
                                        @ =>This Inner Loop Header: Depth=1
	mov	r0, r11
	bl	_printBoard
	orrs	r0, r6, r4
	beq	LBB5_3
@ %bb.2:                                @ %lab2
                                        @   in Loop: Header=BB5_1 Depth=1
	mov	r0, r8
	mov	r1, r10
	bl	_scanf
	ldr	r3, [r10]
	mov	r1, #2
	ldr	r0, [r10, #4]
	mov	r2, #0
	str	r0, [sp]
	mov	r0, r11
	bl	_placePiece
	subs	r6, r6, #1
	sbc	r4, r4, #0
	b	LBB5_4
LBB5_3:                                 @ %lab1
                                        @   in Loop: Header=BB5_1 Depth=1
	mov	r0, r8
	mov	r1, r10
	bl	_scanf
	ldr	r3, [r10]
	mov	r1, #1
	ldr	r0, [r10, #4]
	mov	r2, #0
	str	r0, [sp]
	mov	r0, r11
	bl	_placePiece
	adds	r6, r6, #1
	adc	r4, r4, #0
LBB5_4:                                 @ %lab3
                                        @   in Loop: Header=BB5_1 Depth=1
	adds	r7, r7, #1
	mov	r0, r11
	adc	r5, r5, #0
	bl	_checkWinner
	cmn	r1, #1
	bgt	LBB5_6
@ %bb.5:                                @ %lab3
                                        @   in Loop: Header=BB5_1 Depth=1
	eor	r2, r7, #8
	orrs	r2, r2, r5
	bne	LBB5_1
LBB5_6:                                 @ %returnLabel
	adds	r3, r0, #1
	ldr	r0, LCPI5_2
	adc	r2, r1, #0
LPC5_2:
	add	r0, pc, r0
	mov	r1, r3
	bl	_printf
	mov	r0, #0
	mov	r1, #0
	add	sp, sp, #4
	pop	{r4, r5, r6, r7, r8, r10, r11, lr}
	mov	pc, lr
	.p2align	2
@ %bb.7:
	.data_region
LCPI5_0:
	.long	L_.read-(LPC5_0+8)
LCPI5_1:
	.long	L_.read_scratch$non_lazy_ptr-(LPC5_1+8)
LCPI5_2:
	.long	L_.println-(LPC5_2+8)
	.end_data_region
                                        @ -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.println:                             @ @.println
	.asciz	"%ld\n"

L_.print:                               @ @.print
	.asciz	"%ld "

L_.read:                                @ @.read
	.asciz	"%ld"

	.comm	_.read_scratch,8,3              @ @.read_scratch
	.section	__DATA,__nl_symbol_ptr,non_lazy_symbol_pointers
	.p2align	2, 0x0
L_.read_scratch$non_lazy_ptr:
	.indirect_symbol	_.read_scratch
	.long	0

.subsections_via_symbols
