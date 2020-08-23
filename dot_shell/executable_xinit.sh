#!/bin/sh
# TODO run irexec-user if not running

# set caps to hyper key
setxkbmap -option caps:hyper

# run xmodmap if accessible
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap

# disable bell
xset b off

# set key repeat speed
# for plasma check "Leave Unchanged" in Keybord > Keyboard Repeat
xset r rate 350 30

# disable mouse acceleration
xset m 1
