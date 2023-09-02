#!/bin/bash

# Updating the repos

apt update && apt upgrade

# Fetching aptitude packages

apt install iwd sudo git make vim gcc libx11-dev libxft-dev libxinerama-dev xorg firefox-esr pulseaudio pavucontrol curl

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

wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/OS-Specific/Proxmox/Post-Installation/Configuration/Step-2.sh

chmod +x Step-2.sh

su rohan -c "bash /home/rohan/Step-2.sh"
