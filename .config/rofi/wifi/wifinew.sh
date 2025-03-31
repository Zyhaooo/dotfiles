#!/bin/bash
# SCRIPT TO CONNECT TO NEW WIFI USING DMENU | ROFI

dir="$HOME/.config/rofi"

bssid=$(nmcli device wifi list | sed -n '1!P' | cut -b 9- | rofi -dmenu -p " " -lines 10 | awk '{print $1}')
[ -z "$bssid" ] && exit 1
pass=$(echo "" | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "";}' -p "Enter password")
[ -z "$pass" ] && notify-send "🔑 Password not entered" && exit 1
nmcli device wifi connect $bssid password $pass
notify-send "📶 New WiFi Connected"
