#!/bin/bash

CPU_TEMP=$(sensors | awk '/Package id 0:/ {gsub("\\+|°C","",$4); print $4}')
CPU_USAGE=$(top -bn1 | awk '/^%Cpu/ {printf "%.1f", 100 - $8}')

CPU_FAN=$(sensors | awk '/fan1:/ {print $2; exit}')


printf '{"text":"🔲 %s°C | %s%% | 𖣘 %s","class":"process-status "}\n' "$CPU_TEMP" "$CPU_USAGE" "$CPU_FAN"
