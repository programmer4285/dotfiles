#!/bin/bash

ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track')
TRACK=$(osascript -e 'tell application "Spotify" to name of current track')

if [[ "$TRACK" != "" && "$ARTIST" != "" ]]; then
  sketchybar --set "$NAME" label="${TRACK}  ${ARTIST}"
else
  sketchybar --set "$NAME" label=""
fi
