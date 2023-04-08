#!/bin/bash

# Fetching aptitude packages
apt install make gcc libx11-dev libxft-dev libxinerama-dev xorg

# Making a build directory
mkdir /root/Builds
cd /root/Builds

# Getting archives
wget https://dl.suckless.org/dwm/dwm-6.4.tar.gz 
wget https://dl.suckless.org/tools/dmenu-5.2.tar.gz

# extracting them
tar -xf dwm-*.tar.gz 
tar -xf dmenu-*.tar.gz

# Building them at once
for i in d* ; do cd $i ; make clean install ; cd .. ; done

# Going back to home of root
cd /root

# Fetching proxmox dot files
