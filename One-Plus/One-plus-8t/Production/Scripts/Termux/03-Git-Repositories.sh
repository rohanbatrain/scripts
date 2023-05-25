#!/bin/bash
cd /data/data/com.termux/files/home
mkdir -p Github/Repositories

git clone --recurse-submodules git@github.com:rohanbatrain/Dot-Files.git /data/data/com.termux/files/home/Github/Repositories/Dot-Files/

mkdir -p /sdcard/Obsidian/Second-Brain-Private/

ln -s /sdcard/Obsidian/Second-Brain-Private/ /data/data/com.termux/files/home/Github/Repositories/.

git clone --recurse-submodules git@github.com:rohanbatrain/Second-Brain-Private.git /data/data/com.termux/files/home/Github/Repositories/Second-Brain-Private/
