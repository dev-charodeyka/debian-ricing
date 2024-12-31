#!/bin/zsh

#fetching output
wifi_info=$(nmcli -t -f ACTIVE,SSID,RATE,SIGNAL device wifi | grep '^yes')

# extracting SSID (name of the connected wifi)
ssid=$(echo "$wifi_info" | awk -F: '{print $2}')
# if not connected
if [[ -z "$ssid" ]]; then
  ssid="Not connected"
fi

# send notification using dunstify
dunstify -u low -t 3000 "  $ssid"
