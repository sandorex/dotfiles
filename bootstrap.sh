#!/usr/bin/env bash
# todo check if in repository dont do anything cause it will cause a recursion
echo 'this script is jusst a skeleton'
exit 1

REPO="https://gitlab.com/sandorex/config"
#DEST=~/.dotfiles
DEST="~/test/dotfiles"

git clone "$REPO"
