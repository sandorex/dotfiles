#!/usr/bin/env zsh

function system_report {
   if systemctl --failed > /dev/null; then
      echo 'there are failed system services'
      systemctl --failed

      sudo journalctl -p 3 -xb
   fi
}

#function list {
#   case $1 in
#      *.zip)
#         unzip -l "$1"
#         ;;
#      *.rar)
#         unrar l "$1"
#         ;;
#      *.tar.*)
#         echo 'unsupported'
#         ;;
#      *.tar)
#         tar tf $1
#         ;;
#      *)
#         echo 'unsupported archive \'$1\''
#   esac
#}
