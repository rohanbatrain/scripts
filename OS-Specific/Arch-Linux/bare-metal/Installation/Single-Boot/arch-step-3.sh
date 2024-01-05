#!/bin/bash

# This script should be ran by a non root user.

mkdir /mnt/rohan/git-repos # All dot files should linked using symlinks from this directory.

# fetching GitHub repos

cd /mnt/rohan/git-repos

wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Application-Specific/Github/Repo-Clone.sh
bash Repo-Clone.sh

# compiling

for i in suckless-* ; do cd $i ; sudo make clean install ; cd .. ; done 

# links

ln -sf /mnt/rohan/git-repos/dot-files/arch/.xinitrc /home/rohan/.xinitrc
