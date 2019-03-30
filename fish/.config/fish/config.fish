# install fisher if not installed
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# greeting
function fish_greeting
   if not test -d $HOME/.dotfiles
      echo dotfiles not found at $HOME/.dotfiles
   end
   
   if not git -C $HOME/.dotfiles diff-index --no-ext-diff --quiet HEAD --
      echo dotfiles directory has been modified
   end
end

# do not display ruby/python version
set -g theme_display_ruby no
set -g theme_display_virtualenv no

source $XDG_CONFIG_HOME/fish/aliases.fish
source $XDG_CONFIG_HOME/fish/abbrev.fish
