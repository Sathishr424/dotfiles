#!/bin/bash

# ===========================
# CPU
# ===========================

CPU_TEMP=$(sensors | awk '/Package id 0:/ {gsub("\\+|°C","",$4); print $4}')
CPU_USAGE=$(top -bn1 | awk '/^%Cpu/ {printf "%.1f", 100 - $8}')

# ===========================
# RAM
# ===========================

RAM_USED=$(free -m | awk '/^Mem:/ {printf "%.1f", $3/1024}')
RAM_TOTAL=$(free -m | awk '/^Mem:/ {printf "%.1f", $2/1024}')
RAM_USAGE=$(free | awk '/^Mem:/ {printf "%.1f", $3/$2*100}')

# ===========================
# Fans
# ===========================

CPU_FAN=$(sensors | awk '/fan1:/ {print $2; exit}')
GPU_FAN=$(sensors | awk '/fan2:/ {print $2; exit}')

# ===========================
# SSD Temperatures
# ===========================

SSD1_TEMP=$(sensors | awk '
/nvme-pci-e100/ {found=1; next}
found && /Composite:/ {
    gsub("\\+|°C","",$2)
    print $2
    exit
}')

SSD2_TEMP=$(sensors | awk '
/nvme-pci-e200/ {found=1; next}
found && /Composite:/ {
    gsub("\\+|°C","",$2)
    print $2
    exit
}')

# ===========================
# GPU
# ===========================

IFS=',' read -r GPU_NAME GPU_TEMP GPU_USAGE GPU_MEM GPU_POWER <<< "$(
nvidia-smi \
    --query-gpu=name,temperature.gpu,utilization.gpu,memory.used,power.draw \
    --format=csv,noheader,nounits
)"

GPU_INFO=$(nvidia-smi \
    --query-gpu=name,temperature.gpu,utilization.gpu,memory.used,power.draw \
    --format=csv,noheader,nounits)

GPU_TEMP=$(echo "$GPU_INFO" | awk -F', ' '{print $2}')
GPU_USAGE=$(echo "$GPU_INFO" | awk -F', ' '{print $3}')
GPU_MEM=$(echo "$GPU_INFO" | awk -F', ' '{print $4}')
GPU_POWER=$(echo "$GPU_INFO" | awk -F', ' '{print $5}')

# ===========================
# Output
# ===========================

echo "CPU Temp      : ${CPU_TEMP}°C"
echo "CPU Usage     : ${CPU_USAGE}%"

echo "RAM Used      : ${RAM_USED} MB"
echo "RAM Total     : ${RAM_TOTAL} MB"
echo "RAM Usage     : ${RAM_USAGE}%"

echo "Disk Used     : ${DISK_USED}"
echo "Disk Total    : ${DISK_TOTAL}"
echo "Disk Usage    : ${DISK_USAGE}%"

echo "Battery       : ${BATTERY}% (${BATTERY_STATUS})"

echo "CPU Fan       : ${CPU_FAN} RPM"
echo "GPU Fan       : ${GPU_FAN} RPM"

echo "SSD1 Temp     : ${SSD1_TEMP}°C"
echo "SSD2 Temp     : ${SSD2_TEMP}°C"

echo "GPU Name      : ${GPU_NAME}"
echo "GPU Temp      : ${GPU_TEMP}°C"
echo "GPU Usage     : ${GPU_USAGE}%"
echo "GPU Memory    : ${GPU_MEM} MiB"
echo "GPU Power     : ${GPU_POWER} W"


echo '{"text":"󰕾 45%","tooltip":"Speaker volume: 45%","class":"normal"}'
