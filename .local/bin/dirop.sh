#!/bin/bash 
declare option=(" .local
 download
 images
 document 
 videos 
 code
 music
 bin
 share")
esc=$(echo -e "${option[@]}" | rofi -theme "drofi" -dmenu -p 'Choose one:')
case "${esc#* }" in
        document)
                esc="$HOME/doc"
        ;;
        .local)
                esc="$HOME/.local"
        ;;
        videos)
                esc="$HOME/vids"
        ;;
        download)
                esc="$HOME/down"
        ;;
        images)
                esc="$HOME/img"
        ;;
        code)
                esc="$HOME/doc/code"
        ;;
        music)
                esc="$HOME/msc"
        ;;
        bin)
                esc="$HOME/.local/bin"
        ;;
        share)
                esc="$HOME/.local/share"
        ;;
        *)
                exit 0 
        ;;
esac
alacritty --working-directory=$esc
