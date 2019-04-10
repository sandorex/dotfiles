# run only in interactive shells
[[ $- != *i* ]] && return

## terminal options
shopt -s autocd # cd by typing a path
HISTCONTROL=ignoreboth # ignore duplicate commands and commands prefixed by space in history

export PS1="\[$(tput bold)\]\[$(tput setaf 5)\]\w\\n\[$(tput setaf 3)\]\\$ \[$(tput sgr0)\]"

## environment
export TERM=xterm-256color

## load other files
source ~/.bash/functions.sh
#source ~/.bash/aliases.sh
source ~/.bin/shell/aliases
source ~/.bin/paths/shell
