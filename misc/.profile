PATHS=(.bin .local/bin Dropbox/bin)

# add homebrew
PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin

# include paths
for path in "${PATHS[@]}"; do
   if [ -d "$HOME/$path" ]; then
      PATH=$PATH:$HOME/$path
   fi
done

unset PATHS

#eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
