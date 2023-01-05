#!/bin/bash
#I hate commenting 
sleep 0.5
clear
sleep 0.2
ping -c3 archlinux.org  >/dev/null 2>&1  || echo "Failed to Connect to Internet "
echo "! Do not proceed without creating disk partition"
clear
banner
lsblk 
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
banner
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
cd 
genfstab -U /mnt >> /mnt/etc/fstab
sleep 0.5

exit
