#!/bin/bash 

cd home/rohan/Projects/Public/
wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Application-Specific/Github/Repo-Clone.sh
bash Repo-Clone.sh

# Building from sources 
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
cd /home/rohan/

# Fetching proxmox dot files
rm .xinitrc
wget https://raw.githubusercontent.com/rohanbatrain/dotfiles/main/proxmox/.xinitrc


# Appimages 

## Fetching app images
cd ~ 
mkdir Applications
cd Applications

### Obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.7/Obsidian-1.3.7.AppImage

## Making all executable at once
chmod +x *.AppImage
