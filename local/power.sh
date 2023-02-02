#!/bin/bash 

declare options=("⏻ Shutdown
 Reboot")

chs=$(echo -e "${options[@]}" | rofi -theme "cat-mocchi-center" -line-padding 120 -dmenu ' ')
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


