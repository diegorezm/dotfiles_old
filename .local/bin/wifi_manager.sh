#!/bin/bash 

wifi_ssid=$(nmcli -f SSID,BARS,SECURITY device wifi list | tail -n +2 | rofi -dmenu | awk '{print $1}')

password=$(rofi -dmenu -theme "drofi" -p "Password for $wifi_ssid:")

nmcli device wifi connect $wifi_ssid password $password && dunstify 'Connecting..'


