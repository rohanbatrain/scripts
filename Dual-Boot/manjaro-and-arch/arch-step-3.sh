#!/bin/bash

# This script should be ran by a non root user.

mkdir /mnt/rohan/git-repos # All dot files should linked using symlinks from this directory.

# fetching GitHub repos
cd /mnt/rohan/git-repos
git clone https://github.com/rohanbatrain/dot-files.git
git clone https://github.com/rohanbatrain/suckless-dwm.git
git clone https://github.com/rohanbatrain/suckless-dmenu.git
git clone https://github.com/rohanbatrain/suckless-st.git

# compiling

for i in suckless-* ; do cd $i ; sudo make clean install ; cd .. ; done 

# links

ln -sf /mnt/rohan/git-repos/dot-files/arch/.xinitrc /home/rohan/.xinitrc
