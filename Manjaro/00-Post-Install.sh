#!/bin/bash

## Setting up git 

### Prerequisitie :- Please copy your ssh keys to .ssh directory.

cd ~/.ssh/
chmod 400 id_rsa
git config --global user.name "Rohan Batra"
git config --global user.email "116573125+rohanbatrain@users.noreply.github.com"
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global user.signingkey ~/.ssh/id_rsa.pub
ssh -T git@github.com

## Packages 
sudo pacman -Syyu base-devel

### AUR
cd ~/Builds
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
