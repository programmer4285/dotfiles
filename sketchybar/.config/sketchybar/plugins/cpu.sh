#!/bin/bash

CPU_USAGE=$(ps -A -o %cpu | awk '{s+=$1} END {print int(s)}')
sketchybar --set cpu label=" $CPU_USAGE%"
