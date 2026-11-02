#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/.."
mkdir -p results

make all

echo "time baseline:"
/usr/bin/time -v ./prog_baseline > /dev/null 2> results/time_baseline.txt
grep -E "(User time|System time|Elapsed|Maximum resident|Page faults|context switches)" results/time_baseline.txt

echo ""
echo "time optimized:"
/usr/bin/time -v ./prog_optimized > /dev/null 2> results/time_optimized.txt
grep -E "(User time|System time|Elapsed|Maximum resident|Page faults|context switches)" results/time_optimized.txt

echo ""
echo "perf stat baseline:"
perf stat -d ./prog_baseline > /dev/null 2> results/perf_stat_baseline.txt || true
cat results/perf_stat_baseline.txt

echo ""
echo "perf stat optimized:"
perf stat -d ./prog_optimized > /dev/null 2> results/perf_stat_optimized.txt || true
cat results/perf_stat_optimized.txt
