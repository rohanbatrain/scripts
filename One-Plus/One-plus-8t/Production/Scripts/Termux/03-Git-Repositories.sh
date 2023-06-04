#!/bin/bash

# storing Github repos in sdcard to let Android apps access it and then symlinking it to termux home for convenience.
cd /data/data/com.termux/files/home
mkdir -p /storage/emulated/0/Github/Repositories/
ln -s /storage/emulated/0/Github ./

cd Github

git clone --recurse-submodules git@github.com:rohanbatrain/Dot-Files.git /data/data/com.termux/files/home/Github/Repositories/Dot-Files/

cd ..
mkdir -p /storage/emulated/0/Obsidian/Second-Brain-Private/

mkdir Obsidian


git clone --recurse-submodules git@github.com:rohanbatrain/Second-Brain-Private.git /storage/emulated/0/Obsidian/Second-Brain-Private/

ln -s /storage/emulated/0/Obsidian/Second-Brain-Private/ /data/data/com.termux/files/home/Obsidian/



cd Github/Repositories/
git clone git@github.com:rohanbatrain/Second-Brain-Tools-2022.git
cd ~