#!/bin/bash

# Going to home of rohan

cd /home/rohan

# Making a build directory

mkdir Builds

cd Builds

# Fetching my github repos

git clone https://github.com/rohanbatrain/suckless-dmenu.git

git clone https://github.com/rohanbatrain/suckless-st.git

git clone https://github.com/rohanbatrain/suckless-dwm.git

# Building them at once

for i in * ; do cd $i ; sudo make install ; cd .. ; done

cd ..

# Fetching proxmox dot files

rm .xinitrc

wget https://raw.githubusercontent.com/rohanbatrain/dot-files/main/proxmox/.xinitrc

# Configuring appimages

mkdir -p Applications

cd Applications

## Obsidian

if ! [ -f /home/rohan/Applications/Obsidian-1.1.16.AppImage ]; then

           wget -P /home/rohan/Applications/ "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.1.16/Obsidian-1.1.16.AppImage"

fi

## Appimagelauncher

if ! [ -f /home/rohan/Applications/appimagelauncher-lite-2.2.0.AppImage ]; then

           wget -P /home/rohan/Applications/ "https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-lite-2.2.0-travis995-0f91801-x86_64.AppImage" -O /home/rohan/Applications/appimagelauncher-lite-2.2.0.AppImage

fi

chmod +x *.AppImage
