#!/bin/bash

# Fetching aptitude packages
apt install make gcc libx11-dev libxft-dev libxinerama-dev xorg

# Making a build directory
mkdir /root/Builds
cd /root/Builds

# Getting archives
wget https://dl.suckless.org/dwm/dwm-6.4.tar.gz 
wget https://dl.suckless.org/tools/dmenu-5.2.tar.gz
wget https://dl.suckless.org/st/st-0.9.tar.gz

# extracting them
tar -xf dwm-*.tar.gz 
tar -xf dmenu-*.tar.gz
tar -xf st-*.tar.gz

# Building them at once
for i in * ; do cd $i ; make clean install ; cd .. ; done

# Going back to home of root
cd /root

# Fetching proxmox dot files
rm .xinitrc
wget https://raw.githubusercontent.com/rohanbatrain/dot-files/main/proxmox/.xinitrc

# Configuring appimages
mkdir Applications
cd Applications
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.1.16/Obsidian-1.1.16.AppImage
