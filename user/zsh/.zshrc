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

setopt no_beep
setopt no_clobber
setopt no_match
setopt auto_cd
setopt interactive_comments

# better globs
setopt extendedglob
unsetopt caseglob

# nicer tab completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

compinit
_comp_options+=(globdots)

# set window title
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n in %~\a"}
        ;;
esac

# add additional files
source ~/.bin/paths/shell
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/keybindings.zsh

# ensure exit status is zero
:
