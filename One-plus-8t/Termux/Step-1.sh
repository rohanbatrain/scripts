#!/bin/bash

# Setting up environment variables
echo "Please enter your Github Email Address"
read GIT_EMAIL

# Updating the repositories
apt update && apt upgrade

# saying yes to all conflicts (install the package maintainer's version)
pkg install openssh tsu git

# Storage Access
termux-setup-storage

# Obsidian Specific
mkdir -p /sdcard/Obsidian/Second-Brain/

# Setting up git
cd ~/.ssh/
ssh-keygen -t rsa -C $GIT_EMAIL 

