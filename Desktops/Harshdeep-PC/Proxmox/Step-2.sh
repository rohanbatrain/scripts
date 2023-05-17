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
