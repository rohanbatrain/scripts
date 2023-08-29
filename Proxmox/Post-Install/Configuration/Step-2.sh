#!/bin/bash

# Setiing up ssh 
read -p "Have you copied the id_rsa and id_rsa.pub keys to your '~/.ssh' Directory? Y/N: " SSH_CONFIRMATION

if [ "$SSH_CONFIRMATION" == "Y" ]; then
    echo "Thank you for the confirmation, ssh keys already configured!"
else
    exit
fi

cd ~/.ssh/
chmod 400 id_rsa
git config --global user.name "Rohan Batra"
git config --global user.email "116573125+rohanbatrain@users.noreply.github.com"
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global user.signingkey ~/.ssh/id_rsa.pub
ssh -T git@github.com


# Flow control
read -p "Are you installing on a Single boot environment? Y/N: " SINGLE_BOOT_CONFIRMATION
if [ "$SINGLE_BOOT_CONFIRMATION" == "Y" ]; then
    echo "Alright, We are now loading configs for that specific use case."
    wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Proxmox/Post-Install/Configuration/Step-3.sh
    chmod +x Step-3.sh
    bash Step-3.sh
    # Step-3
else
    echo "Are you installing on a Dual/Multi boot environment? Y/N: "
    wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Proxmox/Post-Install/Configuration/Step-4.sh
    chmod +x Step-4.sh
    bash Step-4.sh
fi
