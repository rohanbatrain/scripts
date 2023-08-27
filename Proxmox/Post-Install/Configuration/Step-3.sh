#!/bin/bash

# Going to home of rohan
cd /home/rohan/

# Making a build directory
mkdir Builds
cd Builds

# Fetching my github repos
git clone git@github.com:rohanbatrain/suckless-dmenu.git
git clone git@github.com:rohanbatrain/suckless-st.git
git clone git@github.com:rohanbatrain/suckless-dwm.git

# Building them 

## DWM
cd suckless-dwm/V6.4/
sudo make clean install
cd ../../

## DMENU
cd suckless-dmenu/V5.2/
sudo make clean install
cd ../../

## ST
cd suckless-st/V0.9/
sudo make clean install
cd ../../


# Getting out of build directory
cd ..

# Fetching proxmox dot files
rm .xinitrc
wget https://raw.githubusercontent.com/rohanbatrain/dotfiles/main/Proxmox/.xinitrc

# Over to the next step
wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Proxmox/Post-Install/Configuration/Step-3.sh
chmod +x Step-3.sh
rm /home/rohan/Step-2.sh
bash Step-3.sh
