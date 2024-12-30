#!/bin/zsh

#I have only one monitor, so the output device is always the same 
OUTPUT="HDMI-0"

#fetching brightness level with xrandr
BRIGHTNESS=$(xrandr --verbose | grep -i brightness | awk '{print $2}')

#transform values [0:1] into [0:100]%
BRIGHTNESS_PERCENT=$(awk "BEGIN {printf \"%d\", $BRIGHTNESS * 100}")

#output to display on polybar
echo "${BRIGHTNESS_PERCENT}%"

