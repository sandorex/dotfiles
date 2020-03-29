#!/bin/sh

# brew
[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# rust
PATH=$PATH:"$HOME/.cargo/bin"

# pip
PATH=$PATH:"$HOME/.local/bin"

# gem
PATH=$PATH:"$HOME/.gem/ruby/*/bin"
