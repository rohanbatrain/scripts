#!/bin/bash

# storing Github repos in sdcard to let Android apps access it and then symlinking it to termux home for convenience.
cd /data/data/com.termux/files/home
mkdir -p /storage/emulated/0/Git-Repositories/Github/Repositories/
ln -s /storage/emulated/0/Git-Repositories ./
cd Git-Repositories/Github/Repositories

# cloning repositories
git clone --recurse-submodules git@github.com:rohanbatrain/Dot-Files.git 
git clone --recurse-submodules git@github.com:rohanbatrain/Second-Brain-Private.git 
git clone git@github.com:rohanbatrain/Second-Brain-Tools-2022.git

cd ~
