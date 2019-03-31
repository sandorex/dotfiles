#!/usr/bin/env zsh

if command -v exa > /dev/null; then
   alias l='exa -lFh'
   alias ls='exa'
   alias ll='exa -laFh'
else
   alias l='ls -lFh'
   alias ls='ls --color=auto'
   alias ll='ls -lAFh'
fi

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'
alias du='du -h'

if [ "${TERMINFO}" = "/usr/lib/kitty/terminfo" ]; then
   alias ccat='kitty +kitten icat'
   alias icat='ccat'
fi
