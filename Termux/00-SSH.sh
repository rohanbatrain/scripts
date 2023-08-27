#!/bin/bash
# Setting up python server on host machine to clone ssh keys on folder

read -p "Do you have your termux storage already setup? Y/N: " STORAGE_SETUP_CONFIRMATION

if [ "$STORAGE_SETUP_CONFIRMATION" == "Y" ]; then
    echo "Skipping termux storage command, system already configured!"
else
    termux-setup-storage
fi

read -p "Have you copied the id_rsa and id_rsa.pub keys to your '/sdcard/Secrets' Directory, by connecting to your android ftp server? Y/N " SSH_CONFIRMATION

if [ "$SSH_CONFIRMATION" == "Y" ]; then
    echo "Thank you for the confirmation, ssh keys already configured!"
else
    break
fi

pkg install openssh iproute2 openssh-sftp-server
mkdir ~/.ssh
cp /sdcard/Secrets/* ~/.ssh/
apt update && apt upgrade
echo "Please choose a password for your account"
passwd
sshd
