#!/bin/bash

# Change directory to home directory
cd /home/rohan/Projects/Public/ || exit 1

# Downloading Repo-Clone.sh script
wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Application-Specific/Github/Repo-Clone.sh -O Repo-Clone.sh
if [ $? -ne 0 ]; then
    echo "Failed to download Repo-Clone.sh script."
    exit 1
fi

# Executing Repo-Clone.sh script
bash Repo-Clone.sh
if [ $? -ne 0 ]; then
    echo "Failed to execute Repo-Clone.sh script."
    exit 1
fi

# Building from sources
## DWM
cd suckless-dwm/V6.4/ || exit 1
sudo make clean install
if [ $? -ne 0 ]; then
    echo "Failed to build DWM."
    exit 1
fi
cd ../../

## DMENU
cd suckless-dmenu/V5.2/ || exit 1
sudo make clean install
if [ $? -ne 0 ]; then
    echo "Failed to build Dmenu."
    exit 1
fi
cd ../../

## ST
cd suckless-st/V0.9/ || exit 1
sudo make clean install
if [ $? -ne 0 ]; then
    echo "Failed to build ST."
    exit 1
fi
cd ../../

# Getting out of build directory
cd /home/rohan/ || exit 1

# Fetching proxmox dot files
rm .xinitrc
wget https://raw.githubusercontent.com/rohanbatrain/dotfiles/main/proxmox/.xinitrc
if [ $? -ne 0 ]; then
    echo "Failed to fetch .xinitrc file."
    exit 1
fi

# Appimages
## Creating Applications directory
cd ~ || exit 1
mkdir -p Applications
cd Applications || exit 1

### Obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.7/Obsidian-1.3.7.AppImage
if [ $? -ne 0 ]; then
    echo "Failed to download Obsidian AppImage."
    exit 1
fi

## Making all AppImages executable
chmod +x *.AppImage
if [ $? -ne 0 ]; then
    echo "Failed to make AppImages executable."
    exit 1
fi
