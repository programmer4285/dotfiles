#!/bin/bash

MEMORY=$(vm_stat | awk '/Pages active/ {active=$3} /Pages wired down/ {wired=$4} END {print int((active+wired)*4096/1024/1024)}')
sketchybar --set memory label=" ${MEMORY}MB"
