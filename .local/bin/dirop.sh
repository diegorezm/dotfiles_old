#!/bin/bash 
declare option=(" .local
 download
 images
 Xresources
 docs 
 videos 
 code
 music
 bin
 share")
esc=$(echo -e "${option[@]}" | rofi -theme "drofi" -dmenu -p 'Choose one:')
case "${esc#* }" in
        docs)
                esc="$HOME/docs"
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
                esc="$HOME/docs/code"
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
        Xresources)
                esc="$HOME/.config/Xresources"
        ;;
        *)
                exit 0 
        ;;
esac
alacritty --working-directory=$esc
