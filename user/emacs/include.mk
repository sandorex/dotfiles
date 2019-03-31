# this is a fix to ensure that the directory
# isn't symlinked only the files inside to ensure
# no garbage is added to the dotfiles

STOW_FLAGS_emacs := --no-folding

