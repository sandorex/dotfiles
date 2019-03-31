install (arch):
```bash
sudo pacman -S xautomation lirc pulseaudio-lirc
```

disable keyboard
```bash
sudo cp 10-mce-keyboard-disable.conf /etc/X11/xorg.conf.d/
```

getting ir codes
(optional) download it
```bash
irdb-get download mceusb/mceusb.lircd.conf
```

copy it to `/etc/lircd.conf.d/`
```bash
sudo cp mceusb.lircd.conf /etc/lirc/lircd.conf.d/
```

change driver to default in /etc/lirc_options.conf:
```
   ...
   driver = default
   ...
```

copy irexec config
```bash
cp irexec ~/.config/lircrc
```

copy irexec user service
```bash
cp irexec-user.service ~/.config/systemd/user/
```

enable services
```bash
sudo systemctl enable lircd.service
systemctl --user enable irexec-user.service
```
