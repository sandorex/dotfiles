#!/bin/sh
#
# remove all of the following files:
#   ~/.bash_profile
#   ~/.bash_login
#   ~/.zprofile
#   ~/.zlogin
#   ~/.profile
#
# link this file as ~/.shell and source it from ~/.bashrc and ~/.zshrc

export DOTFILES="$HOME"/dotfiles

# enable full color support if not set
[ -z "$TERM" ] && export TERM=xterm-256color

# PATH #
add() {
   # skip if it does not exist
   [ -d "$1" ] || return

   case ":$PATH:" in
      *":$1:"*) :;;        # already exists, do nothing
      *) PATH="$PATH:$1";; # append the path
   esac
}

# brew
[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# rust
add "$HOME"/.cargo/bin
# pip
add "$HOME"/.local/bin

# clean up
unset add
