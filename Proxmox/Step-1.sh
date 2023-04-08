#!/bin/bash

# Updating the repos
apt update

# Fetching aptitude packages
apt install sudo make gcc libx11-dev libxft-dev libxinerama-dev xorg firefox-esr pulseaudio pavucontrol

# trying audio
systemctl --user enable pulseaudio.service

# Making a new user
adduser rohan
usermod -aG sudo rohan
cd /home/rohan
wget https://raw.githubusercontent.com/rohanbatrain/post-install-scripts/main/Proxmox/Step-2.sh
chmod +x Part-2.sh
su rohan -c bash Part-2.sh
