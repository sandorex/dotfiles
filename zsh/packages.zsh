#!/usr/bin/env zsh

# download zgen if not already present
[ -f "$HOME"/.zgen/zgen.zsh ] || git clone https://github.com/tarjoilija/zgen.git "$HOME"/.zgen

# load zgen
source "$HOME"/.zgen/zgen.zsh

# get plugins and stuff
if ! zgen saved; then
   zgen oh-my-zsh plugins/sudo

   zgen load zsh-users/zsh-autosuggestions

   # syntax highlighting must be loaded last!!
   zgen load zsh-users/zsh-syntax-highlighting

   zgen save
fi
