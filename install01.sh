#!/bin/bash
#I hate commenting 
sleep 0.5
clear
sleep 0.2
ping -c3 archlinux.org  >/dev/null 2>&1  || echo "Failed to Connect to Internet "
lsblk
echo "! Do not proceed without creating disk partition"
sleep 0.5
read -rp "Enter boot partition [eg /dev/sda1 ] :" BOOTPART
sleep 0.5
read -rp "Enter root partition  :" ROOTPART
sleep 0.5
read -rp "Enter home partition  :" HOMEPART
sleep 0.5
read -rp "Enter swap partition  :" SWAPPART
sleep 0.5
clear
echo "Formatting Drives"
mkfs.fat -F32 "$BOOTPART"
sleep 0.5
mkfs.ext4 "$ROOTPART"
sleep 0.5
mkfs.ext4 "$HOMEPART"
sleep 0.5
mkswap "$SWAPPART"
sleep 0.5
mount "$ROOTPART" /mnt
sleep 0.5
swapon "SWAPPART"
sleep 0.5
echo "Installing Keyring"
pacman -Syy --noconfirm --needed archlinix-keyring
clear
sleep 0.5
pacstrap -K /mnt base base-devel linux-firmware linux-zen networkmanager  
echo "Installation completed" 
sleep 0.5
clear
sleep 0.5
echo "generating fstab"
sleep 0.5
cd 
genfstab -U /mnt >> /mnt/etc/fstab
sleep 0.5
mkdir /mnt/cai
touch /mnt/cai/install02.sh
pacman -S --noconfirm --needed curl
curl -o /mnt/cai/install02.sh https://raw.githubusercontent.com/th3cr00k3dm4n/cai/main/install02.sh
clear
echo "Installation part 1 completed"
echo "run install02.sh in cai folder"
sleep 0.5
arch-chroot /mnt
exit

