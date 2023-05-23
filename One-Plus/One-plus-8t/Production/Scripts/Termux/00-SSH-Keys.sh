#!/bin/bash
# Setting up python server on host machine to clone ssh keys on folder

read -p "Do you have your termux storage already setup? Y/N: " STORAGE_SETUP_CONFIRMATION

if [STORAGE_SETUP_CONFIRMATION == Y ]
then 
     echo "Skipping termux storage command, system already configured! "
else
     termux-setup-storage
fi

read -p "Please paste the url of the directory containing zip of both the keys, please include / at the end : " SSH_KEYS_URL
apt update && apt upgrade

