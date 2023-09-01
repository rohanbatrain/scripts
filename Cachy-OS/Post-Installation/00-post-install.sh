#!/bin/bash

# Prerequisities : copy your ssh keys on ~/.ssh/
cd ~
mkdir "Github" "Builds" "Applications"
sudo pacman -Syyu firefox python-pip yay veracrypt
yay vscodium-bin
cd ~/.ssh/
chmod 700 ~/.ssh/
chmod 600 ~/.ssh/id_rsa
git config --global user.name "Rohan Batra"
git config --global user.email "116573125+rohanbatrain@users.noreply.github.com"
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global user.signingkey ~/.ssh/id_rsa.pub
ssh -T git@github.com
