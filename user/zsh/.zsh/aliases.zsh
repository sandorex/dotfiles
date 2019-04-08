#!/usr/bin/env zsh

#if command -v exa > /dev/null; then
#   alias l='exa -lFh'
#   alias ls='exa'
#   alias ll='exa -laFh'
#else
#   alias l='ls -lFh'
#   alias ls='ls --color=auto'
#   alias ll='ls -lAFh'
#fi
# todo use bat instead of cat
# todo set ls depending if lsd exists or not
alias ls='lsd -F --icon=never --date=relative'
alias l='ls -l'
alias lr='l --tree'
alias ll='l -a'
alias llr='ll --tree'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'
alias du='du -h'

if [ "${TERMINFO}" = "/usr/lib/kitty/terminfo" ]; then
   alias ccat='kitty +kitten icat'
fi
