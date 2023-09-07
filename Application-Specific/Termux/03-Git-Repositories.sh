#!/bin/bash

# storing Github repos in sdcard to let Android apps access it and then symlinking it to termux home for convenience.
cd /data/data/com.termux/files/home
mkdir -p /storage/emulated/0/Projects/Github/Repositories/
ln -s /storage/emulated/0/Projects ./
cd Projects/Public/
wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Application-Specific/Github/Repo-Clone.sh
bash Repo-Clone.sh
cd ~
