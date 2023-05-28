#second
#!/bin/bash

echo "+++++++++++++++++++++++++++"
echo "+      Cr00k3d Arch       +"
echo "+++++++++++++++++++++++++++"
sleep 0.5
ping -c3 archlinux.org  >/dev/null 2>&1  || echo "Failed to Connect to Internet please Quit now "  
sleep 1
echo ""
read -rp "Enter HostName :" HOSTNAME
read -rp "Enter Username :" USERNAME
sleep 0.5
clear
sleep 0.5                                                     
pacman -Syy --noconfirm --needed grub efibootmgr os-prober || echo "Something went wrong"
echo "+++++++++++++++++++++++++++"
echo "+      Installing grub    +"
echo "+++++++++++++++++++++++++++"
sleep 0.5
mkdir /boot/efi
sleep 0.5
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB || echo "failed to install grub" && exit
sleep 0.5
grub-mkconfig -o /boot/grub/grub.cfg && echo "Grub install complete" || echo "failed to install grub " && exit
sleep 0.5
clear
echo "+++++++++++++++++++++++++++"
echo "+      Setting up         +"
echo "+++++++++++++++++++++++++++"
timedatectl status || echo "Something went wrong"
sleep 0.5
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
sleep 0.5
hwclock --systohc
sleep 0.5
locale-gen
sleep 0.5
touch /etc/locale.conf
sleep 0.5
echo "LANG=en_IN.UTF-8" >> /etc/locale.conf
sleep 0.5
echo "$HOSTNAME" /etc/hostname
sleep 0.5
echo "127.0.0.1       localhost" >> /etc/hosts
echo "::1             localhost" >> /etc/hosts
echo "127.0.1.1       $HOSTNAME.localdomain $HOSTNAME" >> /etc/hosts
sleep 0.5
clear 
echo "Enter password for Root"
passwd
sleep 0.5
clear
echo "Creating $USERNAME"
sleep 0.5
useradd -m "$USERNAME"
sleep 0.5
passwd "$USERNAME"
sleep 0.5
usermod -aG wheel,audio,storage,video "$USERNAME" 
clear
echo "Adding $USERNAME To sudoers"
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
sleep 0.5
clear
echo "+++++++++++++++++++++++++++"
echo "+    INSTALLING PKGS      +"
echo "+++++++++++++++++++++++++++"
sudo su "$USERNAME"
cd /home/"$USERNAME" || exit
sleep 0.5
ls -al
sleep 0.2
sudo pacman -Syyu
sudo pacman -S --noconfirm --needed xf86-video-fbde
sudo pacman -S --noconfirm --needed xf86-video-qxl
sudo pacman -S --noconfirm --needed xf86-video-amdgpu  
sudo pacman -S --noconfirm --needed xorg-fonts-misc
sudo pacman -S --noconfirm --needed xclip
sudo pacman -S --noconfirm --needed libxcb
sudo pacman -S --noconfirm --needed xcb-util-keysums
sudo pacman -S --noconfirm --needed xcb-util-cursor
sudo pacman -S --noconfirm --needed wayland
sudo pacman -S --noconfirm --needed wayland-protocols
sudo pacman -S --noconfirm --needed xorg-wayland
sudo pacman -S --noconfirm --needed egl-wayland
sudo pacman -S --noconfirm --needed wayland-utils
sudo pacman -S --noconfirm --needed wlroots
sudo pacman -S --noconfirm --needed waybar
sudo pacman -S --noconfirm --needed wofi
sudo pacman -S --noconfirm --needed nwg-look
sudo pacman -S --noconfirm --needed pango
sudo pacman -S --noconfirm --needed cairo
sudo pacman -S --noconfirm --needed wl-clipboard
sudo pacman -S --noconfirm --needed mako
sudo pacman -S --noconfirm --needed kanshi
sudo pacman -S --noconfirm --needed swappy
sudo pacman -S --noconfirm --needed swaybg
sudo pacman -S --noconfirm --needed swaylock
sudo pacman -S --noconfirm --needed dosfstools
sudo pacman -S --noconfirm --needed os-prober
sudo pacman -S --noconfirm --needed mtools
sudo pacman -S --noconfirm --needed gvfs
sudo pacman -S --noconfirm --needed gvfs-mtp
sudo pacman -S --noconfirm --needed gvfs-afc
sudo pacman -S --noconfirm --needed gvfs-gphoto2
sudo pacman -S --noconfirm --needed gvfs-nfs
sudo pacman -S --noconfirm --needed gvfs-smb
sudo pacman -S --noconfirm --needed dialog
sudo pacman -S --noconfirm --needed zenity
sudo pacman -S --noconfirm --needed bash-completion
sudo pacman -S --noconfirm --needed udftools
sudo pacman -S --noconfirm --needed exfat-utils
sudo pacman -S --noconfirm --needed uudeview
sudo pacman -S --noconfirm --needed ntfs-3g
sudo pacman -S --noconfirm --needed libmtp
sudo pacman -S --noconfirm --needed jq
sudo pacman -S --noconfirm --needed binutils
sudo pacman -S --noconfirm --needed usbutils
sudo pacman -S --noconfirm --needed udisks2
sudo pacman -S --noconfirm --needed unace 
sudo pacman -S --noconfirm --needed p7zip
sudo pacman -S --noconfirm --needed unrar
sudo pacman -S --noconfirm --needed zip
sudo pacman -S --noconfirm --needed unzip
sudo pacman -S --noconfirm --needed file-roller
sudo pacman -S --noconfirm --needed mlocate
sudo pacman -S --noconfirm --needed gpart
sudo pacman -S --noconfirm --needed sharutils
sudo pacman -S --noconfirm --needed uudeview
sudo pacman -S --noconfirm --needed pacman-contrib
sudo pacman -S --noconfirm --needed alsa-firmware
sudo pacman -S --noconfirm --needed alsa-lib
sudo pacman -S --noconfirm --needed alsa-plugins
sudo pacman -S --noconfirm --needed alsa-utils
sudo pacman -S --noconfirm --needed numlockx
sudo pacman -S --noconfirm --needed pulseaudio
sudo pacman -S --noconfirm --needed pulseaudio-alsa
sudo pacman -S --noconfirm --needed pavucontrol
sudo pacman -S --noconfirm --needed playerctl
sudo pacman -S --noconfirm --needed pamixer
sudo pacman -S --noconfirm --needed mpc
sudo pacman -S --noconfirm --needed mpd
sudo pacman -S --noconfirm --needed cmus
sudo pacman -S --noconfirm --needed xfce4-appfinder
sudo pacman -S --noconfirm --needed paprefs
sudo pacman -S --noconfirm --needed volumeicon
sudo pacman -S --noconfirm --needed terminus-font
sudo pacman -S --noconfirm --needed ttf-dejavu
sudo pacman -S --noconfirm --needed ttf-fira-code
sudo pacman -S --noconfirm --needed noto-fonts
sudo pacman -S --noconfirm --needed noto-fonts-emoji
sudo pacman -S --noconfirm --needed ttf-ubuntu-font-family
sudo pacman -S --noconfirm --needed ttf-droid
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed wget
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed atool
sudo pacman -S --noconfirm --needed highlight
sudo pacman -S --noconfirm --needed poppler
sudo pacman -S --noconfirm --needed tumbler
sudo pacman -S --noconfirm --needed ffmpegthumbnailer
sudo pacman -S --noconfirm --needed ffmpegthumbs
sudo pacman -S --noconfirm --needed neofetch
sudo pacman -S --noconfirm --needed thunar
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed stow
sudo pacman -S --noconfirm --needed thunar-archive-plugin
sudo pacman -S --noconfirm --needed thunar-media-tags-plugin
sudo pacman -S --noconfirm --needed thunar-shares-plugin
sudo pacman -S --noconfirm --needed thunar-volman
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed go
sudo pacman -S --noconfirm --needed xdg-user-dirs-gtk
sleep 0.5
ls -al
xdg-user-dirs-update
sleep 2
clear
sleep 0.5
echo -e "\nInstalling yay...\n"
sleep 1
git clone https://aur.archlinux.org/yay.git
sleep 0.5
cd yay || echo "failed to open directory Yay. directory not found" && exit
sleep 0.5
makepkg -si || echo "sometihing went wrong failed to install yay" && exit
sleep 0.5
yay -S wayfire wf-shell wf-config wcm wf-recorder-git wlogout wdisplays  nwg-look wayfire-plugins-extra spotify python-pyclip python-pywal
clear || echo 
sleep 0.5
clear

systemctl enable Networkmanager.service
sleep 0.5
systemctl disable greetd
sleep 0.5
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-"
echo "+ Installing ly disp.manger  +"
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-"
git clone --recurse-submodules https://github.com/fairyglade/ly
sleep 0.3
cd ly && make && sudo make install installsystemd && sudo systemctl enable ly.service && systemctl disable getty@tty2.service
clear
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-"
echo "+     Installation completed +"
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-"
read -rp "Do you want to re boot [y/n]? :" ans
  [[ "$ans" == [Yy]* ]] && reboot  || echo "Exiting.." &&  exit
  
