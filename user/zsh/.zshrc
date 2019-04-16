#!/usr/bin/env zsh

# download zgen if not already present
[ -f "$HOME/.zgen/zgen.zsh" ] || git clone https://github.com/tarjoilija/zgen.git "$HOME/.zgen"

# load zgen
source "$HOME/.zgen/zgen.zsh"

# get plugins and stuff
if ! zgen saved; then
   zgen oh-my-zsh plugins/sudo

   zgen load denysdovhan/spaceship-prompt spaceship
   
   zgen load zsh-users/zsh-autosuggestions

   # syntax highlighting must be loaded last!!
   zgen load zsh-users/zsh-syntax-highlighting
   
   zgen save
fi

# plugin configuration
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_GIT_BRANCH_SUFFIX=" "
SPACESHIP_EXEC_TIME_ELAPSED=5

SPACESHIP_PROMPT_ORDER=(
   dir
   git_branch
   exec_time
   line_sep
   host
   char
)

SPACESHIP_RPROMPT_ORDER=(jobs)

# zsh options
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt sharehistory extendedhistory append_history hist_ignore_dups hist_ignore_space

# no beeps
setopt no_beep

# dont overwrite stuff with redirection
setopt no_clobber

# error when glob doesnt match anything
setopt no_match

# cd into a directory by typing the path
setopt auto_cd

# save comments in history
setopt interactive_comments

# report when background job finishes
setopt notify

# dont kill jobs when shell exits
setopt no_hup

# long format for jobs
setopt long_list_jobs

# dont match dotfiles
setopt no_globdots

# better globs
setopt extendedglob
setopt no_caseglob

# nicer tab completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# generate compinit only once a day
autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

_comp_options+=(globdots)

# set window title
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n in %~\a"}
        ;;
esac

# add additional files
source ~/.dotfiles/sh/all
source ~/.dotfiles/zsh/aliases
source ~/.dotfiles/zsh/functions
source ~/.dotfiles/zsh/keybindings

# remove duplicate paths
typeset -U PATH
export PATH
