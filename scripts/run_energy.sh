#!/usr/bin/env bash
set -e
export LC_NUMERIC=C

cd "$(dirname "$0")/.."
mkdir -p results

if [ ! -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
    sudo sh -c 'echo :WSLInterop:M::MZ::/init:PF > /proc/sys/fs/binfmt_misc/register' 2>/dev/null || true
fi

make all > /dev/null

coproc PS { /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -NoLogo -Command -; }

read_rapl() {
    echo 'Get-CimInstance -Namespace root/cimv2 -ClassName Win32_PerfRawData_PowerMeterCounter_EnergyMeter | ForEach-Object { "$($_.Name) $($_.Energy) $($_.Time)" }; Write-Output "END_RAPL"' >&"${PS[1]}"
    local line pkg=0 cores=0 t=0
    while IFS= read -r line <&"${PS[0]}"; do
        line="${line%$'\r'}"
        [[ "$line" == "END_RAPL" ]] && break
        if [[ "$line" == RAPL_Package0_Core* ]]; then
            local val
            val=$(echo "$line" | awk '{print $2}')
            cores=$((cores + val))
        elif [[ "$line" == RAPL_Package0_PKG* ]]; then
            pkg=$(echo "$line" | awk '{print $2}')
            t=$(echo "$line" | awk '{print $3}')
        fi
    done
    echo "$pkg $cores $t"
}

read_rapl > /dev/null
sleep 1

read -r i_pkg0 i_cor0 i_t0 <<< "$(read_rapl)"
sleep 3
read -r i_pkg1 i_cor1 i_t1 <<< "$(read_rapl)"

read -r b_pkg0 b_cor0 b_t0 <<< "$(read_rapl)"
./prog_baseline > /dev/null
read -r b_pkg1 b_cor1 b_t1 <<< "$(read_rapl)"

sleep 1

read -r o_pkg0 o_cor0 o_t0 <<< "$(read_rapl)"
./prog_optimized > /dev/null
read -r o_pkg1 o_cor1 o_t1 <<< "$(read_rapl)"

echo "exit" >&"${PS[1]}"

awk -v ip0="$i_pkg0" -v ic0="$i_cor0" -v it0="$i_t0" \
    -v ip1="$i_pkg1" -v ic1="$i_cor1" -v it1="$i_t1" \
    -v bp0="$b_pkg0" -v bc0="$b_cor0" -v bt0="$b_t0" \
    -v bp1="$b_pkg1" -v bc1="$b_cor1" -v bt1="$b_t1" \
    -v op0="$o_pkg0" -v oc0="$o_cor0" -v ot0="$o_t0" \
    -v op1="$o_pkg1" -v oc1="$o_cor1" -v ot1="$o_t1" 'BEGIN {
    pwh_to_j = 3.6e-9

    dt_idle = (it1 - it0) / 1000.0
    e_idle_pkg = (ip1 - ip0) * pwh_to_j
    e_idle_cor = (ic1 - ic0) * pwh_to_j
    p_idle_pkg = e_idle_pkg / dt_idle
    p_idle_cor = e_idle_cor / dt_idle

    dt_base = (bt1 - bt0) / 1000.0
    es_base = (bp1 - bp0) * pwh_to_j
    ec_base = (bc1 - bc0) * pwh_to_j
    ep_base = es_base - (p_idle_pkg * dt_base)
    if (ep_base <= 0) ep_base = ec_base
    ps_base = es_base / dt_base
    pp_base = ep_base / dt_base

    dt_opt = (ot1 - ot0) / 1000.0
    es_opt = (op1 - op0) * pwh_to_j
    ec_opt = (oc1 - oc0) * pwh_to_j
    ep_opt = es_opt - (p_idle_pkg * dt_opt)
    if (ep_opt <= 0) ep_opt = ec_opt
    ps_opt = es_opt / dt_opt
    pp_opt = ep_opt / dt_opt

    printf "Label,DurationSec,IdlePowerW,SysPowerW,ProgPowerW,SystemEnergyJ,CoreEnergyJ,ProgramEnergyJ\n" > "results/energy_comparison.csv"
    printf "baseline,%.3f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f\n", dt_base, p_idle_pkg, ps_base, pp_base, es_base, ec_base, ep_base >> "results/energy_comparison.csv"
    printf "optimized,%.3f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f\n", dt_opt, p_idle_pkg, ps_opt, pp_opt, es_opt, ec_opt, ep_opt >> "results/energy_comparison.csv"

    printf "Idle Power (RAPL_Package0_PKG): %.2f W | Cores Idle: %.2f W\n\n", p_idle_pkg, p_idle_cor
    printf "%-12s %-10s %-12s %-12s %-14s %-14s %-14s\n", "Version", "Time(s)", "SysPower(W)", "ProgPower(W)", "SysEnergy(J)", "CoreEnergy(J)", "ProgEnergy(J)"
    printf "%-12s %-10.3f %-12.2f %-12.2f %-14.2f %-14.2f %-14.2f\n", "baseline", dt_base, ps_base, pp_base, es_base, ec_base, ep_base
    printf "%-12s %-10.3f %-12.2f %-12.2f %-14.2f %-14.2f %-14.2f\n", "optimized", dt_opt, ps_opt, pp_opt, es_opt, ec_opt, ep_opt
}'
