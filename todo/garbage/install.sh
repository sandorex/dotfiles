#!/bin/bash
# dotfiles installer

INSTALLED_DIR=".installed"
PACKAGE_DIRS="./other ./manual"

PACKAGES=""
GROUPS=""

# groups hold symlinks to packages

function usage {
   cat << EOF

usage: $0 [<command>] [<args>]

commands:
   check                         checks if all installed packages are intact
   install  [<package|group>]    installs packages, if no argument passed installed default group
   remove   [<package|group>]    removes packages, if no argument passed removes all installed packages
   list     [<group>]            lists packages, if group is passed list packages in that group
EOF
}

function find_packages {
   [ -z "$1" ] && { echo "not enough arguments"; exit 1; }

   find -L $1 -maxdepth 1 -type d 	         \
   -not -path . 								      \
   -not -path "./.*" 		                  \
   -not -path "$(basename $1)" 		         \
   $(                                        \
      for dir in $PACKAGE_DIRS; do           \
         echo "! -path ./$(basename $dir)";  \
      done;                                  \
   )                                         \
   -exec realpath --relative-to="$PWD" {} \;
}

function ask_yes_no {
   [ ! -z "$1" ] && printf "$1 [Y/n]: "

   read answer
   case $answer in
      [Yy])
         return 0
         ;;
      *)
         return 1
         ;;
   esac
}

function is_installed {
   [ -z "$1" ] && { echo "not enough arugments"; exit 1; }

   [[ -e "./$INSTALLED_DIR/$1" && -L "./$INSTALLED_DIR/$1" ]] && return 0 || return 1
}

function get_depth {
   echo "./$@" | grep -o / | wc -l
}

PACKAGES="$(find_packages .)"
for dir in $PACKAGE_DIRS; do
   PACKAGES="$PACKAGES $(find_packages $dir)"
done

CMD=$1
shift
case $CMD in
   check)
      ;;
   install)
      [ -z "$1" ] && { usage; exit 1; }

      [ -d "./$1" ] && {
         if is_installed "$1"; then
            echo "package '$1' is already installed"
            exit 1
         fi

         if echo "$PACKAGES" | grep -iq "$1"; then
            if ask_yes_no "do you want to install '$1' ?"; then
               echo 'installing'
            else
               echo "installation cancelled"
               exit 1
            fi
         else
            echo "invalid package '$1'"
         fi
      } || {
         echo "invalid path '$1'"
         exit 1
      }
      ;;
   remove)
      ;;
   list)
      echo "packages:"
      for pkg in $PACKAGES; do
         echo "   $pkg"
      done
      echo
      exit 0
      ;;
   *)
      usage
      exit 1
      ;;
esac
