CC = gcc
CFLAGS_COMMON = -Wall -Wextra -g -fno-omit-frame-pointer -fno-optimize-sibling-calls
CFLAGS_BASE = $(CFLAGS_COMMON) -O0
CFLAGS_OPT  = $(CFLAGS_COMMON) -O3 -mavx2 -mfma -ffast-math -fno-omit-frame-pointer -fno-optimize-sibling-calls

SRC = src/main.c
BIN_BASE = prog_baseline
BIN_OPT  = prog_optimized

.PHONY: all asm clean

all: $(BIN_BASE) $(BIN_OPT) asm

$(BIN_BASE): $(SRC) Makefile
	$(CC) $(CFLAGS_BASE) $(SRC) -o $(BIN_BASE) -lm

$(BIN_OPT): $(SRC) Makefile
	$(CC) $(CFLAGS_OPT) $(SRC) -o $(BIN_OPT) -lm

asm:
	mkdir -p asm
	$(CC) $(CFLAGS_BASE) -S -masm=intel -fverbose-asm $(SRC) -o asm/baseline_O0.s
	$(CC) $(CFLAGS_OPT) -S -masm=intel -fverbose-asm $(SRC) -o asm/optimized_O3.s

clean:
	rm -f $(BIN_BASE) $(BIN_OPT)
	rm -rf asm/*.s
