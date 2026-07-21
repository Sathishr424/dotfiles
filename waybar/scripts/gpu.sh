#!/bin/bash

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
GPU_POWER=$(echo "$GPU_INFO" | awk -F', ' '{print $5}')

GPU_FAN=$(sensors | awk '/fan2:/ {print $2; exit}')

printf '{"text":"🎮 %s°C | %s%% | %sW | 𖣘 %s","tooltip":"CPU","class":"process-status "}\n' "$GPU_TEMP" "$GPU_USAGE" "$GPU_POWER" "$GPU_FAN"
