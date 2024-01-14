#!/bin/bash
sudo pacman -S obsidian obs-studio vscodium

cd /tmp
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/535.146.02/NVIDIA-Linux-x86_64-535.146.02.run

sudo bash NVIDIA*.run
