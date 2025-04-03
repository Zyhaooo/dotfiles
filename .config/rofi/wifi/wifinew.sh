#!/bin/bash
# SCRIPT TO CONNECT TO NEW WIFI USING DMENU | ROFI

dir="$HOME/.config/rofi"

# bssid=$(nmcli device wifi list | sed -n '1!P'| cut -b 9- | dmenu -p "Wifi" -l 10 | awk '{print $1}')
# [ -z "$bssid" ] && exit 1
# pass=$(echo "" | dmenu -p "Enter password")
# [ -z "$pass" ] && notify-send "🔑 Password  not enterd" && exit 1
# nmcli device wifi connect $bssid password $pass
# notify-send "📶 New WiFi Connected"

bssid=$(nmcli -c no -t -f SSID,CHAN,SECURITY device wifi list | awk -F: '
BEGIN {
    emoji_2g = "📡";  # 2.4GHz
    emoji_5g = "🚀";  # 5GHz
    emoji_lock = "🔒";
    emoji_unlock = "🔓";
}
{
    ssid = $1;
    chan = $2;
    security = $3;

    # 判断频段
    band_emoji = (chan <= 14) ? emoji_2g : emoji_5g;
    
    # 判断加密状态
    sec_emoji = (security == "--") ? emoji_unlock : emoji_lock;

    print band_emoji " " sec_emoji " " ssid;
}'| rofi -dmenu -p "  wifis" -lines 10 | awk '{print $1}')
[ -z "$bssid" ] && exit 1
pass=$(echo "" | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "";}' -p "Enter password")
[ -z "$pass" ] && notify-send "🔑 Password not entered" && exit 1
nmcli device wifi connect $bssid password $pass
notify-send "📶 New WiFi Connected"
