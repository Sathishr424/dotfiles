#!/bin/bash

GPU_INFO=$(nvidia-smi \
    --query-gpu=name,temperature.gpu,utilization.gpu,memory.used,memory.total,power.draw \
    --format=csv,noheader,nounits)

GPU_TEMP=$(echo "$GPU_INFO" | awk -F', ' '{print $2}')
GPU_USAGE=$(echo "$GPU_INFO" | awk -F', ' '{print $3}')
GPU_MEM_USED=$(echo "$GPU_INFO" | awk -F', ' '{print $4}')
GPU_MEM_TOTAL=$(echo "$GPU_INFO" | awk -F', ' '{print $5}')
GPU_POWER=$(echo "$GPU_INFO" | awk -F', ' '{print $6}')

GPU_FAN=$(sensors | awk '/fan2:/ {print $2; exit}')

GPU_MEM_PERCENT=$((GPU_MEM_USED * 100 / GPU_MEM_TOTAL))

printf '{"text":"󰢮  %s°C | 󰓅  %s%% | 󰍛  %s%% | 󰚥 %sW | 𖣘 %s","class":"process-status"}\n' \
    "$GPU_TEMP" "$GPU_USAGE" "$GPU_MEM_PERCENT" "$GPU_POWER" "$GPU_FAN"
