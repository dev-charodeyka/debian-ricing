#!/bin/zsh

#fetching the current volume and mute status
VOLUME=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $2}')
MUTED=$(wpctl get-volume @DEFAULT_SINK@ | grep -q MUTED && echo 1 || echo 0)

#preoaring the output for Polybar
if [[ "$MUTED" == 1 ]]; then
  echo "%{F#edecee} %{F-}"
else
  VOLUME_PERCENT=$(awk "BEGIN {print int($VOLUME * 100)}")
  echo "${VOLUME_PERCENT}%"
fi

