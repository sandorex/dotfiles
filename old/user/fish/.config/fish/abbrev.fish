# abbreviations
if not set -q abbrev_init
   set -U abbrev_init

   # editors
   abbr e 'nvim'
   abbr vim 'nvim'
   abbr c 'code .'

   # git
   abbr g 'git'
   abbr gc 'git commit'
   abbr gi 'git init'
   abbr gs 'git status'
   abbr gp 'git push'

   # system
   abbr jctl 'sudo journalctl'
   abbr jctlf 'sudo journalctl -p 3 -xb'
   
   abbr ctl 'sudo systemctl'
   abbr ctls 'sytemctl status'
   abbr ctlf 'systemctl --failed'

   abbr uctl 'systemctl --user'
   abbr uctls 'systemctl --user status'
   abbr uctlf 'systemctl --user --failed'

   abbr pai 'sudo pacman -S'
   abbr pas 'sudo pacman -Ss'
   abbr pau 'pikur -Syu'
   abbr pii 'pikaur -S'
   abbr pis 'pikaur -Ss'

   #
   abbr usage 'glances'
   abbr io 'sudo iotop'

   # misc
   # abbr cat 'bat --style=plain'
   abbr mkdir 'mkdir -p'
   abbr rm 'rm -I'

   #
   abbr zti 'sudo zerotier-cli info'
   abbr ztl 'sudo zerotier-cli listpeers'
   abbr ztstart 'sudo systemctl start zerotier-one'
   abbr ztstop 'sudo systemctl stop zerotier-one'
end
