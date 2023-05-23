#!/bin/bash
# Setting up python server on host machine to clone ssh keys on folder

read -p "Do you have your termux storage already setup? Y/N: " STORAGE_SETUP_CONFIRMATION

if [ "$STORAGE_SETUP_CONFIRMATION" == "Y" ]; then
    echo "Skipping termux storage command, system already configured!"
else
    termux-setup-storage
fi

echo "Please copy the SSH keys to your '/sdcard/Secrets' Directory"

mkdir ~/.ssh
cp /sdcard/Secrets/* ~/.ssh/
apt update && apt upgrade
sshd
