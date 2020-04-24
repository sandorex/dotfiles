#!/bin/sh
#
# remove all of the following files:
#   ~/.bash_profile
#   ~/.bash_login
#   ~/.zprofile
#   ~/.zlogin
#   ~/.profile
#
# source this file from ~/.bashrc and ~/.zshrc

# enable full color support if not set
[ -z "$TERM" ] && export TERM=xterm-256color

# PATH #
append() {
   # skip if it does not exist
   [ -d "$1" ] || return

   case ":$PATH:" in
      *":$1:"*) :;;        # already exists, do nothing
      *) PATH="$PATH:$1";; # append the path
   esac
}

prepend() {
   # skip if it does not exist
   [ -d "$1" ] || return

   case ":$PATH:" in
      *":$1:"*) :;;        # already exists, do nothing
      *) PATH="$1:$PATH";; # prepend the path
   esac
}

# brew
[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# rust
append "$HOME"/.cargo/bin

# pip
append "$HOME"/.local/bin

# golang
export GOPATH="$HOME"/.go
append "$GOPATH"/bin

# bin
prepend "$HOME"/.bin

# clean up
unset append
unset prepend

