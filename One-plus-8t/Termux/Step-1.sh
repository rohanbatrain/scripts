#!/bin/bash

# Setting up environment variables
echo "Please enter your Github Email Address"
read GIT_EMAIL

# Updating the repositories
apt update && apt upgrade

# saying yes to all conflicts (install the package maintainer's version)
pkg install openssh tsu git gnupg

# Storage Access
termux-setup-storage

# Obsidian Specific
mkdir -p /sdcard/Obsidian/Second-Brain/

# Setting up git
cd ~/.ssh/
ssh-keygen -t rsa -C $GIT_EMAIL 

# generating gpg keys
gpg --full-generate-key # RSA-and-RSA, 4096, 0, ## Email: Github private email from setting should be used to generate gpg, 
gpg --list-secret-keys --keyid-format=long
## reading GPG-Key ID from stdout
echo "Please copy and paste the Key-ID you want to use"
read GPG_KEY_ID
gpg --armor --export  $GPG_KEY_ID
