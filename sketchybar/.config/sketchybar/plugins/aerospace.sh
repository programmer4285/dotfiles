#!/bin/bash

source "${CONFIG_DIR}/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME background.drawing=on \
    label.color="${MAROON}" \
    background.color="${SURFACE2}"
else
  sketchybar --set $NAME background.drawing=off \
    label.color="${SUBTEXT}" \
    background.color="${BASE}"
fi
