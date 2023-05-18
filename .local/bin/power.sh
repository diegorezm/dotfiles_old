#!/bin/bash 

declare options=("⏻ Shutdown
 Reboot
 Lock")

chs=$(echo -e "${options[@]}" | rofi -theme "drofi" -line-padding 120 -dmenu -p ' Choose one: ')
case "${chs#* }" in 
        Shutdown)
                poweroff
        ;;
        Reboot)
                reboot
        ;;
        Lock)
                screenlock -w
        ;;
        *)
                exit 0
        ;;
esac


