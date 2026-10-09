

#!/usr/bin/env bash

CPU_TEMP=$(sensors | awk '/Package id 0:/ {
    gsub(/\+|°C/, "", $4)
    print $4
    exit
}')

CPU_USAGE=$(LC_ALL=C top -bn1 | awk '/^%Cpu/ {
    printf "%.1f", 100 - $8
    exit
}')

CPU_FAN=$(sensors | awk '/fan1:/ {
    print $2
    exit
}')

RAPL="/sys/devices/virtual/powercap/intel-rapl/intel-rapl:0"
CPU_POWER="N/A"

if sudo -n test -r "$RAPL/energy_uj" && [[ -r "$RAPL/max_energy_range_uj" ]]; then
    E1=$(sudo -n cat "$RAPL/energy_uj")
    MAX=$(cat "$RAPL/max_energy_range_uj")
    sleep 0.5
    E2=$(sudo -n cat "$RAPL/energy_uj")

    CPU_POWER=$(awk -v a="$E1" -v b="$E2" -v m="$MAX" \
        'BEGIN {
            if (b < a) b += m
            printf "%.1f", (b-a)/500000
        }')
fi

printf '{"text":"🔲 %s°C | %s%% | 𖣘 %s RPM | 󰚥 %sW","class":"process-status"}\n' \
    "${CPU_TEMP:-N/A}" "${CPU_USAGE:-N/A}" "${CPU_FAN:-N/A}" "$CPU_POWER"

