#!/bin/bash

# Remove enterprise (paid) repositories
sed -i 's/deb/#deb/g' /etc/apt/sources.list.d/pve-enterprise.list
sed -i 's/deb/#deb/g' /etc/apt/sources.list.d/ceph.list


# Enable no-subscription package repository
prel=$(cat /etc/apt/sources.list | grep "main contrib" | head -1 | awk '{print $3}')
echo "deb http://download.proxmox.com/debian/pve $prel pve-no-subscription" >> /etc/apt/sources.list.d/pve-no-sub.list
echo "deb http://download.proxmox.com/debian/ceph-quincy $prel no-subscription" >> /etc/apt/sources.list.d/ceph-no-sub.list


# Updating the repos

apt update && apt upgrade

# Fetching aptitude packages

apt install iwd sudo git make vim gcc libx11-dev libxft-dev libxinerama-dev xorg firefox-esr pulseaudio pavucontrol curl obs-studio

## Brave special config
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser


# trying audio

systemctl enable pulseaudio.service
systemctl enable iwd 

# Making a new user

adduser rohan

usermod -aG sudo rohan

cd /home/rohan/

wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/OS-Specific/Proxmox/bare-metal/Post-Installation/Configuration/Step-1.2.sh

chmod +x Step-1.2.sh

su rohan -c "bash /home/rohan/Step-1.2.sh"
