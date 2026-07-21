#!/bin/bash

INTERFACE=$(ip route get 1.1.1.1 | awk '{print $5; exit}')

RX1=$(<"/sys/class/net/$INTERFACE/statistics/rx_bytes")
TX1=$(<"/sys/class/net/$INTERFACE/statistics/tx_bytes")

sleep 1

RX2=$(<"/sys/class/net/$INTERFACE/statistics/rx_bytes")
TX2=$(<"/sys/class/net/$INTERFACE/statistics/tx_bytes")

DOWN=$(awk "BEGIN {printf \"%.2f\", ($RX2-$RX1)/1024/1024}")
UP=$(awk "BEGIN {printf \"%.2f\", ($TX2-$TX1)/1024/1024}")

printf '{"text":"󰁅 %s MB/s 󰕒 %s MB/s","tooltip":"Network Speed"}\n' "$DOWN" "$UP"
