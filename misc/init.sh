#!/bin/sh

# map caps to new modifier hyper
setxkbmap -option caps:hyper
xmodmap -e "remove mod4 = Hyper_L"
xmodmap -e "add mod3 = Hyper_L"

# key repeat speed
xset r rate 350 30
