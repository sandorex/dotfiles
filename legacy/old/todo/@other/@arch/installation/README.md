uefi == efi

0) check is it efi or not
  ls /sys/firmware/efi/efivars

  if it outputs anything you're running in efi mode

1) Setting up the internet
  `# ping google.com`

  if it works just skip this part

  TODO add more fixes

  this should only be neccessary with static ip address
  add this to /etc/dhcpcd.conf
  ```
  interface <INTERFACE>
  static ip_address=<STATIC_IP>/24
  static routers=<ROUTER_IP>
  static domain_name_servers=<DNS_SERVER_IP>
  ```
  note that ROUTER_IP can be the DNS_SERVER_IP as well
  note to get the INTERFACE run `ip a`

*) System clock
  `# timedatectl set-ntp true`

2) Partitioning
  you can partition however you want just remember what is what

  root must be at least 8 GiB
  ext4 is recommended

  (efi only)
  efi/esp partition is type vfat
  recommended 256 - 512 MiB

3) Formatting
  format partition that need formatting

  `# mkfs.<FILE_SYSTEM>`

  where FILE_SYSTEM is ext4, btrfs, vfat, ...

  if you created swap turn it on
  ```
  mkswap /dev/sdX
  mkswap /dev/sdX
  ```

4) Mounting
  mount partitions

  root at /mnt
  `# mount /dev/sdX /mnt`

  (efi only)
  ```
  # mkdir /mnt/boot
  # mount /dev/sdX /mnt/boot
  ```

5) Install
  run
  `# pacstrap /mnt base <PACKAGES...>`
  where PACKAGES... is any package you want and packages in arch-packages.txt

  note that this might take a long time

*) Generate fstab
  `# genfstab -U /mnt >> /mnt/etc/fstab`

6) Chroot
  arch-chroot /mnt

7) Select timezone
  ```
  # ln -sf /usr/share/zoneinfo/<REGION>/<CITY> /etc/localtime
  # hwclock --systohc
  ```

8) Locale
  uncomment 'en_US.UTF-8' in /etc/locale.gen

  `# locale-gen`

  add this to /etc/locale.conf
  `LANG=en_US.UTF-8`

9) Network
  write hostname in /etc/hostname

  write this to /etc/hosts
  ```
  127.0.0.1   localhost
  ::1         localhost
  127.0.1.1   <HOSTNAME>.localdomain  <HOSTNAME>
  ```

10) Initramfs
  `# mkinitcpio -p linux`

11) Password
  `# passwd` and enter your password

12) GRUB
  ```
  TODO mount llvm thingy
  # grub install --target=x86_64-efi --efi-directory=/mnt/boot --bootloader-id="<ID>"
  ```
  where ID is name in efi

  `# grub-mkconfig -o /boot/grub/grub.cfg`
