	.file	"main.c"
	.intel_syntax noprefix
# GNU C23 (Ubuntu 15.2.0-16ubuntu1) version 15.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 15.2.0, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -g -O0 -fno-omit-frame-pointer -fno-optimize-sibling-calls -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection -fzero-init-padding-bits=all
	.text
.Ltext0:
	.file 0 "/mnt/c/Users/Stas/Desktop/lab2sys" "src/main.c"
	.globl	compute_fma_kernel
	.type	compute_fma_kernel, @function
compute_fma_kernel:
.LFB6:
	.file 1 "src/main.c"
	.loc 1 12 110
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi	# a, a
	mov	QWORD PTR -32[rbp], rsi	# b, b
	mov	QWORD PTR -40[rbp], rdx	# c, c
	mov	QWORD PTR -48[rbp], rcx	# n, n
# src/main.c:13:     const float f1 = 1.05f;
	.loc 1 13 17
	movss	xmm0, DWORD PTR .LC0[rip]	# tmp117,
	movss	DWORD PTR -16[rbp], xmm0	# f1, tmp117
# src/main.c:14:     const float f2 = 0.95f;
	.loc 1 14 17
	movss	xmm0, DWORD PTR .LC1[rip]	# tmp118,
	movss	DWORD PTR -12[rbp], xmm0	# f2, tmp118
.LBB2:
# src/main.c:15:     for (size_t i = 0; i < n; i++) {
	.loc 1 15 17
	mov	QWORD PTR -8[rbp], 0	# i,
# src/main.c:15:     for (size_t i = 0; i < n; i++) {
	.loc 1 15 5
	jmp	.L2	#
.L3:
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 18
	mov	rax, QWORD PTR -8[rbp]	# tmp119, i
	lea	rdx, 0[0+rax*4]	# _1,
	mov	rax, QWORD PTR -24[rbp]	# tmp120, a
	add	rax, rdx	# _2, _1
	movss	xmm0, DWORD PTR [rax]	# _3, *_2
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 22
	movaps	xmm1, xmm0	# _3, _3
	mulss	xmm1, DWORD PTR -16[rbp]	# _3, f1
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 32
	mov	rax, QWORD PTR -8[rbp]	# tmp121, i
	lea	rdx, 0[0+rax*4]	# _5,
	mov	rax, QWORD PTR -32[rbp]	# tmp122, b
	add	rax, rdx	# _6, _5
	movss	xmm0, DWORD PTR [rax]	# _7, *_6
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 36
	mulss	xmm0, DWORD PTR -12[rbp]	# _8, f2
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 28
	addss	xmm1, xmm0	# _9, _8
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 46
	mov	rax, QWORD PTR -8[rbp]	# tmp123, i
	lea	rdx, 0[0+rax*4]	# _10,
	mov	rax, QWORD PTR -24[rbp]	# tmp124, a
	add	rax, rdx	# _11, _10
	movss	xmm2, DWORD PTR [rax]	# _12, *_11
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 53
	mov	rax, QWORD PTR -8[rbp]	# tmp125, i
	lea	rdx, 0[0+rax*4]	# _13,
	mov	rax, QWORD PTR -32[rbp]	# tmp126, b
	add	rax, rdx	# _14, _13
	movss	xmm0, DWORD PTR [rax]	# _15, *_14
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 50
	mulss	xmm0, xmm2	# _16, _12
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 10
	mov	rax, QWORD PTR -8[rbp]	# tmp127, i
	lea	rdx, 0[0+rax*4]	# _17,
	mov	rax, QWORD PTR -40[rbp]	# tmp128, c
	add	rax, rdx	# _18, _17
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 42
	addss	xmm0, xmm1	# _19, _9
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14
	movss	DWORD PTR [rax], xmm0	# *_18, _19
# src/main.c:15:     for (size_t i = 0; i < n; i++) {
	.loc 1 15 32 discriminator 3
	add	QWORD PTR -8[rbp], 1	# i,
.L2:
# src/main.c:15:     for (size_t i = 0; i < n; i++) {
	.loc 1 15 26 discriminator 1
	mov	rax, QWORD PTR -8[rbp]	# tmp129, i
	cmp	rax, QWORD PTR -48[rbp]	# tmp129, n
	jb	.L3	#,
.LBE2:
# src/main.c:18: }
	.loc 1 18 1
	nop	
	nop	
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	compute_fma_kernel, .-compute_fma_kernel
	.globl	scale_and_clamp
	.type	scale_and_clamp, @function
scale_and_clamp:
.LFB7:
	.loc 1 21 80
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi	# a, a
	mov	QWORD PTR -32[rbp], rsi	# c, c
	mov	QWORD PTR -40[rbp], rdx	# n, n
# src/main.c:22:     const float gain = 0.85f;
	.loc 1 22 17
	movss	xmm0, DWORD PTR .LC2[rip]	# tmp109,
	movss	DWORD PTR -16[rbp], xmm0	# gain, tmp109
# src/main.c:23:     const float bias = 0.15f;
	.loc 1 23 17
	movss	xmm0, DWORD PTR .LC3[rip]	# tmp110,
	movss	DWORD PTR -12[rbp], xmm0	# bias, tmp110
.LBB3:
# src/main.c:24:     for (size_t i = 0; i < n; i++) {
	.loc 1 24 17
	mov	QWORD PTR -8[rbp], 0	# i,
# src/main.c:24:     for (size_t i = 0; i < n; i++) {
	.loc 1 24 5
	jmp	.L5	#
.L6:
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 17
	mov	rax, QWORD PTR -8[rbp]	# tmp111, i
	lea	rdx, 0[0+rax*4]	# _1,
	mov	rax, QWORD PTR -32[rbp]	# tmp112, c
	add	rax, rdx	# _2, _1
	movss	xmm0, DWORD PTR [rax]	# _3, *_2
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 21
	movaps	xmm1, xmm0	# _3, _3
	mulss	xmm1, DWORD PTR -16[rbp]	# _3, gain
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 31
	mov	rax, QWORD PTR -8[rbp]	# tmp113, i
	lea	rdx, 0[0+rax*4]	# _5,
	mov	rax, QWORD PTR -24[rbp]	# tmp114, a
	add	rax, rdx	# _6, _5
	movss	xmm0, DWORD PTR [rax]	# _7, *_6
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 35
	mulss	xmm0, DWORD PTR -12[rbp]	# _8, bias
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 10
	mov	rax, QWORD PTR -8[rbp]	# tmp115, i
	lea	rdx, 0[0+rax*4]	# _9,
	mov	rax, QWORD PTR -32[rbp]	# tmp116, c
	add	rax, rdx	# _10, _9
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 28
	addss	xmm0, xmm1	# _11, _4
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 14
	movss	DWORD PTR [rax], xmm0	# *_10, _11
# src/main.c:24:     for (size_t i = 0; i < n; i++) {
	.loc 1 24 32 discriminator 3
	add	QWORD PTR -8[rbp], 1	# i,
.L5:
# src/main.c:24:     for (size_t i = 0; i < n; i++) {
	.loc 1 24 26 discriminator 1
	mov	rax, QWORD PTR -8[rbp]	# tmp117, i
	cmp	rax, QWORD PTR -40[rbp]	# tmp117, n
	jb	.L6	#,
.LBE3:
# src/main.c:27: }
	.loc 1 27 1
	nop	
	nop	
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	scale_and_clamp, .-scale_and_clamp
	.globl	vector_math_engine
	.type	vector_math_engine, @function
vector_math_engine:
.LFB8:
	.loc 1 30 110
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	QWORD PTR -8[rbp], rdi	# a, a
	mov	QWORD PTR -16[rbp], rsi	# b, b
	mov	QWORD PTR -24[rbp], rdx	# c, c
	mov	QWORD PTR -32[rbp], rcx	# n, n
# src/main.c:31:     compute_fma_kernel(a, b, c, n);
	.loc 1 31 5
	mov	rcx, QWORD PTR -32[rbp]	# tmp98, n
	mov	rdx, QWORD PTR -24[rbp]	# tmp99, c
	mov	rsi, QWORD PTR -16[rbp]	# tmp100, b
	mov	rax, QWORD PTR -8[rbp]	# tmp101, a
	mov	rdi, rax	#, tmp101
	call	compute_fma_kernel	#
# src/main.c:32:     scale_and_clamp(a, c, n);
	.loc 1 32 5
	mov	rdx, QWORD PTR -32[rbp]	# tmp102, n
	mov	rcx, QWORD PTR -24[rbp]	# tmp103, c
	mov	rax, QWORD PTR -8[rbp]	# tmp104, a
	mov	rsi, rcx	#, tmp103
	mov	rdi, rax	#, tmp104
	call	scale_and_clamp	#
# src/main.c:33: }
	.loc 1 33 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	vector_math_engine, .-vector_math_engine
	.globl	apply_spatial_filter
	.type	apply_spatial_filter, @function
apply_spatial_filter:
.LFB9:
	.loc 1 36 61
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi	# data, data
	mov	QWORD PTR -32[rbp], rsi	# n, n
# src/main.c:37:     const float alpha = 0.25f;
	.loc 1 37 17
	movss	xmm0, DWORD PTR .LC4[rip]	# tmp117,
	movss	DWORD PTR -16[rbp], xmm0	# alpha, tmp117
# src/main.c:38:     const float beta  = 0.50f;
	.loc 1 38 17
	movss	xmm0, DWORD PTR .LC5[rip]	# tmp118,
	movss	DWORD PTR -12[rbp], xmm0	# beta, tmp118
.LBB4:
# src/main.c:39:     for (size_t i = 1; i < n - 1; i++) {
	.loc 1 39 17
	mov	QWORD PTR -8[rbp], 1	# i,
# src/main.c:39:     for (size_t i = 1; i < n - 1; i++) {
	.loc 1 39 5
	jmp	.L9	#
.L10:
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 31
	mov	rax, QWORD PTR -8[rbp]	# tmp119, i
	sal	rax, 2	# _1,
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 34
	lea	rdx, -4[rax]	# _2,
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 31
	mov	rax, QWORD PTR -24[rbp]	# tmp120, data
	add	rax, rdx	# _3, _2
	movss	xmm0, DWORD PTR [rax]	# _4, *_3
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 25
	movaps	xmm1, xmm0	# _4, _4
	mulss	xmm1, DWORD PTR -16[rbp]	# _4, alpha
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 52
	mov	rax, QWORD PTR -8[rbp]	# tmp121, i
	lea	rdx, 0[0+rax*4]	# _6,
	mov	rax, QWORD PTR -24[rbp]	# tmp122, data
	add	rax, rdx	# _7, _6
	movss	xmm0, DWORD PTR [rax]	# _8, *_7
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 46
	mulss	xmm0, DWORD PTR -12[rbp]	# _9, beta
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 39
	addss	xmm1, xmm0	# _10, _9
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 73
	mov	rax, QWORD PTR -8[rbp]	# tmp123, i
	add	rax, 1	# _11,
	lea	rdx, 0[0+rax*4]	# _12,
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 70
	mov	rax, QWORD PTR -24[rbp]	# tmp124, data
	add	rax, rdx	# _13, _12
	movss	xmm0, DWORD PTR [rax]	# _14, *_13
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 64
	mulss	xmm0, DWORD PTR -16[rbp]	# _15, alpha
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 13
	mov	rax, QWORD PTR -8[rbp]	# tmp125, i
	lea	rdx, 0[0+rax*4]	# _16,
	mov	rax, QWORD PTR -24[rbp]	# tmp126, data
	add	rax, rdx	# _17, _16
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 56
	addss	xmm0, xmm1	# _18, _10
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 17
	movss	DWORD PTR [rax], xmm0	# *_17, _18
# src/main.c:39:     for (size_t i = 1; i < n - 1; i++) {
	.loc 1 39 36 discriminator 3
	add	QWORD PTR -8[rbp], 1	# i,
.L9:
# src/main.c:39:     for (size_t i = 1; i < n - 1; i++) {
	.loc 1 39 30 discriminator 1
	mov	rax, QWORD PTR -32[rbp]	# tmp127, n
	sub	rax, 1	# _19,
# src/main.c:39:     for (size_t i = 1; i < n - 1; i++) {
	.loc 1 39 26 discriminator 1
	cmp	QWORD PTR -8[rbp], rax	# i, _19
	jb	.L10	#,
.LBE4:
# src/main.c:42: }
	.loc 1 42 1
	nop	
	nop	
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	apply_spatial_filter, .-apply_spatial_filter
	.globl	normalize_signal
	.type	normalize_signal, @function
normalize_signal:
.LFB10:
	.loc 1 45 86
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi	# data, data
	mov	QWORD PTR -32[rbp], rsi	# ref, ref
	mov	QWORD PTR -40[rbp], rdx	# n, n
# src/main.c:46:     const float norm = 0.98f;
	.loc 1 46 17
	movss	xmm0, DWORD PTR .LC6[rip]	# tmp109,
	movss	DWORD PTR -12[rbp], xmm0	# norm, tmp109
.LBB5:
# src/main.c:47:     for (size_t i = 0; i < n; i++) {
	.loc 1 47 17
	mov	QWORD PTR -8[rbp], 0	# i,
# src/main.c:47:     for (size_t i = 0; i < n; i++) {
	.loc 1 47 5
	jmp	.L12	#
.L13:
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 24
	mov	rax, QWORD PTR -8[rbp]	# tmp110, i
	lea	rdx, 0[0+rax*4]	# _1,
	mov	rax, QWORD PTR -24[rbp]	# tmp111, data
	add	rax, rdx	# _2, _1
	movss	xmm1, DWORD PTR [rax]	# _3, *_2
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 33
	mov	rax, QWORD PTR -8[rbp]	# tmp112, i
	lea	rdx, 0[0+rax*4]	# _4,
	mov	rax, QWORD PTR -32[rbp]	# tmp113, ref
	add	rax, rdx	# _5, _4
	movss	xmm2, DWORD PTR [rax]	# _6, *_5
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 37
	movss	xmm0, DWORD PTR .LC7[rip]	# tmp114,
	mulss	xmm0, xmm2	# _7, _6
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 28
	addss	xmm0, xmm1	# _8, _3
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 13
	mov	rax, QWORD PTR -8[rbp]	# tmp115, i
	lea	rdx, 0[0+rax*4]	# _9,
	mov	rax, QWORD PTR -24[rbp]	# tmp116, data
	add	rax, rdx	# _10, _9
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 46
	mulss	xmm0, DWORD PTR -12[rbp]	# _11, norm
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 17
	movss	DWORD PTR [rax], xmm0	# *_10, _11
# src/main.c:47:     for (size_t i = 0; i < n; i++) {
	.loc 1 47 32 discriminator 3
	add	QWORD PTR -8[rbp], 1	# i,
.L12:
# src/main.c:47:     for (size_t i = 0; i < n; i++) {
	.loc 1 47 26 discriminator 1
	mov	rax, QWORD PTR -8[rbp]	# tmp117, i
	cmp	rax, QWORD PTR -40[rbp]	# tmp117, n
	jb	.L13	#,
.LBE5:
# src/main.c:50: }
	.loc 1 50 1
	nop	
	nop	
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
	.size	normalize_signal, .-normalize_signal
	.globl	signal_filter_engine
	.type	signal_filter_engine, @function
signal_filter_engine:
.LFB11:
	.loc 1 53 85
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 24	#,
	mov	QWORD PTR -8[rbp], rdi	# c, c
	mov	QWORD PTR -16[rbp], rsi	# b, b
	mov	QWORD PTR -24[rbp], rdx	# n, n
# src/main.c:54:     apply_spatial_filter(c, n);
	.loc 1 54 5
	mov	rdx, QWORD PTR -24[rbp]	# tmp98, n
	mov	rax, QWORD PTR -8[rbp]	# tmp99, c
	mov	rsi, rdx	#, tmp98
	mov	rdi, rax	#, tmp99
	call	apply_spatial_filter	#
# src/main.c:55:     normalize_signal(c, b, n);
	.loc 1 55 5
	mov	rdx, QWORD PTR -24[rbp]	# tmp100, n
	mov	rcx, QWORD PTR -16[rbp]	# tmp101, b
	mov	rax, QWORD PTR -8[rbp]	# tmp102, c
	mov	rsi, rcx	#, tmp101
	mov	rdi, rax	#, tmp102
	call	normalize_signal	#
# src/main.c:56: }
	.loc 1 56 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE11:
	.size	signal_filter_engine, .-signal_filter_engine
	.globl	init_dataset
	.type	init_dataset, @function
init_dataset:
.LFB12:
	.loc 1 59 92
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi	# a, a
	mov	QWORD PTR -32[rbp], rsi	# b, b
	mov	QWORD PTR -40[rbp], rdx	# c, c
	mov	QWORD PTR -48[rbp], rcx	# n, n
.LBB6:
# src/main.c:60:     for (size_t i = 0; i < n; i++) {
	.loc 1 60 17
	mov	QWORD PTR -8[rbp], 0	# i,
# src/main.c:60:     for (size_t i = 0; i < n; i++) {
	.loc 1 60 5
	jmp	.L16	#
.L21:
# src/main.c:61:         a[i] = (float)(i % 100) * 0.01f + 1.0f;
	.loc 1 61 26
	mov	rcx, QWORD PTR -8[rbp]	# tmp113, i
	mov	rax, rcx	# tmp114, tmp113
	shr	rax, 2	# tmp114,
	movabs	rdx, 2951479051793528259	# tmp116,
	mul	rdx	# tmp116
	mov	rax, rdx	# tmp115, tmp115
	shr	rax, 2	# tmp115,
	imul	rdx, rax, 100	# tmp117, _1,
	mov	rax, rcx	# tmp113, tmp113
	sub	rax, rdx	# tmp113, tmp117
# src/main.c:61:         a[i] = (float)(i % 100) * 0.01f + 1.0f;
	.loc 1 61 16
	test	rax, rax	# _1
	js	.L17	#,
	pxor	xmm0, xmm0	# _2
	cvtsi2ss	xmm0, rax	# _2, _1
	jmp	.L18	#
.L17:
	mov	rdx, rax	# tmp119, _1
	shr	rdx	# tmp119
	and	eax, 1	# tmp120,
	or	rdx, rax	# tmp119, tmp120
	pxor	xmm0, xmm0	# tmp118
	cvtsi2ss	xmm0, rdx	# tmp118, tmp119
	addss	xmm0, xmm0	# _2, tmp118
.L18:
# src/main.c:61:         a[i] = (float)(i % 100) * 0.01f + 1.0f;
	.loc 1 61 33
	movss	xmm1, DWORD PTR .LC8[rip]	# tmp121,
	mulss	xmm1, xmm0	# _3, _2
# src/main.c:61:         a[i] = (float)(i % 100) * 0.01f + 1.0f;
	.loc 1 61 10
	mov	rax, QWORD PTR -8[rbp]	# tmp122, i
	lea	rdx, 0[0+rax*4]	# _4,
	mov	rax, QWORD PTR -24[rbp]	# tmp123, a
	add	rax, rdx	# _5, _4
# src/main.c:61:         a[i] = (float)(i % 100) * 0.01f + 1.0f;
	.loc 1 61 41
	movss	xmm0, DWORD PTR .LC9[rip]	# tmp124,
	addss	xmm0, xmm1	# _6, _3
# src/main.c:61:         a[i] = (float)(i % 100) * 0.01f + 1.0f;
	.loc 1 61 14
	movss	DWORD PTR [rax], xmm0	# *_5, _6
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 27
	mov	rax, QWORD PTR -8[rbp]	# tmp125, i
	lea	rcx, 1[rax]	# _7,
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 32
	mov	rax, rcx	# tmp126, _7
	shr	rax	# tmp126
	movabs	rdx, -6640827866535438581	# tmp128,
	mul	rdx	# tmp128
	mov	rax, rdx	# tmp127, tmp127
	shr	rax, 4	# tmp127,
	imul	rdx, rax, 50	# tmp129, _8,
	mov	rax, rcx	# _7, _7
	sub	rax, rdx	# _7, tmp129
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 16
	test	rax, rax	# _8
	js	.L19	#,
	pxor	xmm0, xmm0	# _9
	cvtsi2ss	xmm0, rax	# _9, _8
	jmp	.L20	#
.L19:
	mov	rdx, rax	# tmp131, _8
	shr	rdx	# tmp131
	and	eax, 1	# tmp132,
	or	rdx, rax	# tmp131, tmp132
	pxor	xmm0, xmm0	# tmp130
	cvtsi2ss	xmm0, rdx	# tmp130, tmp131
	addss	xmm0, xmm0	# _9, tmp130
.L20:
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 38
	movss	xmm1, DWORD PTR .LC10[rip]	# tmp133,
	mulss	xmm1, xmm0	# _10, _9
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 10
	mov	rax, QWORD PTR -8[rbp]	# tmp134, i
	lea	rdx, 0[0+rax*4]	# _11,
	mov	rax, QWORD PTR -32[rbp]	# tmp135, b
	add	rax, rdx	# _12, _11
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 46
	movss	xmm0, DWORD PTR .LC5[rip]	# tmp136,
	addss	xmm0, xmm1	# _13, _10
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 14
	movss	DWORD PTR [rax], xmm0	# *_12, _13
# src/main.c:63:         c[i] = 0.0f;
	.loc 1 63 10
	mov	rax, QWORD PTR -8[rbp]	# tmp137, i
	lea	rdx, 0[0+rax*4]	# _14,
	mov	rax, QWORD PTR -40[rbp]	# tmp138, c
	add	rax, rdx	# _15, _14
# src/main.c:63:         c[i] = 0.0f;
	.loc 1 63 14
	pxor	xmm0, xmm0	# tmp139
	movss	DWORD PTR [rax], xmm0	# *_15, tmp139
# src/main.c:60:     for (size_t i = 0; i < n; i++) {
	.loc 1 60 32 discriminator 3
	add	QWORD PTR -8[rbp], 1	# i,
.L16:
# src/main.c:60:     for (size_t i = 0; i < n; i++) {
	.loc 1 60 26 discriminator 1
	mov	rax, QWORD PTR -8[rbp]	# tmp140, i
	cmp	rax, QWORD PTR -48[rbp]	# tmp140, n
	jb	.L21	#,
.LBE6:
# src/main.c:65: }
	.loc 1 65 1
	nop	
	nop	
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE12:
	.size	init_dataset, .-init_dataset
	.globl	compute_summary
	.type	compute_summary, @function
compute_summary:
.LFB13:
	.loc 1 68 64
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi	# data, data
	mov	QWORD PTR -32[rbp], rsi	# n, n
# src/main.c:69:     double sum = 0.0;
	.loc 1 69 12
	pxor	xmm0, xmm0	# tmp104
	movsd	QWORD PTR -16[rbp], xmm0	# sum, tmp104
.LBB7:
# src/main.c:70:     for (size_t i = 0; i < n; i++) {
	.loc 1 70 17
	mov	QWORD PTR -8[rbp], 0	# i,
# src/main.c:70:     for (size_t i = 0; i < n; i++) {
	.loc 1 70 5
	jmp	.L23	#
.L24:
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 28
	mov	rax, QWORD PTR -8[rbp]	# tmp105, i
	lea	rdx, 0[0+rax*4]	# _1,
	mov	rax, QWORD PTR -24[rbp]	# tmp106, data
	add	rax, rdx	# _2, _1
	movss	xmm0, DWORD PTR [rax]	# _3, *_2
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 16
	cvtss2sd	xmm0, xmm0	# _4, _3
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 13
	movsd	xmm1, QWORD PTR -16[rbp]	# tmp108, sum
	addsd	xmm0, xmm1	# sum_13, tmp108
	movsd	QWORD PTR -16[rbp], xmm0	# sum, sum_13
# src/main.c:70:     for (size_t i = 0; i < n; i++) {
	.loc 1 70 32 discriminator 3
	add	QWORD PTR -8[rbp], 1	# i,
.L23:
# src/main.c:70:     for (size_t i = 0; i < n; i++) {
	.loc 1 70 26 discriminator 1
	mov	rax, QWORD PTR -8[rbp]	# tmp109, i
	cmp	rax, QWORD PTR -32[rbp]	# tmp109, n
	jb	.L24	#,
.LBE7:
# src/main.c:73:     return sum;
	.loc 1 73 12
	movsd	xmm0, QWORD PTR -16[rbp]	# _10, sum
# src/main.c:74: }
	.loc 1 74 1
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE13:
	.size	compute_summary, .-compute_summary
	.section	.rodata
.LC13:
	.string	"Memory allocation error\n"
.LC14:
	.string	"Result: %.4f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB14:
	.loc 1 76 33
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 64	#,
	mov	DWORD PTR -52[rbp], edi	# argc, argc
	mov	QWORD PTR -64[rbp], rsi	# argv, argv
# src/main.c:76: int main(int argc, char **argv) {
	.loc 1 76 33
	mov	rax, QWORD PTR fs:40	# tmp116, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.8957, tmp116
	xor	eax, eax	# tmp116
# src/main.c:80:     float *a = NULL;
	.loc 1 80 12
	mov	QWORD PTR -40[rbp], 0	# a,
# src/main.c:81:     float *b = NULL;
	.loc 1 81 12
	mov	QWORD PTR -32[rbp], 0	# b,
# src/main.c:82:     float *c = NULL;
	.loc 1 82 12
	mov	QWORD PTR -24[rbp], 0	# c,
# src/main.c:84:     if (posix_memalign((void**)&a, 32, DATA_SIZE * sizeof(float)) != 0 ||
	.loc 1 84 9
	lea	rax, -40[rbp]	# tmp117,
	mov	edx, 67108864	#,
	mov	esi, 32	#,
	mov	rdi, rax	#, tmp117
	call	posix_memalign@PLT	#
# src/main.c:84:     if (posix_memalign((void**)&a, 32, DATA_SIZE * sizeof(float)) != 0 ||
	.loc 1 84 8 discriminator 1
	test	eax, eax	# _1
	jne	.L27	#,
# src/main.c:85:         posix_memalign((void**)&b, 32, DATA_SIZE * sizeof(float)) != 0 ||
	.loc 1 85 9
	lea	rax, -32[rbp]	# tmp118,
	mov	edx, 67108864	#,
	mov	esi, 32	#,
	mov	rdi, rax	#, tmp118
	call	posix_memalign@PLT	#
# src/main.c:84:     if (posix_memalign((void**)&a, 32, DATA_SIZE * sizeof(float)) != 0 ||
	.loc 1 84 72 discriminator 2
	test	eax, eax	# _2
	jne	.L27	#,
# src/main.c:86:         posix_memalign((void**)&c, 32, DATA_SIZE * sizeof(float)) != 0) {
	.loc 1 86 9
	lea	rax, -24[rbp]	# tmp119,
	mov	edx, 67108864	#,
	mov	esi, 32	#,
	mov	rdi, rax	#, tmp119
	call	posix_memalign@PLT	#
# src/main.c:85:         posix_memalign((void**)&b, 32, DATA_SIZE * sizeof(float)) != 0 ||
	.loc 1 85 72
	test	eax, eax	# _3
	je	.L28	#,
.L27:
# src/main.c:87:         fprintf(stderr, "Memory allocation error\n");
	.loc 1 87 9
	mov	rax, QWORD PTR stderr[rip]	# stderr.0_4, stderr
	lea	rdi, .LC13[rip]	# tmp120,
	mov	rcx, rax	#, stderr.0_4
	mov	edx, 24	#,
	mov	esi, 1	#,
	call	fwrite@PLT	#
# src/main.c:88:         return 1;
	.loc 1 88 16
	mov	eax, 1	# _18,
	jmp	.L32	#
.L28:
# src/main.c:91:     init_dataset(a, b, c, DATA_SIZE);
	.loc 1 91 5
	mov	rdx, QWORD PTR -24[rbp]	# c.1_5, c
	mov	rsi, QWORD PTR -32[rbp]	# b.2_6, b
	mov	rax, QWORD PTR -40[rbp]	# a.3_7, a
	mov	ecx, 16777216	#,
	mov	rdi, rax	#, a.3_7
	call	init_dataset	#
.LBB8:
# src/main.c:93:     for (int iter = 0; iter < NUM_ITERATIONS; iter++) {
	.loc 1 93 14
	mov	DWORD PTR -44[rbp], 0	# iter,
# src/main.c:93:     for (int iter = 0; iter < NUM_ITERATIONS; iter++) {
	.loc 1 93 5
	jmp	.L30	#
.L31:
# src/main.c:94:         vector_math_engine(a, b, c, DATA_SIZE);
	.loc 1 94 9
	mov	rdx, QWORD PTR -24[rbp]	# c.4_8, c
	mov	rsi, QWORD PTR -32[rbp]	# b.5_9, b
	mov	rax, QWORD PTR -40[rbp]	# a.6_10, a
	mov	ecx, 16777216	#,
	mov	rdi, rax	#, a.6_10
	call	vector_math_engine	#
# src/main.c:95:         signal_filter_engine(c, b, DATA_SIZE);
	.loc 1 95 9
	mov	rcx, QWORD PTR -32[rbp]	# b.7_11, b
	mov	rax, QWORD PTR -24[rbp]	# c.8_12, c
	mov	edx, 16777216	#,
	mov	rsi, rcx	#, b.7_11
	mov	rdi, rax	#, c.8_12
	call	signal_filter_engine	#
# src/main.c:93:     for (int iter = 0; iter < NUM_ITERATIONS; iter++) {
	.loc 1 93 51 discriminator 3
	add	DWORD PTR -44[rbp], 1	# iter,
.L30:
# src/main.c:93:     for (int iter = 0; iter < NUM_ITERATIONS; iter++) {
	.loc 1 93 29 discriminator 1
	cmp	DWORD PTR -44[rbp], 19	# iter,
	jle	.L31	#,
.LBE8:
# src/main.c:98:     double total = compute_summary(c, DATA_SIZE);
	.loc 1 98 20
	mov	rax, QWORD PTR -24[rbp]	# c.9_13, c
	mov	esi, 16777216	#,
	mov	rdi, rax	#, c.9_13
	call	compute_summary	#
	movq	rax, xmm0	# tmp121,
	mov	QWORD PTR -16[rbp], rax	# total, tmp121
# src/main.c:99:     printf("Result: %.4f\n", total);
	.loc 1 99 5
	mov	rax, QWORD PTR -16[rbp]	# tmp122, total
	lea	rdx, .LC14[rip]	# tmp123,
	movq	xmm0, rax	#, tmp122
	mov	rdi, rdx	#, tmp123
	mov	eax, 1	#,
	call	printf@PLT	#
# src/main.c:101:     free(a);
	.loc 1 101 5
	mov	rax, QWORD PTR -40[rbp]	# a.10_14, a
	mov	rdi, rax	#, a.10_14
	call	free@PLT	#
# src/main.c:102:     free(b);
	.loc 1 102 5
	mov	rax, QWORD PTR -32[rbp]	# b.11_15, b
	mov	rdi, rax	#, b.11_15
	call	free@PLT	#
# src/main.c:103:     free(c);
	.loc 1 103 5
	mov	rax, QWORD PTR -24[rbp]	# c.12_16, c
	mov	rdi, rax	#, c.12_16
	call	free@PLT	#
# src/main.c:104:     return 0;
	.loc 1 104 12
	mov	eax, 0	# _18,
.L32:
# src/main.c:105: }
	.loc 1 105 1
	mov	rdx, QWORD PTR -8[rbp]	# tmp125, D.8957
	sub	rdx, QWORD PTR fs:40	# tmp125, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L33	#,
	call	__stack_chk_fail@PLT	#
.L33:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1065772646
	.align 4
.LC1:
	.long	1064514355
	.align 4
.LC2:
	.long	1062836634
	.align 4
.LC3:
	.long	1041865114
	.align 4
.LC4:
	.long	1048576000
	.align 4
.LC5:
	.long	1056964608
	.align 4
.LC6:
	.long	1065017672
	.align 4
.LC7:
	.long	1028443341
	.align 4
.LC8:
	.long	1008981770
	.align 4
.LC9:
	.long	1065353216
	.align 4
.LC10:
	.long	1017370378
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/15/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x72d
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x13
	.long	.LASF77
	.byte	0x1d
	.byte	0x3
	.long	0x31647
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x8
	.long	.LASF9
	.byte	0x2
	.byte	0xe5
	.byte	0x17
	.long	0x3f
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x14
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x15
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x8
	.long	.LASF10
	.byte	0x3
	.byte	0x2d
	.byte	0x1b
	.long	0x3f
	.uleb128 0x8
	.long	.LASF11
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x72
	.uleb128 0x8
	.long	.LASF12
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x72
	.uleb128 0x4
	.long	0xa2
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0xd
	.long	0xa2
	.uleb128 0x16
	.long	.LASF78
	.byte	0xd8
	.byte	0x4
	.byte	0x33
	.byte	0x8
	.long	0x23f
	.uleb128 0x1
	.long	.LASF14
	.byte	0x35
	.byte	0x7
	.long	0x6b
	.byte	0
	.uleb128 0x1
	.long	.LASF15
	.byte	0x38
	.byte	0x9
	.long	0x9d
	.byte	0x8
	.uleb128 0x1
	.long	.LASF16
	.byte	0x39
	.byte	0x9
	.long	0x9d
	.byte	0x10
	.uleb128 0x1
	.long	.LASF17
	.byte	0x3a
	.byte	0x9
	.long	0x9d
	.byte	0x18
	.uleb128 0x1
	.long	.LASF18
	.byte	0x3b
	.byte	0x9
	.long	0x9d
	.byte	0x20
	.uleb128 0x1
	.long	.LASF19
	.byte	0x3c
	.byte	0x9
	.long	0x9d
	.byte	0x28
	.uleb128 0x1
	.long	.LASF20
	.byte	0x3d
	.byte	0x9
	.long	0x9d
	.byte	0x30
	.uleb128 0x1
	.long	.LASF21
	.byte	0x3e
	.byte	0x9
	.long	0x9d
	.byte	0x38
	.uleb128 0x1
	.long	.LASF22
	.byte	0x3f
	.byte	0x9
	.long	0x9d
	.byte	0x40
	.uleb128 0x1
	.long	.LASF23
	.byte	0x42
	.byte	0x9
	.long	0x9d
	.byte	0x48
	.uleb128 0x1
	.long	.LASF24
	.byte	0x43
	.byte	0x9
	.long	0x9d
	.byte	0x50
	.uleb128 0x1
	.long	.LASF25
	.byte	0x44
	.byte	0x9
	.long	0x9d
	.byte	0x58
	.uleb128 0x1
	.long	.LASF26
	.byte	0x46
	.byte	0x16
	.long	0x258
	.byte	0x60
	.uleb128 0x1
	.long	.LASF27
	.byte	0x48
	.byte	0x14
	.long	0x25d
	.byte	0x68
	.uleb128 0x1
	.long	.LASF28
	.byte	0x4a
	.byte	0x7
	.long	0x6b
	.byte	0x70
	.uleb128 0x17
	.long	.LASF79
	.byte	0x4
	.byte	0x4b
	.byte	0x7
	.long	0x6b
	.byte	0x18
	.value	0x3a0
	.uleb128 0x1
	.long	.LASF29
	.byte	0x4d
	.byte	0x8
	.long	0x262
	.byte	0x77
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4e
	.byte	0xb
	.long	0x85
	.byte	0x78
	.uleb128 0x1
	.long	.LASF31
	.byte	0x51
	.byte	0x12
	.long	0x56
	.byte	0x80
	.uleb128 0x1
	.long	.LASF32
	.byte	0x52
	.byte	0xf
	.long	0x5d
	.byte	0x82
	.uleb128 0x1
	.long	.LASF33
	.byte	0x53
	.byte	0x8
	.long	0x262
	.byte	0x83
	.uleb128 0x1
	.long	.LASF34
	.byte	0x55
	.byte	0xf
	.long	0x272
	.byte	0x88
	.uleb128 0x1
	.long	.LASF35
	.byte	0x5d
	.byte	0xd
	.long	0x91
	.byte	0x90
	.uleb128 0x1
	.long	.LASF36
	.byte	0x5f
	.byte	0x17
	.long	0x27c
	.byte	0x98
	.uleb128 0x1
	.long	.LASF37
	.byte	0x60
	.byte	0x19
	.long	0x286
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF38
	.byte	0x61
	.byte	0x14
	.long	0x25d
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF39
	.byte	0x62
	.byte	0x9
	.long	0x4d
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF40
	.byte	0x63
	.byte	0x15
	.long	0x28b
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF41
	.byte	0x64
	.byte	0x7
	.long	0x6b
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF42
	.byte	0x66
	.byte	0x7
	.long	0x6b
	.byte	0xc4
	.uleb128 0x1
	.long	.LASF43
	.byte	0x68
	.byte	0xe
	.long	0x79
	.byte	0xc8
	.uleb128 0x1
	.long	.LASF44
	.byte	0x6d
	.byte	0x8
	.long	0x290
	.byte	0xd0
	.byte	0
	.uleb128 0x8
	.long	.LASF45
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xae
	.uleb128 0x18
	.long	.LASF80
	.byte	0x4
	.byte	0x2d
	.byte	0xe
	.uleb128 0xc
	.long	.LASF46
	.uleb128 0x4
	.long	0x253
	.uleb128 0x4
	.long	0xae
	.uleb128 0xe
	.long	0xa2
	.long	0x272
	.uleb128 0xf
	.long	0x3f
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x24b
	.uleb128 0xc
	.long	.LASF47
	.uleb128 0x4
	.long	0x277
	.uleb128 0xc
	.long	.LASF48
	.uleb128 0x4
	.long	0x281
	.uleb128 0x4
	.long	0x25d
	.uleb128 0xe
	.long	0xa2
	.long	0x2a0
	.uleb128 0xf
	.long	0x3f
	.byte	0x7
	.byte	0
	.uleb128 0x4
	.long	0xa9
	.uleb128 0x4
	.long	0x23f
	.uleb128 0x19
	.long	.LASF81
	.byte	0x6
	.byte	0x9b
	.byte	0xe
	.long	0x2a5
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF49
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF50
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF51
	.uleb128 0xd
	.long	0x2c4
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF52
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF53
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF54
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF55
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF56
	.uleb128 0x1a
	.long	.LASF82
	.byte	0x7
	.value	0x2b3
	.byte	0xd
	.long	0x306
	.uleb128 0x9
	.long	0x4d
	.byte	0
	.uleb128 0x10
	.long	.LASF57
	.byte	0x6
	.value	0x172
	.long	0x6b
	.long	0x31d
	.uleb128 0x9
	.long	0x2a0
	.uleb128 0x1b
	.byte	0
	.uleb128 0x10
	.long	.LASF58
	.byte	0x7
	.value	0x2e4
	.long	0x6b
	.long	0x33d
	.uleb128 0x9
	.long	0x33d
	.uleb128 0x9
	.long	0x3f
	.uleb128 0x9
	.long	0x3f
	.byte	0
	.uleb128 0x4
	.long	0x4d
	.uleb128 0x1c
	.long	.LASF63
	.byte	0x1
	.byte	0x4c
	.byte	0x5
	.long	0x6b
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x3d5
	.uleb128 0xa
	.long	.LASF59
	.byte	0x4c
	.byte	0xe
	.long	0x6b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xa
	.long	.LASF60
	.byte	0x4c
	.byte	0x1b
	.long	0x3d5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x5
	.string	"a"
	.byte	0x50
	.byte	0xc
	.long	0x3da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x5
	.string	"b"
	.byte	0x51
	.byte	0xc
	.long	0x3da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.string	"c"
	.byte	0x52
	.byte	0xc
	.long	0x3da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x6
	.long	.LASF61
	.byte	0x62
	.byte	0xc
	.long	0x2d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x7
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x6
	.long	.LASF62
	.byte	0x5d
	.byte	0xe
	.long	0x6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x9d
	.uleb128 0x4
	.long	0x2c4
	.uleb128 0x11
	.long	0x3da
	.uleb128 0x1d
	.long	.LASF64
	.byte	0x1
	.byte	0x44
	.byte	0x8
	.long	0x2d0
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x44d
	.uleb128 0xa
	.long	.LASF65
	.byte	0x44
	.byte	0x30
	.long	0x452
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"n"
	.byte	0x44
	.byte	0x3d
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.string	"sum"
	.byte	0x45
	.byte	0xc
	.long	0x2d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x7
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x5
	.string	"i"
	.byte	0x46
	.byte	0x11
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x2cb
	.uleb128 0x11
	.long	0x44d
	.uleb128 0xb
	.long	.LASF66
	.byte	0x3b
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x4c2
	.uleb128 0x2
	.string	"a"
	.byte	0x3b
	.byte	0x25
	.long	0x3df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"b"
	.byte	0x3b
	.byte	0x3a
	.long	0x3df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"c"
	.byte	0x3b
	.byte	0x4f
	.long	0x3df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.string	"n"
	.byte	0x3b
	.byte	0x59
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x7
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x5
	.string	"i"
	.byte	0x3c
	.byte	0x11
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	.LASF67
	.byte	0x35
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x503
	.uleb128 0x2
	.string	"c"
	.byte	0x35
	.byte	0x2d
	.long	0x3df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"b"
	.byte	0x35
	.byte	0x48
	.long	0x452
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"n"
	.byte	0x35
	.byte	0x52
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0xb
	.long	.LASF68
	.byte	0x2d
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x574
	.uleb128 0xa
	.long	.LASF65
	.byte	0x2d
	.byte	0x29
	.long	0x3df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"ref"
	.byte	0x2d
	.byte	0x47
	.long	0x452
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"n"
	.byte	0x2d
	.byte	0x53
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x6
	.long	.LASF69
	.byte	0x2e
	.byte	0x11
	.long	0x2cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x7
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x5
	.string	"i"
	.byte	0x2f
	.byte	0x11
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LASF70
	.byte	0x24
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x5e5
	.uleb128 0xa
	.long	.LASF65
	.byte	0x24
	.byte	0x2d
	.long	0x3df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"n"
	.byte	0x24
	.byte	0x3a
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x6
	.long	.LASF71
	.byte	0x25
	.byte	0x11
	.long	0x2cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.long	.LASF72
	.byte	0x26
	.byte	0x11
	.long	0x2cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x7
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x5
	.string	"i"
	.byte	0x27
	.byte	0x11
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	.LASF73
	.byte	0x1e
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x632
	.uleb128 0x2
	.string	"a"
	.byte	0x1e
	.byte	0x31
	.long	0x452
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"b"
	.byte	0x1e
	.byte	0x4c
	.long	0x452
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"c"
	.byte	0x1e
	.byte	0x61
	.long	0x3df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"n"
	.byte	0x1e
	.byte	0x6b
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0xb
	.long	.LASF74
	.byte	0x15
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x6ad
	.uleb128 0x2
	.string	"a"
	.byte	0x15
	.byte	0x2e
	.long	0x452
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"c"
	.byte	0x15
	.byte	0x43
	.long	0x3df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"n"
	.byte	0x15
	.byte	0x4d
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x6
	.long	.LASF75
	.byte	0x16
	.byte	0x11
	.long	0x2cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.long	.LASF76
	.byte	0x17
	.byte	0x11
	.long	0x2cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x7
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x5
	.string	"i"
	.byte	0x18
	.byte	0x11
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LASF83
	.byte	0x1
	.byte	0xc
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.string	"a"
	.byte	0xc
	.byte	0x31
	.long	0x452
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"b"
	.byte	0xc
	.byte	0x4c
	.long	0x452
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"c"
	.byte	0xc
	.byte	0x61
	.long	0x3df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.string	"n"
	.byte	0xc
	.byte	0x6b
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x5
	.string	"f1"
	.byte	0xd
	.byte	0x11
	.long	0x2cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.string	"f2"
	.byte	0xe
	.byte	0x11
	.long	0x2cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x7
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x5
	.string	"i"
	.byte	0xf
	.byte	0x11
	.long	0x33
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x90
	.uleb128 0xb
	.uleb128 0x91
	.uleb128 0x6
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0x6b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF51:
	.string	"float"
.LASF52:
	.string	"double"
.LASF78:
	.string	"_IO_FILE"
.LASF64:
	.string	"compute_summary"
.LASF25:
	.string	"_IO_save_end"
.LASF20:
	.string	"_IO_write_end"
.LASF7:
	.string	"short int"
.LASF9:
	.string	"size_t"
.LASF35:
	.string	"_offset"
.LASF19:
	.string	"_IO_write_ptr"
.LASF14:
	.string	"_flags"
.LASF21:
	.string	"_IO_buf_base"
.LASF69:
	.string	"norm"
.LASF26:
	.string	"_markers"
.LASF16:
	.string	"_IO_read_end"
.LASF39:
	.string	"_freeres_buf"
.LASF71:
	.string	"alpha"
.LASF76:
	.string	"bias"
.LASF82:
	.string	"free"
.LASF73:
	.string	"vector_math_engine"
.LASF6:
	.string	"signed char"
.LASF68:
	.string	"normalize_signal"
.LASF81:
	.string	"stderr"
.LASF55:
	.string	"_Float64"
.LASF34:
	.string	"_lock"
.LASF8:
	.string	"long int"
.LASF57:
	.string	"printf"
.LASF67:
	.string	"signal_filter_engine"
.LASF31:
	.string	"_cur_column"
.LASF60:
	.string	"argv"
.LASF32:
	.string	"_vtable_offset"
.LASF30:
	.string	"_old_offset"
.LASF53:
	.string	"long double"
.LASF77:
	.string	"GNU C23 15.2.0 -masm=intel -mtune=generic -march=x86-64 -g -O0 -fno-omit-frame-pointer -fno-optimize-sibling-calls -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection -fzero-init-padding-bits=all"
.LASF4:
	.string	"unsigned char"
.LASF40:
	.string	"_prevchain"
.LASF59:
	.string	"argc"
.LASF54:
	.string	"_Float32"
.LASF36:
	.string	"_codecvt"
.LASF50:
	.string	"long long unsigned int"
.LASF29:
	.string	"_short_backupbuf"
.LASF3:
	.string	"unsigned int"
.LASF46:
	.string	"_IO_marker"
.LASF33:
	.string	"_shortbuf"
.LASF74:
	.string	"scale_and_clamp"
.LASF18:
	.string	"_IO_write_base"
.LASF44:
	.string	"_unused2"
.LASF42:
	.string	"_unused3"
.LASF15:
	.string	"_IO_read_ptr"
.LASF75:
	.string	"gain"
.LASF22:
	.string	"_IO_buf_end"
.LASF13:
	.string	"char"
.LASF63:
	.string	"main"
.LASF37:
	.string	"_wide_data"
.LASF38:
	.string	"_freeres_list"
.LASF10:
	.string	"__uint64_t"
.LASF65:
	.string	"data"
.LASF72:
	.string	"beta"
.LASF2:
	.string	"long unsigned int"
.LASF66:
	.string	"init_dataset"
.LASF12:
	.string	"__off64_t"
.LASF41:
	.string	"_mode"
.LASF28:
	.string	"_fileno"
.LASF5:
	.string	"short unsigned int"
.LASF27:
	.string	"_chain"
.LASF48:
	.string	"_IO_wide_data"
.LASF70:
	.string	"apply_spatial_filter"
.LASF11:
	.string	"__off_t"
.LASF24:
	.string	"_IO_backup_base"
.LASF79:
	.string	"_flags2"
.LASF47:
	.string	"_IO_codecvt"
.LASF17:
	.string	"_IO_read_base"
.LASF62:
	.string	"iter"
.LASF56:
	.string	"_Float128"
.LASF61:
	.string	"total"
.LASF23:
	.string	"_IO_save_base"
.LASF43:
	.string	"_total_written"
.LASF45:
	.string	"FILE"
.LASF83:
	.string	"compute_fma_kernel"
.LASF58:
	.string	"posix_memalign"
.LASF49:
	.string	"long long int"
.LASF80:
	.string	"_IO_lock_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"src/main.c"
.LASF1:
	.string	"/mnt/c/Users/Stas/Desktop/lab2sys"
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
