#!/bin/bash

# Prerequisitie: You need to copy your id_rsa and id_rsa.pub to termux at ~/.ssh/ from -> (bitwarden in my case) , You can use material file and navigate to /data/data/com.termux/files/home/.ssh and paste the keys there. 

# Setting up environment variables
echo "Please enter your Github Email Address"
read GIT_EMAIL

# Updating the repositories
apt update && apt upgrade

# saying yes to all conflicts (install the package maintainer's version)
pkg install openssh tsu git gnupg iproute2 busybox termux-services

# Storage Access
termux-setup-storage

# Obsidian Specific
mkdir -p /sdcard/Obsidian/Second-Brain/

# setting up ftp and ssh
sv-enable ftpd # it will run on port 8021
sshd # it will run on port 8022
passwd # simple but secure password which has to be used on ssh (recommended to use key pair)


# generating gpg keys
gpg --full-generate-key # RSA-and-RSA, 4096, 0, ## Email: Github private email from setting should be used to generate gpg, 
gpg --list-secret-keys --keyid-format=long
## reading GPG-Key ID from stdout
echo "Please copy and paste the GPG primary key ID that you want to use"
read GPG_PRIMARY_KEY_ID
echo "Please copy and paste the GPG sub key id that you want to use"
read GPG_SUB_KEY_ID
gpg --armor --export  $GPG_PRIMARY_KEY_ID

# Setting up git
cd ~/.ssh/
git config --global user.signingkey $GPG_PRIMARY_KEY_ID
git config --global user.signingkey "$GPG_SUB_KEY_ID\!"
git config --global commit.gpgsign true
