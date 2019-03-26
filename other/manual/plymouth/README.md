install `plymouth-theme-arch-charge-white` from [github](https://github.com/sandorex/plymouth-theme-arch-charge-white)
```bash
git clone https://github.com/sandorex/plymouth-theme-arch-charge-white.git -b PKGBUILD
cd plymouth-theme-arch-charge-white
makepkg -si
```

run
```bash
sudo plymouth-set-default-theme -R arch-charge-white
```

enable `-plymouth` version of display manager (ex `sddm-plymouth`)
add plymouth to hooks after `base udev`
```
HOOKS=(base udev plymouth ...)
```
