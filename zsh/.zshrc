#!/bin/zsh
#
PATH=$HOME/.local/bin:$PATH
# options
setopt dotglob
# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"



echo "⣿⣿⣿⣿⠿⡿⠟⠛⣋⣉⣥⣤⣶⠆⢸⣿⡇⣿⣿⣿⣿⣿⡏⠻⣿⣿⣿⣿⣷⡙⡏⣿⣿⣿⣿⣿⣷⡌⢿⣷⡘⣿⣿⣿⣿⡇⣿⣿⣿⣿
⣿⣿⣶⣿⣿⣿⢰⣿⡏⣼⣿⣿⣿⠀⢸⣿⡇⢿⣿⣿⣿⣿⡇⠇⢹⣿⣿⣿⣏⠳⠘⢹⣿⡈⢿⣿⣿⠻⡌⣿⣿⡜⣿⣿⣿⡇⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⢸⣿⣧⣿⣿⣿⡿⠀⠸⣿⣇⢸⠹⣿⣿⣿⣿⠀⠀⢿⣿⣿⣿⡆⠁⢸⣿⡇⡜⣿⣿⣧⠀⠸⣿⣷⡘⣿⣿⣧⣿⡟⣿⣿
⣿⣿⣿⣿⣿⡿⢸⣿⢿⣿⣿⣿⡇⣷⡄⢻⣿⡈⠀⣿⣿⣿⣿⡆⢰⠸⣿⠿⠿⣿⠀⠘⣿⡇⣁⠸⠟⠻⠇⠀⢻⣿⣧⢹⣿⣿⣿⣿⣹⣿
⣿⣿⣿⣿⣿⠁⡀⣿⣸⣿⣿⣿⡇⣿⣿⡌⢿⡇⠀⢹⣿⣿⣿⠓⠀⢀⣠⣴⣶⣦⣄⠂⠿⢰⣿⣦⣼⡆⢦⢀⠈⣿⣿⡆⣿⣿⣿⣿⣏⣭
⣿⣿⣿⣿⡇⠀⠀⠸⡇⣿⣿⣿⡇⠙⠛⢿⠈⠇⢠⡘⠿⢋⣉⣀⣄⢻⠿⠛⠋⢁⣩⣥⣀⢿⣿⣿⣿⣷⠘⣾⣆⣹⣿⣿⠼⣿⣿⣿⣿⣿
⣿⣿⣿⡿⡇⠿⠃⠀⠃⢹⣿⡿⢧⢸⣿⣿⣆⢠⡈⢣⡶⠟⠟⠟⠿⠛⢀⠤⠚⠉⠁⢀⣤⣀⣀⠉⠙⢛⡆⣿⡿⣿⣿⣿⡇⢻⣿⣿⣿⣿
⣿⣿⣿⡇⡇⢤⣾⣿⣦⡀⣴⣶⣶⣄⣿⣿⣿⡀⠻⣷⣾⣿⣿⣿⡶⡠⠋⢀⣀⣠⡾⣸⣿⣿⣿⣿⣆⠀⣄⢸⡇⣿⣿⣿⣷⠈⣿⣿⣿⣿
⣿⠿⠿⠧⠀⢸⣿⡿⠟⠛⠉⠉⠉⠁⠙⢿⣿⣷⢀⣿⣿⣿⣿⣿⣿⠀⣠⣌⣙⢛⣵⣿⣿⣿⣿⣿⠇⣸⣿⢸⠃⣿⡏⣿⣿⡆⠸⣿⣿⣿
⣤⣾⣷⠀⠈⠘⠋⠀⣀⣤⠀⣀⠀⠀⢀⣨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⠟⠋⠉⣀⣀⣀⢈⡤⣪⣈⢻⠘⠀⣿⡇⣿⣿⣇⠀⢻⣿⣿
⣿⣿⡟⠀⡀⠀⠀⣾⣿⣿⣷⣌⣛⣉⣼⣿⣿⡏⢿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⣠⠎⣭⢟⡹⢋⠜⠐⡡⠋⢠⡀⢻⢸⣿⣿⣿⢰⡈⢿⣿
⣿⣿⢳⠀⣿⣦⠀⢙⡿⠛⢋⠉⣩⠍⣹⡿⣡⣾⣎⣿⣿⣿⣿⣿⣟⠁⣠⣤⢞⣡⣾⡿⢋⡴⡱⠂⢀⠔⣴⣿⣧⡈⣾⢻⣿⣿⢸⣷⠀⢿
⣿⣿⠸⡆⠙⣿⣃⡼⢁⡴⠉⡼⢃⠆⢌⣼⣵⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣷⣟⣴⣿⢏⣴⣿⡧⠸⢸⣿⡟⣠⣿⢸⣿⣿⣿⣿⡆⢊
⣿⣿⡄⠳⡀⢹⣿⢢⠃⣠⠖⡰⠁⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣡⣿⣿⣿⣿⣷⣿⠟⣰⠟⠁⢸⣿⣿⣿⣿⣧⠈
⢿⣿⡇⠀⠀⠈⣹⡟⣰⢋⣼⢞⣴⣿⣿⣿⣿⣿⣿⠿⠟⣛⣫⣭⣛⠻⠿⣿⣿⡿⠏⣰⣿⣿⣿⣿⡿⠟⢁⣨⣴⡏⣴⢸⣿⣿⣧⣿⣏⡄
⠸⣿⣧⠀⠀⠠⣄⠻⢡⣿⣯⣾⣿⣿⣿⣿⣿⠟⣡⠖⠛⠉⠉⠁⠈⠉⠓⠀⠀⠀⢰⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⡇⢹⢸⣿⣿⣿⣿⣿⣿
⣆⢻⣿⣆⠀⠀⢻⣿⣶⣶⣿⢿⣿⣿⣷⡄⠁⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠸⠘⣿⣿⣿⣿⣿⣿
⣿⠀⡙⠿⣧⡀⠈⢿⣿⣿⢿⡙⣿⣿⣿⣿⣆⠀⠀⣰⣦⡄⠀⢀⣤⣶⣿⣇⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠐⠀⣿⣿⢹⣿⣿⢿
⡃⠀⣿⣷⡌⠛⠶⠄⠛⠿⠶⠖⣹⣿⣿⣿⣿⣆⢀⣿⣿⣷⢀⣿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣬⣽⣿⠟⠁⠀⠀⢀⡀⢻⣿⠘⣿⣿⣆
⠁⣼⣿⠟⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⡇⢸⣿⣿⡟⣋⠀⢻⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⢀⠘⠿⣘⠏⠄⡻⣿⣿
⣤⣉⡁⠀⠂⠒⠂⠒⡆⠈⣿⡆⠙⠿⣿⣿⣿⣿⢻⣿⣿⠇⢿⣿⣿⣾⠏⠘⠂⣿⣿⣿⣿⡿⠋⠁⠀⠀⢠⠄⠀⠀⠀⠀⡟⠀⠘⢇⠈⠻
⣿⣿⣿⣷⣦⣀⠀⠀⠀⣰⣿⠁⠀⠀⠈⠙⠿⣿⡸⣿⣿⣷⣾⣿⠟⣫⣾⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣰⠃⠀⣰⠈⢷⣶
⣿⣿⣿⣿⣿⣿⣿⣦⣄⠉⠁⠀⠀⠀⠀⠀⠀⠈⠁⢹⣿⣿⣿⢁⣾⣿⣿⣿⠿⢋⣡⣤⠤⠀⢀⣀⣤⣤⣶⣶⣿⣿⣿⡏⠀⢀⣽⣷⣄⢻
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡱⣶⣤⣄⣀⣀⣀⣀⣀⠸⣟⣇⠸⠿⠛⠋⠁⢒⣉⣤⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⣸⣿⣿⣿⣧
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⠛⢿⣿⣿⣿⣿⣿⣷⠌⣿⠀⣤⣄⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⢐⣿⣿⣿⣿⣿"

alias v='nvim'
alias lv="nvim -c':e#<1'"
alias s='nvim main.tex'
# z
source ~/.config/zsh/z.zsh
source ~/.config/zsh/termtitle.zsh
alias f="z"

alias uiomount='sshfs -o reconnect,ServerAliveInterval=2 adaha@login.ifi.uio.no:. ~/ifilokal/ifilokal'
export GRIM_DEFAULT_DIR="$HOME/pictures"
export GPG_TTY=$(tty)

# autocompletion
autoload -U compinit && compinit
zstyle ':completion:*' cache-path $HOME/.cache/zsh/zcompcache
setopt COMPLETE_IN_WORD
setopt MENU_COMPLETE
export TERM=xterm-256color

# git
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
typeset -a precmd_functions
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' unstagedstr '%F{196}'
zstyle ':vcs_info:*' stagedstr '%F{208}'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '(%F{046}%c%u%b%f%f) '
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'

# prompt
export NEWLINE=$'\n'
rightarrow=$(echo -en '\u25aa')
export PROMPT2=" ${rightarrow} "
export PROMPT='[%?] ${HOST%%.*}:%F{027}%~% %f ${vcs_info_msg_0_} %f${NEWLINE}${PROMPT2}'

# this is to make pip not halt looking for some keyring
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
export PAGER='less'

# history
export HISTFILE="$HOME/.cache/zsh/history"
export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
alias history="history 0"

# aliases

alias l='exa --icons --time-style=long-iso --ignore-glob="__pycache__"'
alias mosh='mosh --no-init'
alias ls="exa --icons --time-style=long-iso -a"
alias tree="tree -L 3 -C"
alias mv='mv --interactive'
alias v='nvim'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cal='cal -m'
alias nohloop="while true; do; tail -n 50 nohup.out; sleep 1; done;"
alias nohuppy="nohup python3 -u -Wignore"
alias act='source .venv/bin/activate'

# git aliases
alias gs="git status"
alias gc="git commit -s"
alias ga="git add"
alias gp="git push"
alias gd="git diff"
alias gr="git restore"
alias gpl="git pull"

alias m="make"
alias mc="make clean"


# python aliases
alias python='python3'
alias pip='pip3'
alias py="python3 -q"
alias a='source a'

# other aliases
alias :q='exit'
alias c='z' # c is easier to hit
alias pac='sudo pacman -Syu'

alias close='disown && exit'

# this is to make latex installer work
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

# cd also runs ls
function cd() {
    new_directory="$*";
    if [ $# -eq 0 ]; then 
        new_directory=${HOME};
    fi;
    builtin cd -- "${new_directory}" && l
}


function lazygit() {
    git add -u
    git commit -m "$1"
    git push
}


# beatufil ranger-cd
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        builtin cd -- "$(cat "$tempfile")"
    fi  
    rm -f -- "$tempfile"
}

function d {
    swaymsg 'workspace 2'
    if ! pgrep -x "firefox" > /dev/null; then
        firefox 2> /dev/null 1> /dev/null &!
    fi
    
    swaymsg 'workspace 2'
    if ! pgrep -x "discord" > /dev/null; then
        discord 2> /dev/null 1> /dev/null &!
    fi

    swaymsg 'layout tabbed'
}
bindkey -s '^R' 'ranger-cd\n'


# ------- alert if long since last pacman action ---------

export PYTHONSTARTUP=$HOME/.config/python/pythonrc


export R_LIBS_USER=$HOME/.rlibrary/library

