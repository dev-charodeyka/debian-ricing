#!/bin/zsh

#my single monitor as output
OUTPUT="HDMI-0"

#fetching current brightness to use as starting point
BRIGHTNESS=$(xrandr --verbose | grep -i brightness | awk '{print $2}')

#actions based on arguments assotiated with mouse clicks
if [[ "$1" == "up" ]]; then
  NEW_BRIGHTNESS=$(echo "$BRIGHTNESS + 0.1" | bc)
elif [[ "$1" == "down" ]]; then
  NEW_BRIGHTNESS=$(echo "$BRIGHTNESS - 0.1" | bc)
else
  exit 1
fi

#do not change brightness if the clicks are too many that will bring brightness outside od range
NEW_BRIGHTNESS=$(awk "BEGIN {print ($NEW_BRIGHTNESS > 1.0) ? 1.0 : ($NEW_BRIGHTNESS < 0.1 ? 0.1 : $NEW_BRIGHTNESS)}")

#set new brightness level with xrandr
xrandr --output "$OUTPUT" --brightness "$NEW_BRIGHTNESS"

#BRIGHTNESS_PERCENT=$(( NEW_BRIGHTNESS * 100 ))
#echo "${BRIGHTNESS_PERCENT}%"

