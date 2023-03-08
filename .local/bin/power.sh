#!/bin/bash 

declare options=("⏻ Shutdown
 Reboot")

chs=$(echo -e "${options[@]}" | rofi -theme "drofi" -line-padding 120 -dmenu -p ' Choose one: ')
case "${chs#* }" in 
        Shutdown)
                poweroff
                ;;
        Reboot)
                reboot
        ;;
        *)
                exit 0
        ;;
esac


