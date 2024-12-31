#!/bin/zsh

# fteching the output
wifi_info=$(nmcli -t -f ACTIVE,SSID,RATE,SIGNAL device wifi | grep '^yes')

# extracting values from text output
ssid=$(echo "$wifi_info" | awk -F: '{print $2}')
rate=$(echo "$wifi_info" | awk -F: '{print $3}' | sed 's/ Mbit\/s//')
signal=$(echo "$wifi_info" | awk -F: '{print $4}')

#setting icons and color based on the strenght of signal
if [[ "$signal" -gt 75 ]]; then
    icon="󰤨"  
    icon_color="%{F#61ffca}"  
elif [[ "$signal" -gt 65 ]]; then
    icon="󰤥"  # Medium signal
    icon_color="%{F#a277ff}"  
elif [[ "$signal" -gt 55 ]]; then
    icon="󰤢"  # Medium signal
    icon_color="%{F#f694ff}"  
elif [[ "$signal" -gt 45 ]]; then
    icon="󰤟"  # Medium signal
    icon_color="%{F#82e2ff}"  
elif [[ "$signal" -gt 35 ]]; then
    icon="󰤯"  # Weak signal
    icon_color="%{F#ffca85}"  
else
    icon="󰤭"  # Very weak signal
    icon_color="%{F#ff6767}"
fi

# colors for arrows that correspond to rx and tx
arrow_rx_color="%{F#61ffca}"  
arrow_tx_color="%{F#a277ff}"  

# format output adding colors to pieces
formatted_output="${icon_color}${icon}%{F-} ${arrow_rx_color} %{F-} ${arrow_tx_color}%{F-} ${rate} Mbit/s"

echo "$formatted_output"
