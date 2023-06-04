#!/bin/bash
cd /data/data/com.termux/files/home
mkdir -p /storage/emulated/0/Github/Repositories/
ln -s /storage/emulated/0/Github ./

cd Github

git clone --recurse-submodules git@github.com:rohanbatrain/Dot-Files.git /data/data/com.termux/files/home/Github/Repositories/Dot-Files/

cd ..
mkdir -p /storage/emulated/0/Obsidian/Second-Brain-Private/

mkdir Obsidian
ln -s /storage/emulated/0/Obsidian/Second-Brain-Private/ /data/data/com.termux/files/home/Obsidian/

git clone --recurse-submodules git@github.com:rohanbatrain/Second-Brain-Private.git /data/data/com.termux/files/home/Github/Repositories/Second-Brain-Private/
