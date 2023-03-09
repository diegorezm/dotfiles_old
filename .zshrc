if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
#       General conf
stty stop undef
autoload -U colors && colors

export EDITOR=/bin/nvim
export VISUAL=/bin/nvim

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history
setopt correctall
unsetopt correct_all

#        PROMPT
NEWLINE=$'\n'
PROMPT=" %(?.%F{154}√.%F{160}? %?)%f %B%F{213}[%0~]%f%b%F{154} > "

export KEYTIMEOUT=1
#       Show vim mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins 
    echo -ne "\e[5 q"
}
zle -N zle-line-init
preexec() { echo -ne '\e[5 q' ;} 


#       alias
alias ap="sudo pacman -S"
alias p="sudo pacmna -Sy"
alias rp="sudo pacman -Rcs"
alias pu="sudo pacman -Syu"
alias aps="pacman -Ss"
alias grep="grep --color=auto"
alias vf="vifm"
alias sxiv="sxiv -b"
alias xd="xrdb -merge $HOME/.config/Xresources"
alias n="nvim"
alias ms="ncmpcpp"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME/'
alias yt-audio="yt-dlp --add-metadata -x -i -f bestaudio"
alias yt-video="yt-dlp --add-metadata -i -f best/video"
alias l="exa -al --color=always --group-directories-first"
alias ls="exa -a --color=always --group-directories-first"
alias sl="exa -a --color=always --group-directories-first"
alias cp="cp -i"
alias dcompile="sudo make clean install"
alias commit="git commit -m"
alias push="git push origin"
alias gitconf="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

#       autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
compinit
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

#      Keybinds
bindkey -v
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
bindkey '^R' history-incremental-search-backward


bindkey -s '^f' 'nvim $(find ~/.local/bin/ -type f | fzf)\n'
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


unpack () {
    if [ -f $1 ] ; then
            case $1 in
            *.tar.bz2)    tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.tar.xz)    tar xf $1      ;;
            *.bz2)        bunzip2 $1     ;;
            *.rar)        unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)        tar xvf $1     ;;
            *.tbz2)        tar xvjf $1    ;;
            *.tgz)        tar xvzf $1    ;;
            *.zip)        unzip $1       ;;
            *.Z)        uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)        echo "don't know how to extract '$1'..." ;;
            esac
    else
            echo "'$1' is not a valid file!"
    fi
 }

#       source 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
