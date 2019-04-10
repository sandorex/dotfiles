#!/usr/bin/env zsh

# download zgen if not already present
[ -f "$HOME/.zgen/zgen.zsh" ] || git clone https://github.com/tarjoilija/zgen.git "$HOME/.zgen"

# load zgen
source "$HOME/.zgen/zgen.zsh"

# get plugins and stuff
if ! zgen saved; then
#   zgen oh-my-zsh # provides bs aliases which i really dont want

   zgen oh-my-zsh plugins/sudo

   #zgen load bhilburn/powerlevel9k powerlevel9k
   zgen load denysdovhan/spaceship-prompt spaceship
   
   zgen load zsh-users/zsh-autosuggestions

   # syntax highlighting must be loaded last!!
   zgen load zsh-users/zsh-syntax-highlighting
   
   zgen save
fi

# plugin configuration
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs)
POWERLEVEL9K_STATUS_OK=false

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

SPACESHIP_RPROMPT_ORDER=(
   jobs
)

# zsh options
setopt no_beep

setopt append_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt no_clobber

setopt no_match
setopt auto_cd

# nicer tab completion
zstyle ':completion:*' menu select

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

# add local config if it exists
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# ensure exit status is zero
:
