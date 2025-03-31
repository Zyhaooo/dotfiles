#!/bin/bash
# TO CONNECT TO WIFI USING DMENU | ROFI WHICH IS CONNECTED BEFORE
# bssid=$(nmcli device wifi list | sed -n '1!P'| cut -b 9- | dmenu -p "Wifi" -l 10 | awk '{print $1}')

dir="$HOME/.config/rofi"

bssid=$(nmcli device wifi list | sed -n '1!P'| cut -b 9- | rofi -dmenu -p " " -lines 10 | awk '{print $1}')
[ -z "$bssid" ] && exit 1
nmcli device wifi connect $bssid
notify-send "📶 WiFi Connected"
