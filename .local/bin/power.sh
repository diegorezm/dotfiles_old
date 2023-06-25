#!/bin/bash 

declare options=("⏻ Shutdown
 Reboot
 Lock")

chs=$(echo -e "${options[@]}" | rofi -theme "power_macchiato"  -dmenu)
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


