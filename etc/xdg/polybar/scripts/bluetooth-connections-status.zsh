#!/bin/zsh

#My marshall IV headset NAC address
HEADSET_MAC="XX:XX:XX:XX:XX:XX"

#fetching bluetooth power status
if [[ $(bluetoothctl show | grep -q "Powered: yes" && echo 1 || echo 0) -eq 0 ]]; then
  #if bluetooth is off:
  echo "%{F#edecee}󰂲"
else
  #check what is connected
  CONNECTED_DEVICES=$(bluetoothctl devices Connected | awk '{print $2}')
  
  if [[ -z "$CONNECTED_DEVICES" ]]; then
    # bluetooth is on but no device is connected
    echo "%{F#ffca85}"
  elif [[ "$CONNECTED_DEVICES" == "$HEADSET_MAC" ]]; then
    # if ONLY my headset is connected
    echo "%{F#61ffca}󰥰" 
  else
    # if something ELSE is connected
    echo "%{F#a277ff}󰂴"
  fi
fi
