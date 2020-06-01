#!/bin/sh

if command -v lsd > /dev/null; then
   alias ls='lsd -F --icon=never --date=relative'
   alias l='ls -l'
   alias lr='l --tree'
   alias ll='l -a'
   alias llr='ll --tree'
else
   alias ls='ls -Fh --color=auto'
   alias l='ls -l'
   alias lr='tree'
   alias ll='l -A'
   alias llr='tree -a'
fi

alias bat='bat --tabs=4'

alias -- -='cd -'
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias grep='grep --color'
alias greppy='grep -C 3'
alias du='du -h'
alias df="df -kTh"
alias re='grep -E'
alias less='bat'
alias ccat='kitty +kitten icat'
alias scb="xclip -selection c"
alias gcb="xclip -selection c -o"

alias c='clear'
alias b='bat'
alias e='edit'
alias v='nvim'

alias iotop='sudo iotop'
alias glances='glances -t 1'

alias ctl='systemctl'
alias uctl='systemctl --user'

alias docker-start='sudo systemctl start docker.service'
alias docker-stop='sudo systemctl stop docker.service'
alias docker='sudo docker'

alias docker-compose='sudo docker-compose'
