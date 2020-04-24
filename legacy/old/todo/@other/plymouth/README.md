### plymouth
- add 'plymouth' to HOOKS in `/etc/mkinitcpio.conf`
- set the theme `plymouth-set-default-theme -R spinner`
- enable service `sudo systemctl enable DM-plymouth` where `DM` is your display manager (ex. `sudo systemctl enable sddm-plymouth`)
