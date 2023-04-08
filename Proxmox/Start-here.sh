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
#git clone here
chmod +x Part-2.sh
cp Part-2.sh /home/rohan
su rohan
