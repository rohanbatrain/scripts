#!/bin/bash
# Setting up python server on host machine to clone ssh keys on folder

read -p "Do you have your termux storage already setup? Y/N: " STORAGE_SETUP_CONFIRMATION

if [ "$STORAGE_SETUP_CONFIRMATION" == "Y" ]; then
    echo "Skipping termux storage command, system already configured!"
else
    termux-setup-storage
fi

echo "Please copy the id_rsa and id_rsa.pub keys to your '/sdcard/Secrets' Directory, by connecting to your android ftp server"

pkg install openssh
mkdir ~/.ssh
cp /sdcard/Secrets/* ~/.ssh/
apt update && apt upgrade
sshd
