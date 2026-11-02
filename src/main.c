#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <string.h>

#define DATA_SIZE (16 * 1024 * 1024)
#define NUM_ITERATIONS 20

__attribute__((noinline))
void compute_fma_kernel(const float *__restrict a, const float *__restrict b, float *__restrict c, size_t n) {
    const float f1 = 1.05f;
    const float f2 = 0.95f;
    for (size_t i = 0; i < n; i++) {
        c[i] = (a[i] * f1) + (b[i] * f2) + (a[i] * b[i]);
    }
}

__attribute__((noinline))
void scale_and_clamp(const float *__restrict a, float *__restrict c, size_t n) {
    const float gain = 0.85f;
    const float bias = 0.15f;
    for (size_t i = 0; i < n; i++) {
        c[i] = c[i] * gain + a[i] * bias;
    }
}

__attribute__((noinline))
void vector_math_engine(const float *__restrict a, const float *__restrict b, float *__restrict c, size_t n) {
    compute_fma_kernel(a, b, c, n);
    scale_and_clamp(a, c, n);
}

__attribute__((noinline))
void apply_spatial_filter(float *__restrict data, size_t n) {
    const float alpha = 0.25f;
    const float beta  = 0.50f;
    for (size_t i = 1; i < n - 1; i++) {
        data[i] = alpha * data[i - 1] + beta * data[i] + alpha * data[i + 1];
    }
}

__attribute__((noinline))
void normalize_signal(float *__restrict data, const float *__restrict ref, size_t n) {
    const float norm = 0.98f;
    for (size_t i = 0; i < n; i++) {
        data[i] = (data[i] + ref[i] * 0.05f) * norm;
    }
}

__attribute__((noinline))
void signal_filter_engine(float *__restrict c, const float *__restrict b, size_t n) {
    apply_spatial_filter(c, n);
    normalize_signal(c, b, n);
}

__attribute__((noinline))
void init_dataset(float *__restrict a, float *__restrict b, float *__restrict c, size_t n) {
    for (size_t i = 0; i < n; i++) {
        a[i] = (float)(i % 100) * 0.01f + 1.0f;
        b[i] = (float)((i + 1) % 50) * 0.02f + 0.5f;
        c[i] = 0.0f;
    }
}

__attribute__((noinline))
double compute_summary(const float *__restrict data, size_t n) {
    double sum = 0.0;
    for (size_t i = 0; i < n; i++) {
        sum += (double)data[i];
    }
    return sum;
}

int main(int argc, char **argv) {
    (void)argc;
    (void)argv;

    float *a = NULL;
    float *b = NULL;
    float *c = NULL;

    if (posix_memalign((void**)&a, 32, DATA_SIZE * sizeof(float)) != 0 ||
        posix_memalign((void**)&b, 32, DATA_SIZE * sizeof(float)) != 0 ||
        posix_memalign((void**)&c, 32, DATA_SIZE * sizeof(float)) != 0) {
        fprintf(stderr, "Memory allocation error\n");
        return 1;
    }

    init_dataset(a, b, c, DATA_SIZE);

    for (int iter = 0; iter < NUM_ITERATIONS; iter++) {
        vector_math_engine(a, b, c, DATA_SIZE);
        signal_filter_engine(c, b, DATA_SIZE);
    }

    double total = compute_summary(c, DATA_SIZE);
    printf("Result: %.4f\n", total);

    free(a);
    free(b);
    free(c);
    return 0;
}
