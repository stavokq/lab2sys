	.file	"main.c"
	.intel_syntax noprefix
# GNU C23 (Ubuntu 15.2.0-16ubuntu1) version 15.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 15.2.0, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -D_FORTIFY_SOURCE=3 -mavx2 -mfma -masm=intel -mtune=generic -march=x86-64 -g -O3 -ffast-math -fno-omit-frame-pointer -fno-optimize-sibling-calls -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection -fzero-init-padding-bits=all
	.text
.Ltext0:
	.file 0 "/mnt/c/Users/Stas/Desktop/lab2sys" "src/main.c"
	.p2align 4
	.type	normalize_signal.constprop.0, @function
normalize_signal.constprop.0:
.LVL0:
.LFB71:
	.file 1 "src/main.c"
	.loc 1 45 6 view -0
	.cfi_startproc
	.loc 1 46 5 view .LVU1
	.loc 1 47 5 view .LVU2
.LBB8:
	.loc 1 47 10 view .LVU3
	.loc 1 47 26 discriminator 1 view .LVU4
	vbroadcastss	ymm2, DWORD PTR .LC1[rip]	# tmp113,
.LBE8:
# src/main.c:45: void normalize_signal(float *__restrict data, const float *__restrict ref, size_t n) {
	.loc 1 45 6 is_stmt 0 view .LVU5
	xor	eax, eax	# ivtmp.42
	vbroadcastss	ymm1, DWORD PTR .LC3[rip]	# tmp114,
.LVL1:
	.loc 1 45 6 view .LVU6
	.p2align 5
	.p2align 4
	.p2align 3
.L2:
.LBB9:
	.loc 1 48 9 is_stmt 1 view .LVU7
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 46 is_stmt 0 view .LVU8
	vmovups	ymm0, YMMWORD PTR [rsi+rax]	# tmp105, MEM <const vector(8) float> [(const float *)ref_6(D) + ivtmp.42_27 * 1]
	vfmadd213ps	ymm0, ymm2, YMMWORD PTR [rdi+rax]	# tmp105, tmp113, MEM <vector(8) float> [(float *)data_3(D) + ivtmp.42_27 * 1]
	vmulps	ymm0, ymm0, ymm1	# vect__11.35_13, tmp105, tmp114
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 17 view .LVU9
	vmovups	YMMWORD PTR [rdi+rax], ymm0	# MEM <vector(8) float> [(float *)data_3(D) + ivtmp.42_27 * 1], vect__11.35_13
	.loc 1 47 32 is_stmt 1 discriminator 3 view .LVU10
	.loc 1 47 26 discriminator 1 view .LVU11
	add	rax, 32	# ivtmp.42,
	cmp	rax, 67108864	# ivtmp.42,
	jne	.L2	#,
	vzeroupper
.LVL2:
.LBE9:
# src/main.c:50: }
	.loc 1 50 1 is_stmt 0 view .LVU12
	ret	
	.cfi_endproc
.LFE71:
	.size	normalize_signal.constprop.0, .-normalize_signal.constprop.0
	.p2align 4
	.type	apply_spatial_filter.constprop.0, @function
apply_spatial_filter.constprop.0:
.LVL3:
.LFB72:
	.loc 1 36 6 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 37 5 view .LVU14
	.loc 1 38 5 view .LVU15
	.loc 1 39 5 view .LVU16
.LBB11:
	.loc 1 39 10 view .LVU17
	.loc 1 39 26 discriminator 1 view .LVU18
	vmovss	xmm4, DWORD PTR .LC4[rip]	# tmp112,
	vmovss	xmm3, DWORD PTR .LC5[rip]	# tmp113,
	lea	rax, 4[rdi]	# ivtmp.62,
	add	rdi, 67108860	# _33,
.LVL4:
	.loc 1 39 26 is_stmt 0 discriminator 1 view .LVU19
	vmovss	xmm1, DWORD PTR -67108856[rdi]	# D__lsm0.52, MEM[(float *)data_4(D) + 4B]
	vmovss	xmm0, DWORD PTR -67108860[rdi]	# D__lsm0.53, *data_4(D)
.LVL5:
	.loc 1 39 26 discriminator 1 view .LVU20
	.p2align 6
	.p2align 4
	.p2align 3
.L6:
	.loc 1 40 9 is_stmt 1 view .LVU21
	vmovaps	xmm2, xmm1	# D__lsm0.52, D__lsm0.52
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 70 is_stmt 0 view .LVU22
	vmovss	xmm1, DWORD PTR 4[rax]	# D__lsm0.52, MEM[(float *)_31 + 4B]
# src/main.c:39:     for (size_t i = 1; i < n - 1; i++) {
	.loc 1 39 26 discriminator 1 view .LVU23
	add	rax, 4	# ivtmp.62,
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 56 view .LVU24
	vaddss	xmm0, xmm1, xmm0	# _26, D__lsm0.52, D__lsm0.53
	vmulss	xmm0, xmm0, xmm4	# _20, _26, tmp112
	vfmadd231ss	xmm0, xmm2, xmm3	# D__lsm0.53, D__lsm0.52, tmp113
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 17 view .LVU25
	vmovss	DWORD PTR -4[rax], xmm0	# MEM[(float *)_31], D__lsm0.53
	.loc 1 39 36 is_stmt 1 discriminator 3 view .LVU26
	.loc 1 39 26 discriminator 1 view .LVU27
	cmp	rax, rdi	# ivtmp.62, _33
	jne	.L6	#,
.LBE11:
# src/main.c:42: }
	.loc 1 42 1 is_stmt 0 view .LVU28
	ret	
	.cfi_endproc
.LFE72:
	.size	apply_spatial_filter.constprop.0, .-apply_spatial_filter.constprop.0
	.p2align 4
	.type	signal_filter_engine.constprop.0, @function
signal_filter_engine.constprop.0:
.LVL6:
.LFB73:
	.loc 1 53 6 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 54 5 view .LVU30
# src/main.c:53: void signal_filter_engine(float *__restrict c, const float *__restrict b, size_t n) {
	.loc 1 53 6 is_stmt 0 view .LVU31
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rdx, rdi	# c, c
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
# src/main.c:54:     apply_spatial_filter(c, n);
	.loc 1 54 5 view .LVU32
	call	apply_spatial_filter.constprop.0	#
.LVL7:
	.loc 1 55 5 is_stmt 1 view .LVU33
	mov	rdi, rdx	#, c
	call	normalize_signal.constprop.0	#
.LVL8:
# src/main.c:56: }
	.loc 1 56 1 is_stmt 0 view .LVU34
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE73:
	.size	signal_filter_engine.constprop.0, .-signal_filter_engine.constprop.0
	.p2align 4
	.type	scale_and_clamp.constprop.0, @function
scale_and_clamp.constprop.0:
.LVL9:
.LFB74:
	.loc 1 21 6 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 22 5 view .LVU36
	.loc 1 23 5 view .LVU37
	.loc 1 24 5 view .LVU38
.LBB13:
	.loc 1 24 10 view .LVU39
	.loc 1 24 26 discriminator 1 view .LVU40
	vbroadcastss	ymm2, DWORD PTR .LC7[rip]	# tmp113,
.LBE13:
# src/main.c:21: void scale_and_clamp(const float *__restrict a, float *__restrict c, size_t n) {
	.loc 1 21 6 is_stmt 0 view .LVU41
	xor	eax, eax	# ivtmp.88
	vbroadcastss	ymm1, DWORD PTR .LC9[rip]	# tmp114,
.LVL10:
	.loc 1 21 6 view .LVU42
	.p2align 5
	.p2align 4
	.p2align 3
.L11:
.LBB14:
	.loc 1 25 9 is_stmt 1 view .LVU43
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 35 is_stmt 0 view .LVU44
	vmulps	ymm0, ymm2, YMMWORD PTR [rdi+rax]	# vect__10.80_16, tmp113, MEM <const vector(8) float> [(const float *)a_7(D) + ivtmp.88_27 * 1]
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 14 view .LVU45
	vfmadd231ps	ymm0, ymm1, YMMWORD PTR [rsi+rax]	# tmp105, tmp114, MEM <vector(8) float> [(float *)c_3(D) + ivtmp.88_27 * 1]
	vmovups	YMMWORD PTR [rsi+rax], ymm0	# MEM <vector(8) float> [(float *)c_3(D) + ivtmp.88_27 * 1], tmp105
	.loc 1 24 32 is_stmt 1 discriminator 3 view .LVU46
	.loc 1 24 26 discriminator 1 view .LVU47
	add	rax, 32	# ivtmp.88,
	cmp	rax, 67108864	# ivtmp.88,
	jne	.L11	#,
	vzeroupper
.LVL11:
.LBE14:
# src/main.c:27: }
	.loc 1 27 1 is_stmt 0 view .LVU48
	ret	
	.cfi_endproc
.LFE74:
	.size	scale_and_clamp.constprop.0, .-scale_and_clamp.constprop.0
	.p2align 4
	.type	compute_fma_kernel.constprop.0, @function
compute_fma_kernel.constprop.0:
.LVL12:
.LFB75:
	.loc 1 12 6 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 13 5 view .LVU50
	.loc 1 14 5 view .LVU51
	.loc 1 15 5 view .LVU52
.LBB16:
	.loc 1 15 10 view .LVU53
	.loc 1 15 26 discriminator 1 view .LVU54
	vbroadcastss	ymm3, DWORD PTR .LC11[rip]	# tmp117,
.LBE16:
# src/main.c:12: void compute_fma_kernel(const float *__restrict a, const float *__restrict b, float *__restrict c, size_t n) {
	.loc 1 12 6 is_stmt 0 view .LVU55
	xor	eax, eax	# ivtmp.113
	vbroadcastss	ymm2, DWORD PTR .LC13[rip]	# tmp116,
.LVL13:
	.loc 1 12 6 view .LVU56
	.p2align 6
	.p2align 4
	.p2align 3
.L14:
.LBB17:
	.loc 1 16 9 is_stmt 1 view .LVU57
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 32 is_stmt 0 view .LVU58
	vmovups	ymm0, YMMWORD PTR [rsi+rax]	# MEM <const vector(8) float> [(const float *)b_7(D) + ivtmp.113_32 * 1], MEM <const vector(8) float> [(const float *)b_7(D) + ivtmp.113_32 * 1]
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU59
	vaddps	ymm1, ymm0, ymm3	# vect__24.104_20, MEM <const vector(8) float> [(const float *)b_7(D) + ivtmp.113_32 * 1], tmp117
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 36 view .LVU60
	vmulps	ymm0, ymm0, ymm2	# vect__10.100_27, MEM <const vector(8) float> [(const float *)b_7(D) + ivtmp.113_32 * 1], tmp116
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU61
	vfmadd231ps	ymm0, ymm1, YMMWORD PTR [rdi+rax]	# tmp108, vect__24.104_20, MEM <const vector(8) float> [(const float *)a_3(D) + ivtmp.113_32 * 1]
	vmovups	YMMWORD PTR [rdx+rax], ymm0	# MEM <vector(8) float> [(float *)c_13(D) + ivtmp.113_32 * 1], tmp108
	.loc 1 15 32 is_stmt 1 discriminator 3 view .LVU62
	.loc 1 15 26 discriminator 1 view .LVU63
	add	rax, 32	# ivtmp.113,
	cmp	rax, 67108864	# ivtmp.113,
	jne	.L14	#,
	vzeroupper
.LVL14:
.LBE17:
# src/main.c:18: }
	.loc 1 18 1 is_stmt 0 view .LVU64
	ret	
	.cfi_endproc
.LFE75:
	.size	compute_fma_kernel.constprop.0, .-compute_fma_kernel.constprop.0
	.p2align 4
	.type	vector_math_engine.constprop.0, @function
vector_math_engine.constprop.0:
.LVL15:
.LFB76:
	.loc 1 30 6 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 31 5 view .LVU66
# src/main.c:30: void vector_math_engine(const float *__restrict a, const float *__restrict b, float *__restrict c, size_t n) {
	.loc 1 30 6 is_stmt 0 view .LVU67
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
# src/main.c:31:     compute_fma_kernel(a, b, c, n);
	.loc 1 31 5 view .LVU68
	call	compute_fma_kernel.constprop.0	#
.LVL16:
	.loc 1 32 5 is_stmt 1 view .LVU69
	mov	rsi, rdx	#, c
.LVL17:
	.loc 1 32 5 is_stmt 0 view .LVU70
	call	scale_and_clamp.constprop.0	#
.LVL18:
# src/main.c:33: }
	.loc 1 33 1 view .LVU71
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE76:
	.size	vector_math_engine.constprop.0, .-vector_math_engine.constprop.0
	.p2align 4
	.globl	compute_fma_kernel
	.type	compute_fma_kernel, @function
compute_fma_kernel:
.LVL19:
.LFB62:
	.loc 1 12 110 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 12 110 is_stmt 0 view .LVU73
	endbr64	
	.loc 1 13 5 is_stmt 1 view .LVU74
.LVL20:
	.loc 1 14 5 view .LVU75
	.loc 1 15 5 view .LVU76
.LBB18:
	.loc 1 15 10 view .LVU77
	.loc 1 15 26 discriminator 1 view .LVU78
.LBE18:
# src/main.c:12: void compute_fma_kernel(const float *__restrict a, const float *__restrict b, float *__restrict c, size_t n) {
	.loc 1 12 110 is_stmt 0 view .LVU79
	mov	r8, rcx	# n, n
.LBB19:
# src/main.c:15:     for (size_t i = 0; i < n; i++) {
	.loc 1 15 26 discriminator 1 view .LVU80
	test	rcx, rcx	# n
	je	.L37	#,
	lea	rax, -1[rcx]	# _26,
	cmp	rax, 6	# _26,
	jbe	.L25	#,
	vbroadcastss	ymm3, DWORD PTR .LC11[rip]	# tmp196,
	shr	rcx, 3	# bnd.128_9,
.LVL21:
	.loc 1 15 26 discriminator 1 view .LVU81
	xor	eax, eax	# ivtmp.165
	vbroadcastss	ymm2, DWORD PTR .LC13[rip]	# tmp197,
	sal	rcx, 5	# _102,
.LVL22:
	.loc 1 15 26 discriminator 1 view .LVU82
	.p2align 6
	.p2align 4
	.p2align 3
.L21:
	.loc 1 16 9 is_stmt 1 view .LVU83
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 32 is_stmt 0 view .LVU84
	vmovups	ymm0, YMMWORD PTR [rsi+rax]	# MEM <const vector(8) float> [(const float *)b_17(D) + ivtmp.165_88 * 1], MEM <const vector(8) float> [(const float *)b_17(D) + ivtmp.165_88 * 1]
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU85
	vaddps	ymm1, ymm0, ymm3	# vect__13.138_52, MEM <const vector(8) float> [(const float *)b_17(D) + ivtmp.165_88 * 1], tmp196
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 36 view .LVU86
	vmulps	ymm0, ymm0, ymm2	# vect__7.134_48, MEM <const vector(8) float> [(const float *)b_17(D) + ivtmp.165_88 * 1], tmp197
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU87
	vfmadd231ps	ymm0, ymm1, YMMWORD PTR [rdi+rax]	# tmp158, vect__13.138_52, MEM <const vector(8) float> [(const float *)a_16(D) + ivtmp.165_88 * 1]
	vmovups	YMMWORD PTR [rdx+rax], ymm0	# MEM <vector(8) float> [(float *)c_18(D) + ivtmp.165_88 * 1], tmp158
	.loc 1 15 32 is_stmt 1 discriminator 3 view .LVU88
	.loc 1 15 26 discriminator 1 view .LVU89
	add	rax, 32	# ivtmp.165,
	cmp	rax, rcx	# ivtmp.165, _102
	jne	.L21	#,
	test	r8b, 7	# n,
	je	.L36	#,
	mov	rax, r8	# tmp.146, n
	and	rax, -8	# tmp.146,
	vzeroupper
.LVL23:
.L20:
	.loc 1 15 26 is_stmt 0 discriminator 1 view .LVU90
	mov	rcx, r8	# niters.143, n
	sub	rcx, rax	# niters.143, tmp.146
	lea	r9, -1[rcx]	# _79,
	cmp	r9, 2	# _79,
	jbe	.L23	#,
	.loc 1 16 9 is_stmt 1 view .LVU91
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 is_stmt 0 view .LVU92
	vbroadcastss	xmm0, DWORD PTR .LC11[rip]	# tmp173,
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 32 view .LVU93
	vmovups	xmm1, XMMWORD PTR [rsi+rax*4]	# MEM <const vector(4) float> [(const float *)vectp_b.148_85], MEM <const vector(4) float> [(const float *)vectp_b.148_85]
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 36 view .LVU94
	vbroadcastss	xmm2, DWORD PTR .LC13[rip]	# tmp176,
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU95
	vaddps	xmm0, xmm1, xmm0	# vect__35.154_96, MEM <const vector(4) float> [(const float *)vectp_b.148_85], tmp173
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 36 view .LVU96
	vmulps	xmm1, xmm1, xmm2	# vect__33.150_90, MEM <const vector(4) float> [(const float *)vectp_b.148_85], tmp176
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU97
	vfmadd132ps	xmm0, xmm1, XMMWORD PTR [rdi+rax*4]	# tmp169, vect__33.150_90, MEM <const vector(4) float> [(const float *)vectp_a.152_91]
	vmovups	XMMWORD PTR [rdx+rax*4], xmm0	# MEM <vector(4) float> [(float *)vectp_c.158_99], tmp169
	.loc 1 15 32 is_stmt 1 discriminator 3 view .LVU98
	.loc 1 15 26 discriminator 1 view .LVU99
	test	cl, 3	# niters.143,
	je	.L37	#,
	and	rcx, -4	# niters_vector_mult_vf.145_83,
	add	rax, rcx	# tmp.146, niters_vector_mult_vf.145_83
.L23:
.LVL24:
	.loc 1 16 9 view .LVU100
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 32 is_stmt 0 view .LVU101
	vmovss	xmm0, DWORD PTR [rsi+rax*4]	# _13, *_6
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU102
	vmovss	xmm1, DWORD PTR .LC11[rip]	# tmp181,
# src/main.c:15:     for (size_t i = 0; i < n; i++) {
	.loc 1 15 32 discriminator 3 view .LVU103
	lea	rcx, 1[rax]	# i_40,
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 36 view .LVU104
	vmovss	xmm3, DWORD PTR .LC13[rip]	# tmp183,
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU105
	vaddss	xmm2, xmm0, xmm1	# _12, _13, tmp181
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 36 view .LVU106
	vmulss	xmm0, xmm0, xmm3	# _10, _13, tmp183
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU107
	vfmadd231ss	xmm0, xmm2, DWORD PTR [rdi+rax*4]	# tmp179, _12, *_3
	vmovss	DWORD PTR [rdx+rax*4], xmm0	# *_11, tmp179
	.loc 1 15 32 is_stmt 1 discriminator 3 view .LVU108
	.loc 1 15 26 discriminator 1 view .LVU109
	cmp	rcx, r8	# i_40, n
	jnb	.L37	#,
	.loc 1 16 9 view .LVU110
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 32 is_stmt 0 view .LVU111
	vmovss	xmm0, DWORD PTR 4[rsi+rax*4]	# _33, *_34
# src/main.c:15:     for (size_t i = 0; i < n; i++) {
	.loc 1 15 32 discriminator 3 view .LVU112
	lea	rcx, 2[rax]	# i_100,
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU113
	vaddss	xmm2, xmm0, xmm1	# _32, _33, tmp181
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 36 view .LVU114
	vmulss	xmm0, xmm0, xmm3	# _29, _33, tmp183
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU115
	vfmadd231ss	xmm0, xmm2, DWORD PTR 4[rdi+rax*4]	# tmp185, _32, *_36
	vmovss	DWORD PTR 4[rdx+rax*4], xmm0	# *_27, tmp185
	.loc 1 15 32 is_stmt 1 discriminator 3 view .LVU116
	.loc 1 15 26 discriminator 1 view .LVU117
	cmp	rcx, r8	# i_100, n
	jnb	.L37	#,
	.loc 1 16 9 view .LVU118
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 32 is_stmt 0 view .LVU119
	vmovss	xmm0, DWORD PTR 8[rsi+rax*4]	# _68, *_67
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU120
	vaddss	xmm1, xmm0, xmm1	# _69, _68, tmp181
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 36 view .LVU121
	vmulss	xmm0, xmm0, xmm3	# _71, _68, tmp183
# src/main.c:16:         c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
	.loc 1 16 14 view .LVU122
	vfmadd132ss	xmm1, xmm0, DWORD PTR 8[rdi+rax*4]	# tmp191, _71, *_65
	vmovss	DWORD PTR 8[rdx+rax*4], xmm1	# *_72, tmp191
	.loc 1 15 32 is_stmt 1 discriminator 3 view .LVU123
	.loc 1 15 26 discriminator 1 view .LVU124
.LBE19:
# src/main.c:18: }
	.loc 1 18 1 is_stmt 0 view .LVU125
	ret	
.LVL25:
	.p2align 4,,10
	.p2align 3
.L36:
	.loc 1 18 1 view .LVU126
	vzeroupper
.LVL26:
.L37:
	.loc 1 18 1 view .LVU127
	ret	
.LVL27:
.L25:
.LBB20:
# src/main.c:15:     for (size_t i = 0; i < n; i++) {
	.loc 1 15 17 view .LVU128
	xor	eax, eax	# tmp.146
	jmp	.L20	#
.LBE20:
	.cfi_endproc
.LFE62:
	.size	compute_fma_kernel, .-compute_fma_kernel
	.p2align 4
	.globl	scale_and_clamp
	.type	scale_and_clamp, @function
scale_and_clamp:
.LVL28:
.LFB63:
	.loc 1 21 80 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 21 80 is_stmt 0 view .LVU130
	endbr64	
	.loc 1 22 5 is_stmt 1 view .LVU131
.LVL29:
	.loc 1 23 5 view .LVU132
	.loc 1 24 5 view .LVU133
.LBB21:
	.loc 1 24 10 view .LVU134
	.loc 1 24 26 discriminator 1 view .LVU135
.LBE21:
# src/main.c:21: void scale_and_clamp(const float *__restrict a, float *__restrict c, size_t n) {
	.loc 1 21 80 is_stmt 0 view .LVU136
	mov	rcx, rdx	# n, n
.LBB22:
# src/main.c:24:     for (size_t i = 0; i < n; i++) {
	.loc 1 24 26 discriminator 1 view .LVU137
	test	rdx, rdx	# n
	je	.L57	#,
	lea	rax, -1[rdx]	# _9,
	cmp	rax, 6	# _9,
	jbe	.L45	#,
	vbroadcastss	ymm2, DWORD PTR .LC7[rip]	# tmp184,
	shr	rdx, 3	# bnd.177_36,
.LVL30:
	.loc 1 24 26 discriminator 1 view .LVU138
	xor	eax, eax	# ivtmp.212
	vbroadcastss	ymm1, DWORD PTR .LC9[rip]	# tmp185,
	sal	rdx, 5	# _93,
.LVL31:
	.loc 1 24 26 discriminator 1 view .LVU139
	.p2align 5
	.p2align 4
	.p2align 3
.L41:
	.loc 1 25 9 is_stmt 1 view .LVU140
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 35 is_stmt 0 view .LVU141
	vmulps	ymm0, ymm2, YMMWORD PTR [rdi+rax]	# vect__7.187_47, tmp184, MEM <const vector(8) float> [(const float *)a_14(D) + ivtmp.212_80 * 1]
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 14 view .LVU142
	vfmadd231ps	ymm0, ymm1, YMMWORD PTR [rsi+rax]	# tmp147, tmp185, MEM <vector(8) float> [(float *)c_13(D) + ivtmp.212_80 * 1]
	vmovups	YMMWORD PTR [rsi+rax], ymm0	# MEM <vector(8) float> [(float *)c_13(D) + ivtmp.212_80 * 1], tmp147
	.loc 1 24 32 is_stmt 1 discriminator 3 view .LVU143
	.loc 1 24 26 discriminator 1 view .LVU144
	add	rax, 32	# ivtmp.212,
	cmp	rax, rdx	# ivtmp.212, _93
	jne	.L41	#,
	test	cl, 7	# n,
	je	.L56	#,
	mov	rax, rcx	# tmp.194, n
	and	rax, -8	# tmp.194,
	vzeroupper
.LVL32:
.L40:
	.loc 1 24 26 is_stmt 0 discriminator 1 view .LVU145
	mov	rdx, rcx	# niters.191, n
	sub	rdx, rax	# niters.191, tmp.194
	lea	r8, -1[rdx]	# _71,
	cmp	r8, 2	# _71,
	jbe	.L43	#,
	.loc 1 25 9 is_stmt 1 view .LVU146
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 35 is_stmt 0 view .LVU147
	vbroadcastss	xmm1, DWORD PTR .LC7[rip]	# tmp162,
	vmulps	xmm1, xmm1, XMMWORD PTR [rdi+rax*4]	# vect__24.202_88, tmp162, MEM <const vector(4) float> [(const float *)vectp_a.200_83]
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 14 view .LVU148
	vbroadcastss	xmm0, DWORD PTR .LC9[rip]	# tmp164,
	vfmadd132ps	xmm0, xmm1, XMMWORD PTR [rsi+rax*4]	# tmp157, vect__24.202_88, MEM <vector(4) float> [(float *)vectp_c.196_77]
	vmovups	XMMWORD PTR [rsi+rax*4], xmm0	# MEM <vector(4) float> [(float *)vectp_c.196_77], tmp157
	.loc 1 24 32 is_stmt 1 discriminator 3 view .LVU149
	.loc 1 24 26 discriminator 1 view .LVU150
	test	dl, 3	# niters.191,
	je	.L57	#,
	and	rdx, -4	# niters_vector_mult_vf.193_75,
	add	rax, rdx	# tmp.194, niters_vector_mult_vf.193_75
.L43:
.LVL33:
	.loc 1 25 9 view .LVU151
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 17 is_stmt 0 view .LVU152
	lea	rdx, 0[0+rax*4]	# _2,
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 35 view .LVU153
	vmovss	xmm2, DWORD PTR .LC7[rip]	# tmp170,
	vmulss	xmm0, xmm2, DWORD PTR [rdi+rax*4]	# _8, tmp170, *_6
# src/main.c:24:     for (size_t i = 0; i < n; i++) {
	.loc 1 24 32 discriminator 3 view .LVU154
	lea	r8, 1[rax]	# i_30,
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 14 view .LVU155
	vmovss	xmm1, DWORD PTR .LC9[rip]	# tmp171,
	vfmadd231ss	xmm0, xmm1, DWORD PTR [rsi+rdx]	# tmp167, tmp171, *_3
	vmovss	DWORD PTR [rsi+rdx], xmm0	# *_3, tmp167
	.loc 1 24 32 is_stmt 1 discriminator 3 view .LVU156
	.loc 1 24 26 discriminator 1 view .LVU157
	cmp	r8, rcx	# i_30, n
	jnb	.L57	#,
	.loc 1 25 9 view .LVU158
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 35 is_stmt 0 view .LVU159
	vmulss	xmm0, xmm2, DWORD PTR 4[rdi+rdx]	# _10, tmp170, *_23
# src/main.c:24:     for (size_t i = 0; i < n; i++) {
	.loc 1 24 32 discriminator 3 view .LVU160
	add	rax, 2	# i_91,
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 14 view .LVU161
	vfmadd231ss	xmm0, xmm1, DWORD PTR 4[rsi+rdx]	# tmp173, tmp171, *_26
	vmovss	DWORD PTR 4[rsi+rdx], xmm0	# *_26, tmp173
	.loc 1 24 32 is_stmt 1 discriminator 3 view .LVU162
	.loc 1 24 26 discriminator 1 view .LVU163
	cmp	rax, rcx	# i_91, n
	jnb	.L57	#,
	.loc 1 25 9 view .LVU164
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 35 is_stmt 0 view .LVU165
	vmulss	xmm2, xmm2, DWORD PTR 8[rdi+rdx]	# _64, tmp170, *_62
# src/main.c:25:         c[i] = c[i] * gain + a[i] * bias;
	.loc 1 25 14 view .LVU166
	vfmadd132ss	xmm1, xmm2, DWORD PTR 8[rsi+rdx]	# tmp179, _64, *_59
	vmovss	DWORD PTR 8[rsi+rdx], xmm1	# *_59, tmp179
	.loc 1 24 32 is_stmt 1 discriminator 3 view .LVU167
	.loc 1 24 26 discriminator 1 view .LVU168
.LBE22:
# src/main.c:27: }
	.loc 1 27 1 is_stmt 0 view .LVU169
	ret	
.LVL34:
	.p2align 4,,10
	.p2align 3
.L56:
	.loc 1 27 1 view .LVU170
	vzeroupper
.LVL35:
.L57:
	.loc 1 27 1 view .LVU171
	ret	
.LVL36:
.L45:
.LBB23:
# src/main.c:24:     for (size_t i = 0; i < n; i++) {
	.loc 1 24 17 view .LVU172
	xor	eax, eax	# tmp.194
	jmp	.L40	#
.LBE23:
	.cfi_endproc
.LFE63:
	.size	scale_and_clamp, .-scale_and_clamp
	.p2align 4
	.globl	vector_math_engine
	.type	vector_math_engine, @function
vector_math_engine:
.LVL37:
.LFB64:
	.loc 1 30 110 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 30 110 is_stmt 0 view .LVU174
	endbr64	
	.loc 1 31 5 is_stmt 1 view .LVU175
# src/main.c:30: void vector_math_engine(const float *__restrict a, const float *__restrict b, float *__restrict c, size_t n) {
	.loc 1 30 110 is_stmt 0 view .LVU176
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	r11, rcx	# n, n
	mov	r10, rdx	# c, c
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
# src/main.c:31:     compute_fma_kernel(a, b, c, n);
	.loc 1 31 5 view .LVU177
	call	compute_fma_kernel	#
.LVL38:
	.loc 1 32 5 is_stmt 1 view .LVU178
	mov	rdx, r11	#, n
.LVL39:
	.loc 1 32 5 is_stmt 0 view .LVU179
	mov	rsi, r10	#, c
.LVL40:
	.loc 1 32 5 view .LVU180
	call	scale_and_clamp	#
.LVL41:
# src/main.c:33: }
	.loc 1 33 1 view .LVU181
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE64:
	.size	vector_math_engine, .-vector_math_engine
	.p2align 4
	.globl	apply_spatial_filter
	.type	apply_spatial_filter, @function
apply_spatial_filter:
.LVL42:
.LFB65:
	.loc 1 36 61 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 36 61 is_stmt 0 view .LVU183
	endbr64	
	.loc 1 37 5 is_stmt 1 view .LVU184
.LVL43:
	.loc 1 38 5 view .LVU185
	.loc 1 39 5 view .LVU186
.LBB24:
	.loc 1 39 10 view .LVU187
	.loc 1 39 26 discriminator 1 view .LVU188
# src/main.c:39:     for (size_t i = 1; i < n - 1; i++) {
	.loc 1 39 30 is_stmt 0 discriminator 1 view .LVU189
	lea	rax, -1[rsi]	# _26,
# src/main.c:39:     for (size_t i = 1; i < n - 1; i++) {
	.loc 1 39 26 discriminator 1 view .LVU190
	cmp	rax, 1	# _26,
	jbe	.L64	#,
	vmovss	xmm1, DWORD PTR 4[rdi]	# D__lsm0.224, MEM[(float *)data_22(D) + 4B]
	vmovss	xmm0, DWORD PTR [rdi]	# D__lsm0.225, *data_22(D)
	lea	rax, 4[rdi]	# ivtmp.231,
	lea	rdx, -4[rdi+rsi*4]	# _36,
	vmovss	xmm4, DWORD PTR .LC4[rip]	# tmp119,
	vmovss	xmm3, DWORD PTR .LC5[rip]	# tmp120,
.LVL44:
	.loc 1 39 26 discriminator 1 view .LVU191
	.p2align 6
	.p2align 4
	.p2align 3
.L62:
	.loc 1 40 9 is_stmt 1 view .LVU192
	vmovaps	xmm2, xmm1	# D__lsm0.224, D__lsm0.224
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 70 is_stmt 0 view .LVU193
	vmovss	xmm1, DWORD PTR 4[rax]	# D__lsm0.224, MEM[(float *)_35 + 4B]
# src/main.c:39:     for (size_t i = 1; i < n - 1; i++) {
	.loc 1 39 26 discriminator 1 view .LVU194
	add	rax, 4	# ivtmp.231,
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 56 view .LVU195
	vaddss	xmm0, xmm1, xmm0	# _16, D__lsm0.224, D__lsm0.225
	vmulss	xmm0, xmm0, xmm4	# _18, _16, tmp119
	vfmadd231ss	xmm0, xmm2, xmm3	# D__lsm0.225, D__lsm0.224, tmp120
# src/main.c:40:         data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
	.loc 1 40 17 view .LVU196
	vmovss	DWORD PTR -4[rax], xmm0	# MEM[(float *)_35], D__lsm0.225
	.loc 1 39 36 is_stmt 1 discriminator 3 view .LVU197
	.loc 1 39 26 discriminator 1 view .LVU198
	cmp	rax, rdx	# ivtmp.231, _36
	jne	.L62	#,
.L64:
.LBE24:
# src/main.c:42: }
	.loc 1 42 1 is_stmt 0 view .LVU199
	ret	
	.cfi_endproc
.LFE65:
	.size	apply_spatial_filter, .-apply_spatial_filter
	.p2align 4
	.globl	normalize_signal
	.type	normalize_signal, @function
normalize_signal:
.LVL45:
.LFB66:
	.loc 1 45 86 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 45 86 is_stmt 0 view .LVU201
	endbr64	
	.loc 1 46 5 is_stmt 1 view .LVU202
.LVL46:
	.loc 1 47 5 view .LVU203
.LBB25:
	.loc 1 47 10 view .LVU204
	.loc 1 47 26 discriminator 1 view .LVU205
.LBE25:
# src/main.c:45: void normalize_signal(float *__restrict data, const float *__restrict ref, size_t n) {
	.loc 1 45 86 is_stmt 0 view .LVU206
	mov	rcx, rdx	# n, n
.LBB26:
# src/main.c:47:     for (size_t i = 0; i < n; i++) {
	.loc 1 47 26 discriminator 1 view .LVU207
	test	rdx, rdx	# n
	je	.L84	#,
	lea	rax, -1[rdx]	# _9,
	cmp	rax, 6	# _9,
	jbe	.L72	#,
	vbroadcastss	ymm2, DWORD PTR .LC1[rip]	# tmp181,
	shr	rdx, 3	# bnd.240_36,
.LVL47:
	.loc 1 47 26 discriminator 1 view .LVU208
	xor	eax, eax	# ivtmp.275
	vbroadcastss	ymm1, DWORD PTR .LC3[rip]	# tmp182,
	sal	rdx, 5	# _93,
.LVL48:
	.loc 1 47 26 discriminator 1 view .LVU209
	.p2align 5
	.p2align 4
	.p2align 3
.L68:
	.loc 1 48 9 is_stmt 1 view .LVU210
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 46 is_stmt 0 view .LVU211
	vmovups	ymm0, YMMWORD PTR [rsi+rax]	# tmp147, MEM <const vector(8) float> [(const float *)ref_14(D) + ivtmp.275_80 * 1]
	vfmadd213ps	ymm0, ymm2, YMMWORD PTR [rdi+rax]	# tmp147, tmp181, MEM <vector(8) float> [(float *)data_13(D) + ivtmp.275_80 * 1]
	vmulps	ymm0, ymm0, ymm1	# vect__8.251_48, tmp147, tmp182
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 17 view .LVU212
	vmovups	YMMWORD PTR [rdi+rax], ymm0	# MEM <vector(8) float> [(float *)data_13(D) + ivtmp.275_80 * 1], vect__8.251_48
	.loc 1 47 32 is_stmt 1 discriminator 3 view .LVU213
	.loc 1 47 26 discriminator 1 view .LVU214
	add	rax, 32	# ivtmp.275,
	cmp	rax, rdx	# ivtmp.275, _93
	jne	.L68	#,
	test	cl, 7	# n,
	je	.L83	#,
	mov	rax, rcx	# tmp.257, n
	and	rax, -8	# tmp.257,
	vzeroupper
.LVL49:
.L67:
	.loc 1 47 26 is_stmt 0 discriminator 1 view .LVU215
	mov	rdx, rcx	# niters.254, n
	sub	rdx, rax	# niters.254, tmp.257
	lea	r8, -1[rdx]	# _71,
	cmp	r8, 2	# _71,
	jbe	.L70	#,
	.loc 1 48 9 is_stmt 1 view .LVU216
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 46 is_stmt 0 view .LVU217
	vbroadcastss	xmm0, DWORD PTR .LC1[rip]	# tmp161,
	vmovups	xmm3, XMMWORD PTR [rdi+rax*4]	# tmp191, MEM <vector(4) float> [(float *)vectp_data.259_77]
	vbroadcastss	xmm1, DWORD PTR .LC3[rip]	# tmp164,
	vfmadd132ps	xmm0, xmm3, XMMWORD PTR [rsi+rax*4]	# tmp157, tmp191, MEM <const vector(4) float> [(const float *)vectp_ref.262_82]
	vmulps	xmm0, xmm0, xmm1	# vect__23.266_89, tmp157, tmp164
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 17 view .LVU218
	vmovups	XMMWORD PTR [rdi+rax*4], xmm0	# MEM <vector(4) float> [(float *)vectp_data.259_77], vect__23.266_89
	.loc 1 47 32 is_stmt 1 discriminator 3 view .LVU219
	.loc 1 47 26 discriminator 1 view .LVU220
	test	dl, 3	# niters.254,
	je	.L84	#,
	and	rdx, -4	# niters_vector_mult_vf.256_75,
	add	rax, rdx	# tmp.257, niters_vector_mult_vf.256_75
.L70:
.LVL50:
	.loc 1 48 9 view .LVU221
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 24 is_stmt 0 view .LVU222
	lea	rdx, 0[0+rax*4]	# _2,
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 46 view .LVU223
	vmovss	xmm0, DWORD PTR .LC1[rip]	# tmp168,
# src/main.c:47:     for (size_t i = 0; i < n; i++) {
	.loc 1 47 32 discriminator 3 view .LVU224
	lea	r8, 1[rax]	# i_30,
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 46 view .LVU225
	vmovss	xmm1, DWORD PTR [rsi+rax*4]	# tmp167, *_5
	vfmadd213ss	xmm1, xmm0, DWORD PTR [rdi+rdx]	# tmp167, tmp168, *_3
	vmovss	xmm2, DWORD PTR .LC3[rip]	# tmp170,
	vmulss	xmm1, xmm1, xmm2	# _16, tmp167, tmp170
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 17 view .LVU226
	vmovss	DWORD PTR [rdi+rdx], xmm1	# *_3, _16
	.loc 1 47 32 is_stmt 1 discriminator 3 view .LVU227
	.loc 1 47 26 discriminator 1 view .LVU228
	cmp	r8, rcx	# i_30, n
	jnb	.L84	#,
	.loc 1 48 9 view .LVU229
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 46 is_stmt 0 view .LVU230
	vmovss	xmm1, DWORD PTR 4[rsi+rdx]	# tmp172, *_24
	vfmadd213ss	xmm1, xmm0, DWORD PTR 4[rdi+rdx]	# tmp172, tmp168, *_26
# src/main.c:47:     for (size_t i = 0; i < n; i++) {
	.loc 1 47 32 discriminator 3 view .LVU231
	add	rax, 2	# i_91,
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 46 view .LVU232
	vmulss	xmm1, xmm1, xmm2	# _69, tmp172, tmp170
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 17 view .LVU233
	vmovss	DWORD PTR 4[rdi+rdx], xmm1	# *_26, _69
	.loc 1 47 32 is_stmt 1 discriminator 3 view .LVU234
	.loc 1 47 26 discriminator 1 view .LVU235
	cmp	rax, rcx	# i_91, n
	jnb	.L84	#,
	.loc 1 48 9 view .LVU236
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 46 is_stmt 0 view .LVU237
	vmovss	xmm4, DWORD PTR 8[rdi+rdx]	# tmp194, *_59
	vfmadd132ss	xmm0, xmm4, DWORD PTR 8[rsi+rdx]	# tmp177, tmp194, *_61
	vmulss	xmm0, xmm0, xmm2	# _65, tmp177, tmp170
# src/main.c:48:         data[i] = (data[i] + ref[i] * 0.05f) * norm;
	.loc 1 48 17 view .LVU238
	vmovss	DWORD PTR 8[rdi+rdx], xmm0	# *_59, _65
	.loc 1 47 32 is_stmt 1 discriminator 3 view .LVU239
	.loc 1 47 26 discriminator 1 view .LVU240
.LBE26:
# src/main.c:50: }
	.loc 1 50 1 is_stmt 0 view .LVU241
	ret	
.LVL51:
	.p2align 4,,10
	.p2align 3
.L83:
	.loc 1 50 1 view .LVU242
	vzeroupper
.LVL52:
.L84:
	.loc 1 50 1 view .LVU243
	ret	
.LVL53:
.L72:
.LBB27:
# src/main.c:47:     for (size_t i = 0; i < n; i++) {
	.loc 1 47 17 view .LVU244
	xor	eax, eax	# tmp.257
	jmp	.L67	#
.LBE27:
	.cfi_endproc
.LFE66:
	.size	normalize_signal, .-normalize_signal
	.p2align 4
	.globl	signal_filter_engine
	.type	signal_filter_engine, @function
signal_filter_engine:
.LVL54:
.LFB67:
	.loc 1 53 85 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 53 85 is_stmt 0 view .LVU246
	endbr64	
	.loc 1 54 5 is_stmt 1 view .LVU247
# src/main.c:53: void signal_filter_engine(float *__restrict c, const float *__restrict b, size_t n) {
	.loc 1 53 85 is_stmt 0 view .LVU248
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	r8, rsi	# b, b
	mov	rcx, rdx	# n, n
# src/main.c:54:     apply_spatial_filter(c, n);
	.loc 1 54 5 view .LVU249
	mov	rsi, rdx	#, n
.LVL55:
# src/main.c:53: void signal_filter_engine(float *__restrict c, const float *__restrict b, size_t n) {
	.loc 1 53 85 view .LVU250
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
# src/main.c:54:     apply_spatial_filter(c, n);
	.loc 1 54 5 view .LVU251
	call	apply_spatial_filter	#
.LVL56:
	.loc 1 55 5 is_stmt 1 view .LVU252
	mov	rdx, rcx	#, n
	mov	rsi, r8	#, b
	call	normalize_signal	#
.LVL57:
# src/main.c:56: }
	.loc 1 56 1 is_stmt 0 view .LVU253
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE67:
	.size	signal_filter_engine, .-signal_filter_engine
	.p2align 4
	.globl	init_dataset
	.type	init_dataset, @function
init_dataset:
.LVL58:
.LFB68:
	.loc 1 59 92 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 59 92 is_stmt 0 view .LVU255
	endbr64	
	.loc 1 60 5 is_stmt 1 view .LVU256
.LBB28:
	.loc 1 60 10 view .LVU257
.LVL59:
	.loc 1 60 26 discriminator 1 view .LVU258
	test	rcx, rcx	# n
	je	.L98	#,
.LBE28:
# src/main.c:59: void init_dataset(float *__restrict a, float *__restrict b, float *__restrict c, size_t n) {
	.loc 1 59 92 is_stmt 0 view .LVU259
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	vmovss	xmm3, DWORD PTR .LC20[rip]	# tmp157,
	mov	r8, rdi	# a, a
	mov	r9, rcx	# n, n
	vmovss	xmm2, DWORD PTR .LC21[rip]	# tmp158,
	mov	rdi, rdx	# c, c
.LVL60:
	.loc 1 59 92 view .LVU260
	vxorps	xmm1, xmm1, xmm1	# tmp165
.LBB29:
# src/main.c:60:     for (size_t i = 0; i < n; i++) {
	.loc 1 60 17 view .LVU261
	xor	ecx, ecx	# _31
.LVL61:
# src/main.c:61:         a[i] = (float)(i % 100) * 0.01f + 1.0f;
	.loc 1 61 26 view .LVU262
	movabs	r10, 2951479051793528259	# tmp119,
.LBE29:
# src/main.c:59: void init_dataset(float *__restrict a, float *__restrict b, float *__restrict c, size_t n) {
	.loc 1 59 92 view .LVU263
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
.LVL62:
	.loc 1 59 92 view .LVU264
	.p2align 6
	.p2align 4
	.p2align 3
.L89:
.LVL63:
.LBB30:
	.loc 1 61 9 is_stmt 1 view .LVU265
# src/main.c:61:         a[i] = (float)(i % 100) * 0.01f + 1.0f;
	.loc 1 61 26 is_stmt 0 view .LVU266
	mov	rdx, rcx	# tmp117, _31
	shr	rdx, 2	# tmp117,
	mov	rax, rdx	# tmp117, tmp117
	mul	r10	# tmp119
	mov	rax, rcx	# _39, _31
	shr	rdx, 2	# tmp116,
	imul	rdx, rdx, 100	# tmp120, tmp116,
	sub	rax, rdx	# _39, tmp120
# src/main.c:61:         a[i] = (float)(i % 100) * 0.01f + 1.0f;
	.loc 1 61 16 view .LVU267
	vcvtsi2ss	xmm0, xmm1, rax	# tmp166, tmp165, _39
# src/main.c:61:         a[i] = (float)(i % 100) * 0.01f + 1.0f;
	.loc 1 61 14 view .LVU268
	vfmadd132ss	xmm0, xmm2, xmm3	# tmp115, tmp158, tmp157
	vmovss	DWORD PTR [r8+rcx*4], xmm0	# MEM[(float *)a_19(D) + i_41 * 4], tmp115
	.loc 1 62 9 is_stmt 1 view .LVU269
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 27 is_stmt 0 view .LVU270
	add	rcx, 1	# _31,
.LVL64:
	.loc 1 63 9 is_stmt 1 view .LVU271
	.loc 1 60 32 discriminator 3 view .LVU272
	.loc 1 60 26 discriminator 1 view .LVU273
	cmp	r9, rcx	# n, _31
	jne	.L89	#,
	vmovss	xmm3, DWORD PTR .LC22[rip]	# tmp159,
# src/main.c:60:     for (size_t i = 0; i < n; i++) {
	.loc 1 60 17 is_stmt 0 view .LVU274
	xor	r8d, r8d	# i
.LVL65:
	.loc 1 60 17 view .LVU275
	vmovss	xmm2, DWORD PTR .LC5[rip]	# tmp160,
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 32 view .LVU276
	movabs	r9, -6640827866535438581	# tmp137,
.LVL66:
	.loc 1 62 32 view .LVU277
	.p2align 6
	.p2align 4
	.p2align 3
.L90:
.LVL67:
	.loc 1 61 9 is_stmt 1 view .LVU278
	.loc 1 62 9 view .LVU279
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 27 is_stmt 0 view .LVU280
	add	r8, 1	# i,
.LVL68:
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 32 view .LVU281
	mov	rdx, r8	# tmp135, i
	shr	rdx	# tmp135
	mov	rax, rdx	# tmp135, tmp135
	mul	r9	# tmp137
	mov	rax, r8	# _59, i
	shr	rdx, 4	# tmp134,
	imul	rdx, rdx, 50	# tmp138, tmp134,
	sub	rax, rdx	# _59, tmp138
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 16 view .LVU282
	vcvtsi2ss	xmm0, xmm1, rax	# tmp167, tmp165, _59
# src/main.c:62:         b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
	.loc 1 62 14 view .LVU283
	vfmadd132ss	xmm0, xmm2, xmm3	# tmp133, tmp160, tmp159
	vmovss	DWORD PTR -4[rsi+r8*4], xmm0	# MEM[(float *)b_21(D) + -4B + _58 * 4], tmp133
	.loc 1 63 9 is_stmt 1 view .LVU284
	.loc 1 60 32 discriminator 3 view .LVU285
.LVL69:
	.loc 1 60 26 discriminator 1 view .LVU286
	cmp	rcx, r8	# _31, i
	jne	.L90	#,
# src/main.c:63:         c[i] = 0.0f;
	.loc 1 63 14 is_stmt 0 view .LVU287
	lea	rdx, 0[0+rcx*4]	# _68,
	xor	esi, esi	#
.LVL70:
	.loc 1 63 14 view .LVU288
	call	memset@PLT	#
.LVL71:
	.loc 1 63 14 view .LVU289
.LBE30:
# src/main.c:65: }
	.loc 1 65 1 view .LVU290
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
.LVL72:
	.p2align 4,,10
	.p2align 3
.L98:
	.cfi_restore 6
	.loc 1 65 1 view .LVU291
	ret	
	.cfi_endproc
.LFE68:
	.size	init_dataset, .-init_dataset
	.p2align 4
	.globl	compute_summary
	.type	compute_summary, @function
compute_summary:
.LVL73:
.LFB69:
	.loc 1 68 64 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 68 64 is_stmt 0 view .LVU293
	endbr64	
	.loc 1 69 5 is_stmt 1 view .LVU294
	.loc 1 70 5 view .LVU295
.LBB31:
	.loc 1 70 10 view .LVU296
.LVL74:
	.loc 1 70 26 discriminator 1 view .LVU297
	test	rsi, rsi	# n
	je	.L109	#,
	lea	rax, -1[rsi]	# _5,
	cmp	rax, 6	# _5,
	jbe	.L110	#,
	mov	rdx, rsi	# bnd.300_27, n
	mov	rax, rdi	# ivtmp.326, data
	vxorpd	xmm2, xmm2, xmm2	# vect_sum_10.308
	shr	rdx, 3	# bnd.300_27,
	sal	rdx, 5	# _30,
	add	rdx, rdi	# _55, data
.LVL75:
	.loc 1 70 26 is_stmt 0 discriminator 1 view .LVU298
	.p2align 6
	.p2align 4
	.p2align 3
.L104:
	.loc 1 71 9 is_stmt 1 view .LVU299
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 28 is_stmt 0 view .LVU300
	vmovups	ymm0, YMMWORD PTR [rax]	# MEM <const vector(8) float> [(const float *)_14], MEM <const vector(8) float> [(const float *)_14]
	add	rax, 32	# ivtmp.326,
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 16 view .LVU301
	vcvtps2pd	ymm1, xmm0	# vect__4.306_34, MEM <const vector(8) float> [(const float *)_14]
	vextractf128	xmm0, ymm0, 0x1	# tmp148, MEM <const vector(8) float> [(const float *)_14]
	vcvtps2pd	ymm0, xmm0	# vect__4.306_35, tmp148
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 13 view .LVU302
	vaddpd	ymm0, ymm1, ymm0	# _31, vect__4.306_34, vect__4.306_35
	vaddpd	ymm2, ymm2, ymm0	# vect_sum_10.308, vect_sum_10.308, _31
	.loc 1 70 32 is_stmt 1 discriminator 3 view .LVU303
	.loc 1 70 26 discriminator 1 view .LVU304
	cmp	rax, rdx	# ivtmp.326, _55
	jne	.L104	#,
	vextractf128	xmm1, ymm2, 0x1	# tmp150, vect_sum_10.308
	vaddpd	xmm1, xmm1, xmm2	# tmp152, tmp150, tmp151
	vunpckhpd	xmm0, xmm1, xmm1	# tmp154, tmp152, tmp152
	vaddpd	xmm0, xmm0, xmm1	# tmp153, tmp154, tmp152
	test	sil, 7	# n,
	je	.L118	#,
	mov	rax, rsi	# tmp.313, n
	and	rax, -8	# tmp.313,
	vzeroupper
.LVL76:
.L103:
	.loc 1 70 26 is_stmt 0 discriminator 1 view .LVU305
	mov	rdx, rsi	# niters.310, n
	sub	rdx, rax	# niters.310, tmp.313
	lea	rcx, -1[rdx]	# _56,
	cmp	rcx, 2	# _56,
	jbe	.L107	#,
	.loc 1 71 9 is_stmt 1 view .LVU306
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 28 is_stmt 0 view .LVU307
	vmovups	xmm3, XMMWORD PTR [rdi+rax*4]	# MEM <const vector(4) float> [(const float *)vectp_data.315_62], MEM <const vector(4) float> [(const float *)vectp_data.315_62]
	.loc 1 70 32 is_stmt 1 discriminator 3 view .LVU308
	.loc 1 70 26 discriminator 1 view .LVU309
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 16 is_stmt 0 view .LVU310
	vxorps	xmm2, xmm2, xmm2	# tmp162
	vcvtps2pd	xmm0, xmm3	# vect__18.317_67, MEM <const vector(4) float> [(const float *)vectp_data.315_62]
	vmovhlps	xmm2, xmm2, xmm3	# tmp162, tmp162, MEM <const vector(4) float> [(const float *)vectp_data.315_62]
	vcvtps2pd	xmm2, xmm2	# vect__18.317_68, tmp162
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 13 view .LVU311
	vaddpd	xmm0, xmm0, xmm2	# _39, vect__18.317_67, vect__18.317_68
	vaddpd	xmm1, xmm0, xmm1	# vect_sum_17.319_75, _39, _71
	vunpckhpd	xmm0, xmm1, xmm1	# tmp166, vect_sum_17.319_75, vect_sum_17.319_75
	vaddpd	xmm0, xmm0, xmm1	# tmp165, tmp166, vect_sum_17.319_75
	test	dl, 3	# niters.310,
	je	.L101	#,
	and	rdx, -4	# niters_vector_mult_vf.312_60,
	add	rax, rdx	# tmp.313, niters_vector_mult_vf.312_60
.L107:
.LVL77:
	.loc 1 71 9 is_stmt 1 view .LVU312
	vxorps	xmm1, xmm1, xmm1	# tmp177
# src/main.c:70:     for (size_t i = 0; i < n; i++) {
	.loc 1 70 32 is_stmt 0 discriminator 3 view .LVU313
	lea	rdx, 1[rax]	# i_11,
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 16 view .LVU314
	vcvtss2sd	xmm2, xmm1, DWORD PTR [rdi+rax*4]	# tmp178, tmp177, *_2
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 13 view .LVU315
	vaddsd	xmm0, xmm0, xmm2	# <retval>, <retval>, _4
.LVL78:
	.loc 1 70 32 is_stmt 1 discriminator 3 view .LVU316
	.loc 1 70 26 discriminator 1 view .LVU317
	cmp	rdx, rsi	# i_11, n
	jnb	.L101	#,
	.loc 1 71 9 view .LVU318
# src/main.c:70:     for (size_t i = 0; i < n; i++) {
	.loc 1 70 32 is_stmt 0 discriminator 3 view .LVU319
	lea	rdx, 2[rax]	# i_13,
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 16 view .LVU320
	vcvtss2sd	xmm2, xmm1, DWORD PTR 4[rdi+rax*4]	# tmp179, tmp177, *_20
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 13 view .LVU321
	vaddsd	xmm0, xmm0, xmm2	# <retval>, <retval>, _18
.LVL79:
	.loc 1 70 32 is_stmt 1 discriminator 3 view .LVU322
	.loc 1 70 26 discriminator 1 view .LVU323
	cmp	rdx, rsi	# i_13, n
	jnb	.L101	#,
	.loc 1 71 9 view .LVU324
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 16 is_stmt 0 view .LVU325
	vcvtss2sd	xmm1, xmm1, DWORD PTR 8[rdi+rax*4]	# tmp180, tmp177, *_48
# src/main.c:71:         sum += (double)data[i];
	.loc 1 71 13 view .LVU326
	vaddsd	xmm0, xmm0, xmm1	# <retval>, <retval>, _50
.LVL80:
	.loc 1 70 32 is_stmt 1 discriminator 3 view .LVU327
	.loc 1 70 26 discriminator 1 view .LVU328
	ret	
.LVL81:
	.p2align 4,,10
	.p2align 3
.L118:
	.loc 1 70 26 is_stmt 0 discriminator 1 view .LVU329
	vzeroupper
.LVL82:
.L101:
.LBE31:
# src/main.c:74: }
	.loc 1 74 1 view .LVU330
	ret	
.LVL83:
	.p2align 4,,10
	.p2align 3
.L109:
# src/main.c:69:     double sum = 0.0;
	.loc 1 69 12 view .LVU331
	vxorpd	xmm0, xmm0, xmm0	# <retval>
	.loc 1 73 5 is_stmt 1 view .LVU332
# src/main.c:73:     return sum;
	.loc 1 73 12 is_stmt 0 view .LVU333
	ret	
.L110:
.LBB32:
# src/main.c:70:     for (size_t i = 0; i < n; i++) {
	.loc 1 70 26 discriminator 1 view .LVU334
	vxorpd	xmm1, xmm1, xmm1	# _71
# src/main.c:70:     for (size_t i = 0; i < n; i++) {
	.loc 1 70 17 view .LVU335
	xor	eax, eax	# tmp.313
.LBE32:
# src/main.c:69:     double sum = 0.0;
	.loc 1 69 12 view .LVU336
	vxorpd	xmm0, xmm0, xmm0	# <retval>
	jmp	.L103	#
	.cfi_endproc
.LFE69:
	.size	compute_summary, .-compute_summary
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC24:
	.string	"Memory allocation error\n"
.LC25:
	.string	"Result: %.4f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LVL84:
.LFB70:
	.loc 1 76 33 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 76 33 is_stmt 0 view .LVU338
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# src/main.c:84:     if (posix_memalign((void**)&a, 32, DATA_SIZE * sizeof(float)) != 0 ||
	.loc 1 84 9 view .LVU339
	mov	edx, 67108864	#,
	mov	esi, 32	#,
.LVL85:
# src/main.c:76: int main(int argc, char **argv) {
	.loc 1 76 33 view .LVU340
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	r14	#
	push	r13	#
	push	r12	#
	push	rbx	#
	sub	rsp, 32	#,
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
# src/main.c:84:     if (posix_memalign((void**)&a, 32, DATA_SIZE * sizeof(float)) != 0 ||
	.loc 1 84 9 view .LVU341
	mov	rdi, QWORD PTR fs:40	# tmp111, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -40[rbp], rdi	# D.10401, tmp111
	lea	rdi, -64[rbp]	# tmp111,
.LVL86:
	.loc 1 84 9 view .LVU342
	call	posix_memalign@PLT	#
.LVL87:
	test	eax, eax	# _1
	jne	.L120	#,
# src/main.c:85:         posix_memalign((void**)&b, 32, DATA_SIZE * sizeof(float)) != 0 ||
	.loc 1 85 9 view .LVU343
	lea	rdi, -56[rbp]	# tmp112,
	mov	edx, 67108864	#,
	mov	esi, 32	#,
	mov	r13, QWORD PTR -64[rbp]	# _5, D.9882
	call	posix_memalign@PLT	#
.LVL88:
	test	eax, eax	# _2
	je	.L126	#,
.L120:
	.loc 1 87 9 is_stmt 1 view .LVU344
.LVL89:
.LBB33:
.LBI33:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 109 1 view .LVU345
.LBB34:
	.loc 2 111 3 view .LVU346
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:111:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	.loc 2 111 10 is_stmt 0 view .LVU347
	mov	edx, 24	#,
	mov	rcx, QWORD PTR stderr[rip]	#, stderr
	mov	esi, 1	#,
	lea	rdi, .LC24[rip]	#,
.LBE34:
.LBE33:
# src/main.c:88:         return 1;
	.loc 1 88 16 view .LVU348
	mov	r14d, 1	# <retval>,
.LBB36:
.LBB35:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:111:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	.loc 2 111 10 view .LVU349
	call	fwrite@PLT	#
.LVL90:
	.loc 2 111 10 view .LVU350
.LBE35:
.LBE36:
	.loc 1 88 9 is_stmt 1 view .LVU351
.L119:
# src/main.c:105: }
	.loc 1 105 1 is_stmt 0 view .LVU352
	mov	rax, QWORD PTR -40[rbp]	# tmp123, D.10401
	sub	rax, QWORD PTR fs:40	# tmp123, MEM[(<address-space-1> long unsigned int *)40B]
	jne	.L127	#,
	add	rsp, 32	#,
	mov	eax, r14d	#, <retval>
	pop	rbx	#
	pop	r12	#
	pop	r13	#
	pop	r14	#
	pop	rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L126:
	.cfi_restore_state
# src/main.c:86:         posix_memalign((void**)&c, 32, DATA_SIZE * sizeof(float)) != 0) {
	.loc 1 86 9 view .LVU353
	lea	rdi, -48[rbp]	# tmp113,
	mov	edx, 67108864	#,
	mov	esi, 32	#,
	mov	rbx, QWORD PTR -56[rbp]	# _7, D.9886
	call	posix_memalign@PLT	#
.LVL91:
	mov	r14d, eax	# <retval>, <retval>
	test	eax, eax	# <retval>
	jne	.L120	#,
	mov	r12, QWORD PTR -48[rbp]	# _17, D.9890
.LVL92:
	.loc 1 91 5 is_stmt 1 view .LVU354
	mov	ecx, 16777216	#,
	mov	rsi, rbx	#, _7
	mov	rdi, r13	#, _5
	mov	rdx, r12	#, _17
	call	init_dataset	#
.LVL93:
	.loc 1 93 5 view .LVU355
.LBB37:
	.loc 1 93 10 view .LVU356
	.loc 1 93 29 discriminator 1 view .LVU357
.LBE37:
# src/main.c:91:     init_dataset(a, b, c, DATA_SIZE);
	.loc 1 91 5 is_stmt 0 view .LVU358
	mov	ecx, 20	# ivtmp_9,
.LVL94:
	.p2align 4
	.p2align 3
.L121:
.LBB38:
	.loc 1 94 9 is_stmt 1 view .LVU359
	mov	rsi, rbx	#, _7
	mov	rdi, r13	#, _5
	mov	rdx, r12	#, _17
	call	vector_math_engine.constprop.0	#
.LVL95:
	.loc 1 95 9 view .LVU360
	mov	rsi, rbx	#, _7
	mov	rdi, r12	#, _17
	call	signal_filter_engine.constprop.0	#
.LVL96:
	.loc 1 93 51 discriminator 3 view .LVU361
	.loc 1 93 29 discriminator 1 view .LVU362
	sub	ecx, 1	# ivtmp_9,
	jne	.L121	#,
.LBE38:
	.loc 1 98 5 view .LVU363
# src/main.c:98:     double total = compute_summary(c, DATA_SIZE);
	.loc 1 98 20 is_stmt 0 view .LVU364
	mov	rdi, r12	#, _17
	mov	esi, 16777216	#,
	call	compute_summary	#
.LVL97:
	.loc 1 99 5 is_stmt 1 view .LVU365
.LBB39:
.LBI39:
	.loc 2 116 1 view .LVU366
.LBB40:
	.loc 2 118 3 view .LVU367
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:118:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	.loc 2 118 10 is_stmt 0 view .LVU368
	mov	edi, 2	#,
	mov	eax, 1	#,
	lea	rsi, .LC25[rip]	#,
	call	__printf_chk@PLT	#
.LVL98:
	.loc 2 118 10 view .LVU369
.LBE40:
.LBE39:
	.loc 1 101 5 is_stmt 1 view .LVU370
	mov	rdi, r13	#, _5
	call	free@PLT	#
.LVL99:
	.loc 1 102 5 view .LVU371
	mov	rdi, rbx	#, _7
	call	free@PLT	#
.LVL100:
	.loc 1 103 5 view .LVU372
	mov	rdi, r12	#, _17
	call	free@PLT	#
.LVL101:
	.loc 1 104 5 view .LVU373
# src/main.c:104:     return 0;
	.loc 1 104 12 is_stmt 0 view .LVU374
	jmp	.L119	#
.LVL102:
.L127:
# src/main.c:105: }
	.loc 1 105 1 view .LVU375
	call	__stack_chk_fail@PLT	#
.LVL103:
	.cfi_endproc
.LFE70:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	1028443341
	.align 4
.LC3:
	.long	1065017672
	.align 4
.LC4:
	.long	1048576000
	.align 4
.LC5:
	.long	1056964608
	.align 4
.LC7:
	.long	1041865114
	.align 4
.LC9:
	.long	1062836634
	.align 4
.LC11:
	.long	1065772646
	.align 4
.LC13:
	.long	1064514355
	.align 4
.LC20:
	.long	1008981770
	.align 4
.LC21:
	.long	1065353216
	.align 4
.LC22:
	.long	1017370378
	.text
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/15/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/stdio2-decl.h"
	.file 8 "/usr/include/stdlib.h"
	.file 9 "/usr/include/stdio.h"
	.file 10 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xe72
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x28
	.long	.LASF88
	.byte	0x1d
	.byte	0x3
	.long	0x31647
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL43
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x14
	.long	.LASF9
	.byte	0x3
	.byte	0xe5
	.byte	0x17
	.long	0x3b
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x29
	.byte	0x8
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2a
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x14
	.long	.LASF10
	.byte	0x4
	.byte	0x2d
	.byte	0x1b
	.long	0x3b
	.uleb128 0x14
	.long	.LASF11
	.byte	0x4
	.byte	0x98
	.byte	0x19
	.long	0x6e
	.uleb128 0x14
	.long	.LASF12
	.byte	0x4
	.byte	0x99
	.byte	0x1b
	.long	0x6e
	.uleb128 0x7
	.long	0x9e
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x1d
	.long	0x9e
	.uleb128 0x2b
	.long	.LASF89
	.byte	0xd8
	.byte	0x5
	.byte	0x33
	.byte	0x8
	.long	0x23b
	.uleb128 0x2
	.long	.LASF14
	.byte	0x35
	.byte	0x7
	.long	0x67
	.byte	0
	.uleb128 0x2
	.long	.LASF15
	.byte	0x38
	.byte	0x9
	.long	0x99
	.byte	0x8
	.uleb128 0x2
	.long	.LASF16
	.byte	0x39
	.byte	0x9
	.long	0x99
	.byte	0x10
	.uleb128 0x2
	.long	.LASF17
	.byte	0x3a
	.byte	0x9
	.long	0x99
	.byte	0x18
	.uleb128 0x2
	.long	.LASF18
	.byte	0x3b
	.byte	0x9
	.long	0x99
	.byte	0x20
	.uleb128 0x2
	.long	.LASF19
	.byte	0x3c
	.byte	0x9
	.long	0x99
	.byte	0x28
	.uleb128 0x2
	.long	.LASF20
	.byte	0x3d
	.byte	0x9
	.long	0x99
	.byte	0x30
	.uleb128 0x2
	.long	.LASF21
	.byte	0x3e
	.byte	0x9
	.long	0x99
	.byte	0x38
	.uleb128 0x2
	.long	.LASF22
	.byte	0x3f
	.byte	0x9
	.long	0x99
	.byte	0x40
	.uleb128 0x2
	.long	.LASF23
	.byte	0x42
	.byte	0x9
	.long	0x99
	.byte	0x48
	.uleb128 0x2
	.long	.LASF24
	.byte	0x43
	.byte	0x9
	.long	0x99
	.byte	0x50
	.uleb128 0x2
	.long	.LASF25
	.byte	0x44
	.byte	0x9
	.long	0x99
	.byte	0x58
	.uleb128 0x2
	.long	.LASF26
	.byte	0x46
	.byte	0x16
	.long	0x254
	.byte	0x60
	.uleb128 0x2
	.long	.LASF27
	.byte	0x48
	.byte	0x14
	.long	0x259
	.byte	0x68
	.uleb128 0x2
	.long	.LASF28
	.byte	0x4a
	.byte	0x7
	.long	0x67
	.byte	0x70
	.uleb128 0x2c
	.long	.LASF90
	.byte	0x5
	.byte	0x4b
	.byte	0x7
	.long	0x67
	.byte	0x18
	.value	0x3a0
	.uleb128 0x2
	.long	.LASF29
	.byte	0x4d
	.byte	0x8
	.long	0x25e
	.byte	0x77
	.uleb128 0x2
	.long	.LASF30
	.byte	0x4e
	.byte	0xb
	.long	0x81
	.byte	0x78
	.uleb128 0x2
	.long	.LASF31
	.byte	0x51
	.byte	0x12
	.long	0x52
	.byte	0x80
	.uleb128 0x2
	.long	.LASF32
	.byte	0x52
	.byte	0xf
	.long	0x59
	.byte	0x82
	.uleb128 0x2
	.long	.LASF33
	.byte	0x53
	.byte	0x8
	.long	0x25e
	.byte	0x83
	.uleb128 0x2
	.long	.LASF34
	.byte	0x55
	.byte	0xf
	.long	0x26e
	.byte	0x88
	.uleb128 0x2
	.long	.LASF35
	.byte	0x5d
	.byte	0xd
	.long	0x8d
	.byte	0x90
	.uleb128 0x2
	.long	.LASF36
	.byte	0x5f
	.byte	0x17
	.long	0x278
	.byte	0x98
	.uleb128 0x2
	.long	.LASF37
	.byte	0x60
	.byte	0x19
	.long	0x282
	.byte	0xa0
	.uleb128 0x2
	.long	.LASF38
	.byte	0x61
	.byte	0x14
	.long	0x259
	.byte	0xa8
	.uleb128 0x2
	.long	.LASF39
	.byte	0x62
	.byte	0x9
	.long	0x49
	.byte	0xb0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x63
	.byte	0x15
	.long	0x287
	.byte	0xb8
	.uleb128 0x2
	.long	.LASF41
	.byte	0x64
	.byte	0x7
	.long	0x67
	.byte	0xc0
	.uleb128 0x2
	.long	.LASF42
	.byte	0x66
	.byte	0x7
	.long	0x67
	.byte	0xc4
	.uleb128 0x2
	.long	.LASF43
	.byte	0x68
	.byte	0xe
	.long	0x75
	.byte	0xc8
	.uleb128 0x2
	.long	.LASF44
	.byte	0x6d
	.byte	0x8
	.long	0x28c
	.byte	0xd0
	.byte	0
	.uleb128 0x14
	.long	.LASF45
	.byte	0x6
	.byte	0x7
	.byte	0x19
	.long	0xaa
	.uleb128 0x2d
	.long	.LASF91
	.byte	0x5
	.byte	0x2d
	.byte	0xe
	.uleb128 0x1c
	.long	.LASF46
	.uleb128 0x7
	.long	0x24f
	.uleb128 0x7
	.long	0xaa
	.uleb128 0x1e
	.long	0x9e
	.long	0x26e
	.uleb128 0x1f
	.long	0x3b
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x247
	.uleb128 0x1c
	.long	.LASF47
	.uleb128 0x7
	.long	0x273
	.uleb128 0x1c
	.long	.LASF48
	.uleb128 0x7
	.long	0x27d
	.uleb128 0x7
	.long	0x259
	.uleb128 0x1e
	.long	0x9e
	.long	0x29c
	.uleb128 0x1f
	.long	0x3b
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	0xa5
	.uleb128 0x17
	.long	0x29c
	.uleb128 0x7
	.long	0x23b
	.uleb128 0x17
	.long	0x2a6
	.uleb128 0x2e
	.long	.LASF62
	.byte	0x9
	.byte	0x9b
	.byte	0xe
	.long	0x2a6
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF49
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF50
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.long	.LASF51
	.uleb128 0x1d
	.long	0x2ca
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.long	.LASF52
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF53
	.uleb128 0x5
	.byte	0x4
	.byte	0x4
	.long	.LASF54
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.long	.LASF55
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF56
	.uleb128 0x20
	.long	.LASF57
	.byte	0x34
	.long	0x67
	.long	0x313
	.uleb128 0xc
	.long	0x67
	.uleb128 0xc
	.long	0x29c
	.uleb128 0x18
	.byte	0
	.uleb128 0x20
	.long	.LASF58
	.byte	0x31
	.long	0x67
	.long	0x332
	.uleb128 0xc
	.long	0x2a6
	.uleb128 0xc
	.long	0x67
	.uleb128 0xc
	.long	0x29c
	.uleb128 0x18
	.byte	0
	.uleb128 0x2f
	.long	.LASF68
	.byte	0x8
	.value	0x2b3
	.byte	0xd
	.long	0x345
	.uleb128 0xc
	.long	0x49
	.byte	0
	.uleb128 0x30
	.long	.LASF59
	.byte	0x8
	.value	0x2e4
	.byte	0xc
	.long	0x67
	.long	0x366
	.uleb128 0xc
	.long	0x366
	.uleb128 0xc
	.long	0x3b
	.uleb128 0xc
	.long	0x3b
	.byte	0
	.uleb128 0x7
	.long	0x49
	.uleb128 0x21
	.long	.LASF65
	.byte	0x4c
	.byte	0x5
	.long	0x67
	.quad	.LFB70
	.quad	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.long	0x609
	.uleb128 0x22
	.long	.LASF60
	.byte	0x4c
	.byte	0xe
	.long	0x67
	.long	.LLST34
	.long	.LVUS34
	.uleb128 0x22
	.long	.LASF61
	.byte	0x4c
	.byte	0x1b
	.long	0x609
	.long	.LLST35
	.long	.LVUS35
	.uleb128 0xd
	.string	"a"
	.byte	0x50
	.byte	0xc
	.long	0x60e
	.uleb128 0xd
	.string	"b"
	.byte	0x51
	.byte	0xc
	.long	0x60e
	.uleb128 0x19
	.string	"c"
	.byte	0x52
	.byte	0xc
	.long	0x60e
	.long	.LLST36
	.long	.LVUS36
	.uleb128 0x23
	.long	.LASF63
	.byte	0x62
	.byte	0xc
	.long	0x2d6
	.long	.LLST37
	.long	.LVUS37
	.uleb128 0x24
	.long	.LLRL40
	.long	0x455
	.uleb128 0x23
	.long	.LASF64
	.byte	0x5d
	.byte	0xe
	.long	0x67
	.long	.LLST41
	.long	.LVUS41
	.uleb128 0x8
	.quad	.LVL95
	.long	0xaec
	.long	0x431
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x10
	.long	0x7f5
	.uleb128 0x3
	.byte	0x40
	.byte	0x44
	.byte	0x24
	.byte	0
	.uleb128 0xe
	.quad	.LVL96
	.long	0x99a
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x10
	.long	0x747
	.uleb128 0x3
	.byte	0x40
	.byte	0x44
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0x31
	.long	0x8ae
	.quad	.LBI33
	.byte	.LVU345
	.long	.LLRL38
	.byte	0x1
	.byte	0x57
	.byte	0x9
	.long	0x4a6
	.uleb128 0x32
	.long	0x8bc
	.uleb128 0x9
	.long	0x8c8
	.long	.LLST39
	.long	.LVUS39
	.uleb128 0xe
	.quad	.LVL90
	.long	0xe5a
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC24
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x48
	.byte	0
	.byte	0
	.uleb128 0x33
	.long	0x892
	.quad	.LBI39
	.byte	.LVU366
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.byte	0x1
	.byte	0x63
	.byte	0x5
	.long	0x4f9
	.uleb128 0x9
	.long	0x8a0
	.long	.LLST42
	.long	.LVUS42
	.uleb128 0xe
	.quad	.LVL98
	.long	0x2f9
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC25
	.byte	0
	.byte	0
	.uleb128 0x8
	.quad	.LVL87
	.long	0x345
	.long	0x51f
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x40
	.byte	0x46
	.byte	0x24
	.byte	0
	.uleb128 0x8
	.quad	.LVL88
	.long	0x345
	.long	0x545
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x40
	.byte	0x46
	.byte	0x24
	.byte	0
	.uleb128 0x8
	.quad	.LVL91
	.long	0x345
	.long	0x56a
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x40
	.byte	0x46
	.byte	0x24
	.byte	0
	.uleb128 0x8
	.quad	.LVL93
	.long	0x6a2
	.long	0x595
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x40
	.byte	0x44
	.byte	0x24
	.byte	0
	.uleb128 0x8
	.quad	.LVL97
	.long	0x618
	.long	0x5b3
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x8
	.quad	.LVL99
	.long	0x332
	.long	0x5cb
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x8
	.quad	.LVL100
	.long	0x332
	.long	0x5e3
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x8
	.quad	.LVL101
	.long	0x332
	.long	0x5fb
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x34
	.quad	.LVL103
	.long	0xe63
	.byte	0
	.uleb128 0x7
	.long	0x99
	.uleb128 0x7
	.long	0x2ca
	.uleb128 0x17
	.long	0x60e
	.uleb128 0x21
	.long	.LASF66
	.byte	0x44
	.byte	0x8
	.long	0x2d6
	.quad	.LFB69
	.quad	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.long	0x698
	.uleb128 0x35
	.long	.LASF67
	.byte	0x1
	.byte	0x44
	.byte	0x30
	.long	0x69d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x36
	.string	"n"
	.byte	0x1
	.byte	0x44
	.byte	0x3d
	.long	0x2f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x19
	.string	"sum"
	.byte	0x45
	.byte	0xc
	.long	0x2d6
	.long	.LLST31
	.long	.LVUS31
	.uleb128 0x24
	.long	.LLRL32
	.long	0x681
	.uleb128 0x19
	.string	"i"
	.byte	0x46
	.byte	0x11
	.long	0x2f
	.long	.LLST33
	.long	.LVUS33
	.byte	0
	.uleb128 0xb
	.quad	.LVL76
	.uleb128 0x1
	.byte	0x30
	.uleb128 0xb
	.quad	.LVL82
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x7
	.long	0x2d1
	.uleb128 0x17
	.long	0x698
	.uleb128 0x37
	.long	.LASF92
	.byte	0x1
	.byte	0x3b
	.byte	0x6
	.quad	.LFB68
	.quad	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.long	0x72b
	.uleb128 0x1a
	.string	"a"
	.byte	0x25
	.long	0x613
	.long	.LLST25
	.long	.LVUS25
	.uleb128 0x1a
	.string	"b"
	.byte	0x3a
	.long	0x613
	.long	.LLST26
	.long	.LVUS26
	.uleb128 0x1a
	.string	"c"
	.byte	0x4f
	.long	0x613
	.long	.LLST27
	.long	.LVUS27
	.uleb128 0x1a
	.string	"n"
	.byte	0x59
	.long	0x2f
	.long	.LLST28
	.long	.LVUS28
	.uleb128 0x38
	.long	.LLRL29
	.uleb128 0x19
	.string	"i"
	.byte	0x3c
	.byte	0x11
	.long	0x2f
	.long	.LLST30
	.long	.LVUS30
	.uleb128 0xe
	.quad	.LVL71
	.long	0xe6c
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	.LASF69
	.byte	0x35
	.long	0x751
	.uleb128 0x4
	.string	"c"
	.byte	0x35
	.byte	0x2d
	.long	0x613
	.uleb128 0x4
	.string	"b"
	.byte	0x35
	.byte	0x48
	.long	0x69d
	.uleb128 0x4
	.string	"n"
	.byte	0x35
	.byte	0x52
	.long	0x2f
	.byte	0
	.uleb128 0x11
	.long	.LASF70
	.byte	0x2d
	.long	0x791
	.uleb128 0x15
	.long	.LASF67
	.byte	0x1
	.byte	0x2d
	.byte	0x29
	.long	0x613
	.uleb128 0x4
	.string	"ref"
	.byte	0x2d
	.byte	0x47
	.long	0x69d
	.uleb128 0x4
	.string	"n"
	.byte	0x2d
	.byte	0x53
	.long	0x2f
	.uleb128 0x16
	.long	.LASF71
	.byte	0x2e
	.long	0x2d1
	.uleb128 0x1b
	.uleb128 0xd
	.string	"i"
	.byte	0x2f
	.byte	0x11
	.long	0x2f
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	.LASF72
	.byte	0x24
	.long	0x7d0
	.uleb128 0x15
	.long	.LASF67
	.byte	0x1
	.byte	0x24
	.byte	0x2d
	.long	0x613
	.uleb128 0x4
	.string	"n"
	.byte	0x24
	.byte	0x3a
	.long	0x2f
	.uleb128 0x16
	.long	.LASF73
	.byte	0x25
	.long	0x2d1
	.uleb128 0x16
	.long	.LASF74
	.byte	0x26
	.long	0x2d1
	.uleb128 0x1b
	.uleb128 0xd
	.string	"i"
	.byte	0x27
	.byte	0x11
	.long	0x2f
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	.LASF75
	.byte	0x1e
	.long	0x7ff
	.uleb128 0x4
	.string	"a"
	.byte	0x1e
	.byte	0x31
	.long	0x69d
	.uleb128 0x4
	.string	"b"
	.byte	0x1e
	.byte	0x4c
	.long	0x69d
	.uleb128 0x4
	.string	"c"
	.byte	0x1e
	.byte	0x61
	.long	0x613
	.uleb128 0x4
	.string	"n"
	.byte	0x1e
	.byte	0x6b
	.long	0x2f
	.byte	0
	.uleb128 0x11
	.long	.LASF76
	.byte	0x15
	.long	0x844
	.uleb128 0x4
	.string	"a"
	.byte	0x15
	.byte	0x2e
	.long	0x69d
	.uleb128 0x4
	.string	"c"
	.byte	0x15
	.byte	0x43
	.long	0x613
	.uleb128 0x4
	.string	"n"
	.byte	0x15
	.byte	0x4d
	.long	0x2f
	.uleb128 0x16
	.long	.LASF77
	.byte	0x16
	.long	0x2d1
	.uleb128 0x16
	.long	.LASF78
	.byte	0x17
	.long	0x2d1
	.uleb128 0x1b
	.uleb128 0xd
	.string	"i"
	.byte	0x18
	.byte	0x11
	.long	0x2f
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	.LASF79
	.byte	0xc
	.long	0x892
	.uleb128 0x4
	.string	"a"
	.byte	0xc
	.byte	0x31
	.long	0x69d
	.uleb128 0x4
	.string	"b"
	.byte	0xc
	.byte	0x4c
	.long	0x69d
	.uleb128 0x4
	.string	"c"
	.byte	0xc
	.byte	0x61
	.long	0x613
	.uleb128 0x4
	.string	"n"
	.byte	0xc
	.byte	0x6b
	.long	0x2f
	.uleb128 0xd
	.string	"f1"
	.byte	0xd
	.byte	0x11
	.long	0x2d1
	.uleb128 0xd
	.string	"f2"
	.byte	0xe
	.byte	0x11
	.long	0x2d1
	.uleb128 0x1b
	.uleb128 0xd
	.string	"i"
	.byte	0xf
	.byte	0x11
	.long	0x2f
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.LASF81
	.byte	0x74
	.long	0x67
	.long	0x8ae
	.uleb128 0x15
	.long	.LASF80
	.byte	0x2
	.byte	0x74
	.byte	0x20
	.long	0x2a1
	.uleb128 0x18
	.byte	0
	.uleb128 0x25
	.long	.LASF82
	.byte	0x6d
	.long	0x67
	.long	0x8d6
	.uleb128 0x15
	.long	.LASF83
	.byte	0x2
	.byte	0x6d
	.byte	0x1b
	.long	0x2ab
	.uleb128 0x15
	.long	.LASF80
	.byte	0x2
	.byte	0x6d
	.byte	0x3c
	.long	0x2a1
	.uleb128 0x18
	.byte	0
	.uleb128 0xa
	.long	0x751
	.quad	.LFB71
	.quad	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.long	0x935
	.uleb128 0x3
	.long	0x75b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.long	0x767
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x6
	.long	0x77b
	.byte	0x4
	.long	0x3f7ae148
	.uleb128 0x12
	.long	0x772
	.uleb128 0x13
	.long	0x785
	.long	.LLRL0
	.long	0x929
	.uleb128 0xf
	.long	0x786
	.long	.LLST1
	.long	.LVUS1
	.byte	0
	.uleb128 0xb
	.quad	.LVL2
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xa
	.long	0x791
	.quad	.LFB72
	.quad	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.long	0x99a
	.uleb128 0x9
	.long	0x79b
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x6
	.long	0x7b0
	.byte	0x4
	.long	0x3e800000
	.uleb128 0x6
	.long	0x7ba
	.byte	0x4
	.long	0x3f000000
	.uleb128 0x12
	.long	0x7a7
	.uleb128 0x26
	.long	0x7c4
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0xf
	.long	0x7c5
	.long	.LLST3
	.long	.LVUS3
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x72b
	.quad	.LFB73
	.quad	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.long	0xa13
	.uleb128 0x9
	.long	0x735
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x3
	.long	0x73e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x12
	.long	0x747
	.uleb128 0x8
	.quad	.LVL7
	.long	0x935
	.long	0x9ef
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x10
	.long	0x7a7
	.uleb128 0x3
	.byte	0x40
	.byte	0x44
	.byte	0x24
	.byte	0
	.uleb128 0xe
	.quad	.LVL8
	.long	0x8d6
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.long	0x772
	.uleb128 0x3
	.byte	0x40
	.byte	0x44
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x7ff
	.quad	.LFB74
	.quad	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.long	0xa7c
	.uleb128 0x3
	.long	0x809
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.long	0x812
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x6
	.long	0x824
	.byte	0x4
	.long	0x3f59999a
	.uleb128 0x6
	.long	0x82e
	.byte	0x4
	.long	0x3e19999a
	.uleb128 0x12
	.long	0x81b
	.uleb128 0x13
	.long	0x838
	.long	.LLRL5
	.long	0xa70
	.uleb128 0xf
	.long	0x839
	.long	.LLST6
	.long	.LVUS6
	.byte	0
	.uleb128 0xb
	.quad	.LVL11
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xa
	.long	0x844
	.quad	.LFB75
	.quad	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.long	0xaec
	.uleb128 0x3
	.long	0x84e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.long	0x857
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.long	0x860
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x6
	.long	0x872
	.byte	0x4
	.long	0x3f866666
	.uleb128 0x6
	.long	0x87c
	.byte	0x4
	.long	0x3f733333
	.uleb128 0x12
	.long	0x869
	.uleb128 0x13
	.long	0x886
	.long	.LLRL7
	.long	0xae0
	.uleb128 0xf
	.long	0x887
	.long	.LLST8
	.long	.LVUS8
	.byte	0
	.uleb128 0xb
	.quad	.LVL14
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xa
	.long	0x7d0
	.quad	.LFB76
	.quad	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.long	0xb78
	.uleb128 0x3
	.long	0x7da
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.long	0x7e3
	.long	.LLST9
	.long	.LVUS9
	.uleb128 0x3
	.long	0x7ec
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x12
	.long	0x7f5
	.uleb128 0x8
	.quad	.LVL16
	.long	0xa7c
	.long	0xb54
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x10
	.long	0x869
	.uleb128 0x3
	.byte	0x40
	.byte	0x44
	.byte	0x24
	.byte	0
	.uleb128 0xe
	.quad	.LVL18
	.long	0xa13
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x10
	.long	0x81b
	.uleb128 0x3
	.byte	0x40
	.byte	0x44
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x844
	.quad	.LFB62
	.quad	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.long	0xbfb
	.uleb128 0x3
	.long	0x84e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.long	0x857
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.long	0x860
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.long	0x869
	.long	.LLST10
	.long	.LVUS10
	.uleb128 0x6
	.long	0x872
	.byte	0x4
	.long	0x3f866666
	.uleb128 0x6
	.long	0x87c
	.byte	0x4
	.long	0x3f733333
	.uleb128 0x13
	.long	0x886
	.long	.LLRL11
	.long	0xbe4
	.uleb128 0xf
	.long	0x887
	.long	.LLST12
	.long	.LVUS12
	.byte	0
	.uleb128 0xb
	.quad	.LVL23
	.uleb128 0x1
	.byte	0x30
	.uleb128 0xb
	.quad	.LVL26
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xa
	.long	0x7ff
	.quad	.LFB63
	.quad	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.long	0xc77
	.uleb128 0x3
	.long	0x809
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.long	0x812
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.long	0x81b
	.long	.LLST13
	.long	.LVUS13
	.uleb128 0x6
	.long	0x824
	.byte	0x4
	.long	0x3f59999a
	.uleb128 0x6
	.long	0x82e
	.byte	0x4
	.long	0x3e19999a
	.uleb128 0x13
	.long	0x838
	.long	.LLRL14
	.long	0xc60
	.uleb128 0xf
	.long	0x839
	.long	.LLST15
	.long	.LVUS15
	.byte	0
	.uleb128 0xb
	.quad	.LVL32
	.uleb128 0x1
	.byte	0x30
	.uleb128 0xb
	.quad	.LVL35
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xa
	.long	0x7d0
	.quad	.LFB64
	.quad	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.long	0xd0b
	.uleb128 0x3
	.long	0x7da
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.long	0x7e3
	.long	.LLST16
	.long	.LVUS16
	.uleb128 0x9
	.long	0x7ec
	.long	.LLST17
	.long	.LVUS17
	.uleb128 0x9
	.long	0x7f5
	.long	.LLST18
	.long	.LVUS18
	.uleb128 0x8
	.quad	.LVL38
	.long	0x844
	.long	0xcea
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7b
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.quad	.LVL41
	.long	0x7ff
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7a
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7b
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x791
	.quad	.LFB65
	.quad	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.long	0xd6c
	.uleb128 0x3
	.long	0x79b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.long	0x7a7
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x6
	.long	0x7b0
	.byte	0x4
	.long	0x3e800000
	.uleb128 0x6
	.long	0x7ba
	.byte	0x4
	.long	0x3f000000
	.uleb128 0x26
	.long	0x7c4
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.uleb128 0xf
	.long	0x7c5
	.long	.LLST19
	.long	.LVUS19
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x751
	.quad	.LFB66
	.quad	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.long	0xdde
	.uleb128 0x3
	.long	0x75b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.long	0x767
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.long	0x772
	.long	.LLST20
	.long	.LVUS20
	.uleb128 0x6
	.long	0x77b
	.byte	0x4
	.long	0x3f7ae148
	.uleb128 0x13
	.long	0x785
	.long	.LLRL21
	.long	0xdc7
	.uleb128 0xf
	.long	0x786
	.long	.LLST22
	.long	.LVUS22
	.byte	0
	.uleb128 0xb
	.quad	.LVL49
	.uleb128 0x1
	.byte	0x30
	.uleb128 0xb
	.quad	.LVL52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xa
	.long	0x72b
	.quad	.LFB67
	.quad	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.long	0xe5a
	.uleb128 0x3
	.long	0x735
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.long	0x73e
	.long	.LLST23
	.long	.LVUS23
	.uleb128 0x9
	.long	0x747
	.long	.LLST24
	.long	.LVUS24
	.uleb128 0x8
	.quad	.LVL56
	.long	0x791
	.long	0xe38
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x72
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.quad	.LVL57
	.long	0x751
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF84
	.long	.LASF86
	.uleb128 0x39
	.long	.LASF93
	.long	.LASF93
	.uleb128 0x27
	.long	.LASF85
	.long	.LASF87
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
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
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0xb
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x83
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x49
	.byte	0
	.uleb128 0x80
	.uleb128 0x13
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x21
	.sleb128 16777216
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x5
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
	.uleb128 0x16
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
	.uleb128 0x21
	.sleb128 17
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 59
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 10
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
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
	.uleb128 0x37
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.long	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.value	0x5
	.byte	0x8
	.byte	0
	.long	0
.Ldebug_loc0:
.LVUS34:
	.uleb128 0
	.uleb128 .LVU342
	.uleb128 .LVU342
	.uleb128 0
.LLST34:
	.byte	0x6
	.quad	.LVL84
	.byte	0x4
	.uleb128 .LVL84-.LVL84
	.uleb128 .LVL86-.LVL84
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL86-.LVL84
	.uleb128 .LFE70-.LVL84
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS35:
	.uleb128 0
	.uleb128 .LVU340
	.uleb128 .LVU340
	.uleb128 0
.LLST35:
	.byte	0x6
	.quad	.LVL84
	.byte	0x4
	.uleb128 .LVL84-.LVL84
	.uleb128 .LVL85-.LVL84
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL85-.LVL84
	.uleb128 .LFE70-.LVL84
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.byte	0
.LVUS36:
	.uleb128 .LVU354
	.uleb128 .LVU375
.LLST36:
	.byte	0x8
	.quad	.LVL92
	.uleb128 .LVL102-.LVL92
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LVUS37:
	.uleb128 .LVU365
	.uleb128 .LVU369
.LLST37:
	.byte	0x8
	.quad	.LVL97
	.uleb128 .LVL98-1-.LVL97
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS41:
	.uleb128 .LVU357
	.uleb128 .LVU359
.LLST41:
	.byte	0x8
	.quad	.LVL93
	.uleb128 .LVL94-.LVL93
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS39:
	.uleb128 .LVU345
	.uleb128 .LVU350
.LLST39:
	.byte	0x8
	.quad	.LVL89
	.uleb128 .LVL90-.LVL89
	.uleb128 0xa
	.byte	0x3
	.quad	.LC24
	.byte	0x9f
	.byte	0
.LVUS42:
	.uleb128 .LVU366
	.uleb128 .LVU369
.LLST42:
	.byte	0x8
	.quad	.LVL97
	.uleb128 .LVL98-.LVL97
	.uleb128 0xa
	.byte	0x3
	.quad	.LC25
	.byte	0x9f
	.byte	0
.LVUS31:
	.uleb128 .LVU297
	.uleb128 .LVU298
	.uleb128 .LVU312
	.uleb128 .LVU327
	.uleb128 .LVU328
	.uleb128 .LVU329
	.uleb128 .LVU331
	.uleb128 0
.LLST31:
	.byte	0x6
	.quad	.LVL74
	.byte	0x4
	.uleb128 .LVL74-.LVL74
	.uleb128 .LVL75-.LVL74
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0x4
	.uleb128 .LVL77-.LVL74
	.uleb128 .LVL80-.LVL74
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL80-.LVL74
	.uleb128 .LVL81-.LVL74
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL83-.LVL74
	.uleb128 .LFE69-.LVL74
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.byte	0
.LVUS33:
	.uleb128 .LVU297
	.uleb128 .LVU298
	.uleb128 .LVU331
	.uleb128 0
.LLST33:
	.byte	0x6
	.quad	.LVL74
	.byte	0x4
	.uleb128 .LVL74-.LVL74
	.uleb128 .LVL75-.LVL74
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL83-.LVL74
	.uleb128 .LFE69-.LVL74
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS25:
	.uleb128 0
	.uleb128 .LVU260
	.uleb128 .LVU260
	.uleb128 .LVU275
	.uleb128 .LVU275
	.uleb128 .LVU291
	.uleb128 .LVU291
	.uleb128 0
.LLST25:
	.byte	0x6
	.quad	.LVL58
	.byte	0x4
	.uleb128 .LVL58-.LVL58
	.uleb128 .LVL60-.LVL58
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL60-.LVL58
	.uleb128 .LVL65-.LVL58
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL65-.LVL58
	.uleb128 .LVL72-.LVL58
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL72-.LVL58
	.uleb128 .LFE68-.LVL58
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LVUS26:
	.uleb128 0
	.uleb128 .LVU288
	.uleb128 .LVU288
	.uleb128 .LVU291
	.uleb128 .LVU291
	.uleb128 0
.LLST26:
	.byte	0x6
	.quad	.LVL58
	.byte	0x4
	.uleb128 .LVL58-.LVL58
	.uleb128 .LVL70-.LVL58
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL70-.LVL58
	.uleb128 .LVL72-.LVL58
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL72-.LVL58
	.uleb128 .LFE68-.LVL58
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS27:
	.uleb128 0
	.uleb128 .LVU264
	.uleb128 .LVU264
	.uleb128 .LVU289
	.uleb128 .LVU289
	.uleb128 .LVU291
	.uleb128 .LVU291
	.uleb128 0
.LLST27:
	.byte	0x6
	.quad	.LVL58
	.byte	0x4
	.uleb128 .LVL58-.LVL58
	.uleb128 .LVL62-.LVL58
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL62-.LVL58
	.uleb128 .LVL71-1-.LVL58
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL71-1-.LVL58
	.uleb128 .LVL72-.LVL58
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL72-.LVL58
	.uleb128 .LFE68-.LVL58
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS28:
	.uleb128 0
	.uleb128 .LVU262
	.uleb128 .LVU262
	.uleb128 .LVU277
	.uleb128 .LVU277
	.uleb128 .LVU291
	.uleb128 .LVU291
	.uleb128 0
.LLST28:
	.byte	0x6
	.quad	.LVL58
	.byte	0x4
	.uleb128 .LVL58-.LVL58
	.uleb128 .LVL61-.LVL58
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL61-.LVL58
	.uleb128 .LVL66-.LVL58
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL66-.LVL58
	.uleb128 .LVL72-.LVL58
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL72-.LVL58
	.uleb128 .LFE68-.LVL58
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS30:
	.uleb128 .LVU258
	.uleb128 .LVU264
	.uleb128 .LVU265
	.uleb128 .LVU271
	.uleb128 .LVU271
	.uleb128 .LVU273
	.uleb128 .LVU273
	.uleb128 .LVU277
	.uleb128 .LVU278
	.uleb128 .LVU281
	.uleb128 .LVU281
	.uleb128 .LVU286
	.uleb128 .LVU286
	.uleb128 .LVU289
	.uleb128 .LVU291
	.uleb128 0
.LLST30:
	.byte	0x6
	.quad	.LVL59
	.byte	0x4
	.uleb128 .LVL59-.LVL59
	.uleb128 .LVL62-.LVL59
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL63-.LVL59
	.uleb128 .LVL64-.LVL59
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL64-.LVL59
	.uleb128 .LVL64-.LVL59
	.uleb128 0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL64-.LVL59
	.uleb128 .LVL66-.LVL59
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL67-.LVL59
	.uleb128 .LVL68-.LVL59
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL68-.LVL59
	.uleb128 .LVL69-.LVL59
	.uleb128 0x3
	.byte	0x78
	.sleb128 -1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL69-.LVL59
	.uleb128 .LVL71-1-.LVL59
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL72-.LVL59
	.uleb128 .LFE68-.LVL59
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS1:
	.uleb128 .LVU4
	.uleb128 .LVU6
.LLST1:
	.byte	0x8
	.quad	.LVL0
	.uleb128 .LVL1-.LVL0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS2:
	.uleb128 0
	.uleb128 .LVU19
	.uleb128 .LVU19
	.uleb128 0
.LLST2:
	.byte	0x6
	.quad	.LVL3
	.byte	0x4
	.uleb128 .LVL3-.LVL3
	.uleb128 .LVL4-.LVL3
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL4-.LVL3
	.uleb128 .LFE72-.LVL3
	.uleb128 0x6
	.byte	0x75
	.sleb128 -67108860
	.byte	0x9f
	.byte	0
.LVUS3:
	.uleb128 .LVU18
	.uleb128 .LVU20
.LLST3:
	.byte	0x8
	.quad	.LVL3
	.uleb128 .LVL5-.LVL3
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LVUS4:
	.uleb128 0
	.uleb128 .LVU33
	.uleb128 .LVU33
	.uleb128 0
.LLST4:
	.byte	0x6
	.quad	.LVL6
	.byte	0x4
	.uleb128 .LVL6-.LVL6
	.uleb128 .LVL7-1-.LVL6
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL7-1-.LVL6
	.uleb128 .LFE73-.LVL6
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS6:
	.uleb128 .LVU40
	.uleb128 .LVU42
.LLST6:
	.byte	0x8
	.quad	.LVL9
	.uleb128 .LVL10-.LVL9
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS8:
	.uleb128 .LVU54
	.uleb128 .LVU56
.LLST8:
	.byte	0x8
	.quad	.LVL12
	.uleb128 .LVL13-.LVL12
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS9:
	.uleb128 0
	.uleb128 .LVU70
	.uleb128 .LVU70
	.uleb128 0
.LLST9:
	.byte	0x6
	.quad	.LVL15
	.byte	0x4
	.uleb128 .LVL15-.LVL15
	.uleb128 .LVL17-.LVL15
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL17-.LVL15
	.uleb128 .LFE76-.LVL15
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.byte	0
.LVUS10:
	.uleb128 0
	.uleb128 .LVU81
	.uleb128 .LVU81
	.uleb128 .LVU128
	.uleb128 .LVU128
	.uleb128 0
.LLST10:
	.byte	0x6
	.quad	.LVL19
	.byte	0x4
	.uleb128 .LVL19-.LVL19
	.uleb128 .LVL21-.LVL19
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL21-.LVL19
	.uleb128 .LVL27-.LVL19
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL27-.LVL19
	.uleb128 .LFE62-.LVL19
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS12:
	.uleb128 .LVU78
	.uleb128 .LVU82
	.uleb128 .LVU128
	.uleb128 0
.LLST12:
	.byte	0x6
	.quad	.LVL20
	.byte	0x4
	.uleb128 .LVL20-.LVL20
	.uleb128 .LVL22-.LVL20
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL27-.LVL20
	.uleb128 .LFE62-.LVL20
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS13:
	.uleb128 0
	.uleb128 .LVU138
	.uleb128 .LVU138
	.uleb128 .LVU172
	.uleb128 .LVU172
	.uleb128 0
.LLST13:
	.byte	0x6
	.quad	.LVL28
	.byte	0x4
	.uleb128 .LVL28-.LVL28
	.uleb128 .LVL30-.LVL28
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL30-.LVL28
	.uleb128 .LVL36-.LVL28
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL36-.LVL28
	.uleb128 .LFE63-.LVL28
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS15:
	.uleb128 .LVU135
	.uleb128 .LVU139
	.uleb128 .LVU172
	.uleb128 0
.LLST15:
	.byte	0x6
	.quad	.LVL29
	.byte	0x4
	.uleb128 .LVL29-.LVL29
	.uleb128 .LVL31-.LVL29
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL36-.LVL29
	.uleb128 .LFE63-.LVL29
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS16:
	.uleb128 0
	.uleb128 .LVU180
	.uleb128 .LVU180
	.uleb128 0
.LLST16:
	.byte	0x6
	.quad	.LVL37
	.byte	0x4
	.uleb128 .LVL37-.LVL37
	.uleb128 .LVL40-.LVL37
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL40-.LVL37
	.uleb128 .LFE64-.LVL37
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.byte	0
.LVUS17:
	.uleb128 0
	.uleb128 .LVU179
	.uleb128 .LVU179
	.uleb128 0
.LLST17:
	.byte	0x6
	.quad	.LVL37
	.byte	0x4
	.uleb128 .LVL37-.LVL37
	.uleb128 .LVL39-.LVL37
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL39-.LVL37
	.uleb128 .LFE64-.LVL37
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LVUS18:
	.uleb128 0
	.uleb128 .LVU178
	.uleb128 .LVU178
	.uleb128 0
.LLST18:
	.byte	0x6
	.quad	.LVL37
	.byte	0x4
	.uleb128 .LVL37-.LVL37
	.uleb128 .LVL38-1-.LVL37
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL38-1-.LVL37
	.uleb128 .LFE64-.LVL37
	.uleb128 0x1
	.byte	0x5b
	.byte	0
.LVUS19:
	.uleb128 .LVU188
	.uleb128 .LVU191
.LLST19:
	.byte	0x8
	.quad	.LVL43
	.uleb128 .LVL44-.LVL43
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LVUS20:
	.uleb128 0
	.uleb128 .LVU208
	.uleb128 .LVU208
	.uleb128 .LVU244
	.uleb128 .LVU244
	.uleb128 0
.LLST20:
	.byte	0x6
	.quad	.LVL45
	.byte	0x4
	.uleb128 .LVL45-.LVL45
	.uleb128 .LVL47-.LVL45
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL47-.LVL45
	.uleb128 .LVL53-.LVL45
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL53-.LVL45
	.uleb128 .LFE66-.LVL45
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS22:
	.uleb128 .LVU205
	.uleb128 .LVU209
	.uleb128 .LVU244
	.uleb128 0
.LLST22:
	.byte	0x6
	.quad	.LVL46
	.byte	0x4
	.uleb128 .LVL46-.LVL46
	.uleb128 .LVL48-.LVL46
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL53-.LVL46
	.uleb128 .LFE66-.LVL46
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS23:
	.uleb128 0
	.uleb128 .LVU250
	.uleb128 .LVU250
	.uleb128 .LVU253
	.uleb128 .LVU253
	.uleb128 0
.LLST23:
	.byte	0x6
	.quad	.LVL54
	.byte	0x4
	.uleb128 .LVL54-.LVL54
	.uleb128 .LVL55-.LVL54
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL55-.LVL54
	.uleb128 .LVL57-1-.LVL54
	.uleb128 0x1
	.byte	0x58
	.byte	0x4
	.uleb128 .LVL57-1-.LVL54
	.uleb128 .LFE67-.LVL54
	.uleb128 0x1
	.byte	0x54
	.byte	0
.LVUS24:
	.uleb128 0
	.uleb128 .LVU252
	.uleb128 .LVU252
	.uleb128 .LVU253
	.uleb128 .LVU253
	.uleb128 0
.LLST24:
	.byte	0x6
	.quad	.LVL54
	.byte	0x4
	.uleb128 .LVL54-.LVL54
	.uleb128 .LVL56-1-.LVL54
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL56-1-.LVL54
	.uleb128 .LVL57-1-.LVL54
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL57-1-.LVL54
	.uleb128 .LFE67-.LVL54
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB70
	.quad	.LFE70-.LFB70
	.quad	0
	.quad	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.long	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.value	0x5
	.byte	0x8
	.byte	0
	.long	0
.LLRL0:
	.byte	0x5
	.quad	.LBB8
	.byte	0x4
	.uleb128 .LBB8-.LBB8
	.uleb128 .LBE8-.LBB8
	.byte	0x4
	.uleb128 .LBB9-.LBB8
	.uleb128 .LBE9-.LBB8
	.byte	0
.LLRL5:
	.byte	0x5
	.quad	.LBB13
	.byte	0x4
	.uleb128 .LBB13-.LBB13
	.uleb128 .LBE13-.LBB13
	.byte	0x4
	.uleb128 .LBB14-.LBB13
	.uleb128 .LBE14-.LBB13
	.byte	0
.LLRL7:
	.byte	0x5
	.quad	.LBB16
	.byte	0x4
	.uleb128 .LBB16-.LBB16
	.uleb128 .LBE16-.LBB16
	.byte	0x4
	.uleb128 .LBB17-.LBB16
	.uleb128 .LBE17-.LBB16
	.byte	0
.LLRL11:
	.byte	0x5
	.quad	.LBB18
	.byte	0x4
	.uleb128 .LBB18-.LBB18
	.uleb128 .LBE18-.LBB18
	.byte	0x4
	.uleb128 .LBB19-.LBB18
	.uleb128 .LBE19-.LBB18
	.byte	0x4
	.uleb128 .LBB20-.LBB18
	.uleb128 .LBE20-.LBB18
	.byte	0
.LLRL14:
	.byte	0x5
	.quad	.LBB21
	.byte	0x4
	.uleb128 .LBB21-.LBB21
	.uleb128 .LBE21-.LBB21
	.byte	0x4
	.uleb128 .LBB22-.LBB21
	.uleb128 .LBE22-.LBB21
	.byte	0x4
	.uleb128 .LBB23-.LBB21
	.uleb128 .LBE23-.LBB21
	.byte	0
.LLRL21:
	.byte	0x5
	.quad	.LBB25
	.byte	0x4
	.uleb128 .LBB25-.LBB25
	.uleb128 .LBE25-.LBB25
	.byte	0x4
	.uleb128 .LBB26-.LBB25
	.uleb128 .LBE26-.LBB25
	.byte	0x4
	.uleb128 .LBB27-.LBB25
	.uleb128 .LBE27-.LBB25
	.byte	0
.LLRL29:
	.byte	0x5
	.quad	.LBB28
	.byte	0x4
	.uleb128 .LBB28-.LBB28
	.uleb128 .LBE28-.LBB28
	.byte	0x4
	.uleb128 .LBB29-.LBB28
	.uleb128 .LBE29-.LBB28
	.byte	0x4
	.uleb128 .LBB30-.LBB28
	.uleb128 .LBE30-.LBB28
	.byte	0
.LLRL32:
	.byte	0x5
	.quad	.LBB31
	.byte	0x4
	.uleb128 .LBB31-.LBB31
	.uleb128 .LBE31-.LBB31
	.byte	0x4
	.uleb128 .LBB32-.LBB31
	.uleb128 .LBE32-.LBB31
	.byte	0
.LLRL38:
	.byte	0x5
	.quad	.LBB33
	.byte	0x4
	.uleb128 .LBB33-.LBB33
	.uleb128 .LBE33-.LBB33
	.byte	0x4
	.uleb128 .LBB36-.LBB33
	.uleb128 .LBE36-.LBB33
	.byte	0
.LLRL40:
	.byte	0x5
	.quad	.LBB37
	.byte	0x4
	.uleb128 .LBB37-.LBB37
	.uleb128 .LBE37-.LBB37
	.byte	0x4
	.uleb128 .LBB38-.LBB37
	.uleb128 .LBE38-.LBB37
	.byte	0
.LLRL43:
	.byte	0x7
	.quad	.Ltext0
	.uleb128 .Letext0-.Ltext0
	.byte	0x7
	.quad	.LFB70
	.uleb128 .LFE70-.LFB70
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF51:
	.string	"float"
.LASF57:
	.string	"__printf_chk"
.LASF88:
	.ascii	"GNU C23 15.2.0 -D_FORTIFY_S"
	.string	"OURCE=3 -mavx2 -mfma -masm=intel -mtune=generic -march=x86-64 -g -O3 -ffast-math -fno-omit-frame-pointer -fno-optimize-sibling-calls -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection -fzero-init-padding-bits=all"
.LASF52:
	.string	"double"
.LASF89:
	.string	"_IO_FILE"
.LASF66:
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
.LASF34:
	.string	"_lock"
.LASF71:
	.string	"norm"
.LASF26:
	.string	"_markers"
.LASF16:
	.string	"_IO_read_end"
.LASF39:
	.string	"_freeres_buf"
.LASF73:
	.string	"alpha"
.LASF78:
	.string	"bias"
.LASF68:
	.string	"free"
.LASF75:
	.string	"vector_math_engine"
.LASF6:
	.string	"signed char"
.LASF70:
	.string	"normalize_signal"
.LASF45:
	.string	"FILE"
.LASF62:
	.string	"stderr"
.LASF55:
	.string	"_Float64"
.LASF87:
	.string	"__builtin_memset"
.LASF85:
	.string	"memset"
.LASF8:
	.string	"long int"
.LASF81:
	.string	"printf"
.LASF69:
	.string	"signal_filter_engine"
.LASF31:
	.string	"_cur_column"
.LASF82:
	.string	"fprintf"
.LASF61:
	.string	"argv"
.LASF32:
	.string	"_vtable_offset"
.LASF30:
	.string	"_old_offset"
.LASF53:
	.string	"long double"
.LASF86:
	.string	"__builtin_fwrite"
.LASF4:
	.string	"unsigned char"
.LASF40:
	.string	"_prevchain"
.LASF60:
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
.LASF76:
	.string	"scale_and_clamp"
.LASF18:
	.string	"_IO_write_base"
.LASF44:
	.string	"_unused2"
.LASF42:
	.string	"_unused3"
.LASF15:
	.string	"_IO_read_ptr"
.LASF77:
	.string	"gain"
.LASF22:
	.string	"_IO_buf_end"
.LASF13:
	.string	"char"
.LASF65:
	.string	"main"
.LASF37:
	.string	"_wide_data"
.LASF38:
	.string	"_freeres_list"
.LASF10:
	.string	"__uint64_t"
.LASF67:
	.string	"data"
.LASF74:
	.string	"beta"
.LASF80:
	.string	"__fmt"
.LASF84:
	.string	"fwrite"
.LASF2:
	.string	"long unsigned int"
.LASF92:
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
.LASF72:
	.string	"apply_spatial_filter"
.LASF11:
	.string	"__off_t"
.LASF24:
	.string	"_IO_backup_base"
.LASF90:
	.string	"_flags2"
.LASF47:
	.string	"_IO_codecvt"
.LASF17:
	.string	"_IO_read_base"
.LASF83:
	.string	"__stream"
.LASF64:
	.string	"iter"
.LASF56:
	.string	"_Float128"
.LASF63:
	.string	"total"
.LASF23:
	.string	"_IO_save_base"
.LASF58:
	.string	"__fprintf_chk"
.LASF43:
	.string	"_total_written"
.LASF93:
	.string	"__stack_chk_fail"
.LASF79:
	.string	"compute_fma_kernel"
.LASF59:
	.string	"posix_memalign"
.LASF49:
	.string	"long long int"
.LASF91:
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
