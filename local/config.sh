#!/bin/bash 

declare option=("󰀼 vifm
 alacritty
 zsh
 xresources
 qtile
 nvim")

esc=$(echo -e "${option[@]}" | rofi -theme "cat-mocchi-center2" -dmenu -p 'Choose one:')
case "${esc#* }" in
        vifm)
                esc="$HOME/.config/vifm/vifmrc"
        ;;
        xresources)
                esc="$HOME/.config/Xresources"
        ;;
        zsh)
                esc="$HOME/.config/zsh/.zshrc"
        ;;
        qtile)
                esc="$HOME/.config/qtile/config.py"
        ;;
        nvim)
                esc="$HOME/.config/nvim/init.vim"
        ;;
        alacritty)
                esc="$HOME/.config/alacritty/alacritty.yml"
        ;;
        *)
                exit 0
        ;;
esac

alacritty -e nvim $esc
