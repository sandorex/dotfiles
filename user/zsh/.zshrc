#!/usr/bin/env zsh

# download zgen if not already present
[ -f "${HOME}/.zgen/zgen.zsh" ] || git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# load it
source "${HOME}/.zgen/zgen.zsh"

# get plugins and stuff
if ! zgen saved; then
   zgen oh-my-zsh

   zgen oh-my-zsh plugins/sudo

   zgen oh-my-zsh plugins/command-not-found

   zgen load bhilburn/powerlevel9k powerlevel9k
   
   zgen load zsh-users/zsh-autosuggestions

   # this must be loaded last!!
   zgen load zsh-users/zsh-syntax-highlighting
   
   zgen save
fi

# zsh configuration
HIST_IGNORE_DUPS=true
HIST_IGNORE_SPACE=true

# configuration
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_STATUS_OK=false
