#!/bin/bash

## pacman/aur
alias pas='pacman -Ss'
alias pai='sudo pacman -S'
alias pau='sudo pacman -Syyu'
alias pikas='pikaur -Ss'
alias pikai='pikaur -S'
alias pikau='pikaur -Syyu'

## utils
alias e="micro"
alias edit="micro"
alias mkdir="mkdir --parents" # no error, make parent dir if needed
alias ls="ls -F --color=auto --ignore='\"lost+found\"'"
alias l="ls -lF"
alias ll="ls -alF"
alias df="df -kTh" # human readable, type of filesystem
alias du="du -h" # human readable
alias dus="du -sh" # human readable, total
alias res='source ~/.bashrc'
alias tree='tree --filelimit 10'
alias cdatea='date +%Y-%b-%d' # date with abbrev month name
alias cdate='date +%Y-%m-%d'
alias ctls='systemctl status'
alias ctlf='systemctl --failed'
alias ctl='sudo systemctl'
alias uctl='systemctl --user'
alias uctlf='systemctl --user --failed'
alias jctlf='sudo journalctl -p 3 -xb'
alias mslp='sleep 1; xset dpms force off'
alias grep='grep --color=auto'
alias greppy='grep -C 3'
alias io='sudo iotop'

# misc
alias zt-start='sudo systemctl start zerotier-one'
alias zt-stop='sudo systemctl stop zerotier-one'
alias zt-info='sudo zerotier-cli info'
alias zt-peers='sudo zerotier-cli listpeers'
