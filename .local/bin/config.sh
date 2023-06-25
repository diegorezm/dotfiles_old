#!/bin/bash 

declare option=("󰀼 vifm
 alacritty
 zsh
 xresources
 qtile
 rofi
 nvim")

esc=$(echo -e "${option[@]}" | rofi -theme "config_macchiato" -dmenu -p 'Choose one:')
case "${esc#* }" in
        vifm)
                esc="$HOME/.config/vifm/vifmrc"
        ;;
        xresources)
                esc="$HOME/.config/Xresources"
        ;;
        zsh)
                esc="$HOME/.zshrc"
        ;;
        qtile)
                esc="$HOME/.config/qtile/config.py"
        ;;
        nvim)
                esc="$HOME/.config/nvim/"
        ;;
        alacritty)
                esc="$HOME/.config/alacritty/alacritty.yml"
        ;;
        rofi)
                esc="$HOME/.local/share/rofi/"
        ;;
        *)
                exit 0
        ;;
esac

alacritty -e nvim $esc
