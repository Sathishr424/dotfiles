#!/bin/bash

RAM_USED=$(free -m | awk '/^Mem:/ {printf "%.1f", $3/1024}')
RAM_TOTAL=$(free -m | awk '/^Mem:/ {printf "%.1f", $2/1024}')

printf '{"text":"󰍛 %sGB / %sGB","class":"process-status "}\n' "$RAM_USED" "$RAM_TOTAL"
