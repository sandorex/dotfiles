#!/bin/bash
set -e

# error if xorg isn't running
if ! xhost >& /dev/null; then
   echo 'error xorg not found'
   exit 1
fi

# TODO run irexec-user if not running

# map caps to new modifier hyper
setxkbmap -option caps:hyper
xmodmap -e "remove mod4 = Hyper_L"
xmodmap -e "add mod3 = Hyper_L"

# disable bell
xset b off

# set key repeat speed
# for plasma check "Leave Unchanged" in Keybord > Keyboard Repeat
xset r rate 350 30
