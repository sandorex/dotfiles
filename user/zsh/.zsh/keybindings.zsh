#!/usr/bin/env zsh

# array with all the keys used
# prefixes c - ctrl, s - shift
# cbackspace (^H) is not available in terminfo
typeset -A keys
keys[left]=${terminfo[kLFT5]}
keys[right]=${terminfo[kRIT5]}
keys[del]=${terminfo[kdch1]}
keys[cdel]=${terminfo[kDC5]}
keys[cbackspace]="^H"


bindkey "${keys[left]}" backward-word
bindkey "${keys[right]}" forward-word

bindkey "${keys[del]}" delete-char
bindkey "${keys[cdel]}" delete-word

bindkey "${keys[cbackspace]}" backward-delete-word
