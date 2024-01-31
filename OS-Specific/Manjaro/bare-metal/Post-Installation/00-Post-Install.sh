#!/bin/bash

## Setting up git 

### Prerequisitie :- Please copy your ssh keys to .ssh directory.

wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Application-Specific/Git/initial-setup.sh
bash initial-setup.sh

## Repo sync
sudo pacman-mirrors --country India,Singapore  && sudo pacman -Syu

## Packages 
sudo pacman -Syyu base-devel glibc lib32-glibc rustup 
rustup default stable

### AUR
cd ~/Builds
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
### Please choose rustup, rust (default=1) is broken as of now, at time of writing. 


### Paru packages
paru anki vscodium

## System Settings
export VISUAL=vim 
git config --global core.editor nano
