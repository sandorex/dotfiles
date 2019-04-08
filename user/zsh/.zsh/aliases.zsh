#!/usr/bin/env zsh

if command -v lsd > /dev/null; then
   alias ls='lsd -F --icon=never --date=relative'
   alias l='ls -l'
   alias lr='l --tree'
   alias ll='l -a'
   alias llr='ll --tree'
else
   alias ls='ls -F --color=auto'
   alias l='ls -l'
   #alias lr='' # todo tree
   alias ll='l -A'
   #alias llr='ll --tree' # todo
fi

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'
alias grepy='grep -C 3'
alias du='du -h'
alias mkdir='mkdir -p'
alias df="df -kTh"
alias re='grep -E'
alias less='less --quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
alias ccat='kitty +kitten icat'

alias c='clear'
alias b='bat'
alias e='edit'

alias -g DATE='date +%Y-%m-%d'

alias iomon='sudo iotop'
alias sysmon='glances -t 1'

alias ctl='sudo systemctl'
alias uctl='systemctl --user'

# arch stuff
alias system-update='pikaur -Syu'
alias pkgs='pikaur -Ss'
alias pkgi='pikaur -S'
