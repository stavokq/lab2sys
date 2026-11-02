#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/.."
mkdir -p results

if [ ! -d "FlameGraph" ]; then
    git clone https://github.com/brendangregg/FlameGraph.git
fi

make clean
make all

sudo sysctl -w kernel.perf_event_paranoid=-1 2>/dev/null || true
sudo sysctl -w kernel.kptr_restrict=0 2>/dev/null || true

perf record -F 99 --call-graph dwarf -e cpu-clock:u -o perf_baseline.data -- ./prog_baseline
perf script -F -period -i perf_baseline.data > results/out_baseline.perf
./FlameGraph/stackcollapse-perf.pl results/out_baseline.perf | \
    sed -E 's/^.+;main/main/' | \
    grep -v '^main;init_dataset' | \
    grep -v '^main;compute_summary' > results/out_baseline.folded

./FlameGraph/flamegraph.pl --title "FlameGraph: Baseline (-O0)" --width 1200 --height 38 --fontsize 13 results/out_baseline.folded > results/flamegraph_baseline.svg
perf report -i perf_baseline.data --stdio > results/perf_report_baseline.txt

perf record -F 99 --call-graph dwarf -e cpu-clock:u -o perf_optimized.data -- ./prog_optimized
perf script -F -period -i perf_optimized.data > results/out_optimized.perf
./FlameGraph/stackcollapse-perf.pl results/out_optimized.perf | \
    sed -E 's/^.+;main/main/' | \
    grep -v '^main;init_dataset' | \
    grep -v '^main;compute_summary' > results/out_optimized.folded

./FlameGraph/flamegraph.pl --title "FlameGraph: Optimized (-O3 -mavx2)" --width 1200 --height 38 --fontsize 13 results/out_optimized.folded > results/flamegraph_optimized.svg
perf report -i perf_optimized.data --stdio > results/perf_report_optimized.txt
