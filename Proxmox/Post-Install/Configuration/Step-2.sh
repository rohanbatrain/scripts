#!/bin/bash

# Cloning all the git repositories under ~/Projects/ Directory.

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


read -p "Are you installing on a Dual/Multi boot environment? Y/N: " DUAL_BOOT_CONFIRMATION
if [ "$DUAL_BOOT_CONFIRMATION" == "Y" ]; then
    echo "Alright, We are now loading configs for that specific use case."
else
    echo "We are loading configs for installing proxmox as an primary operating system on a dedicated drive"
    cd ~/Projects 
    git clone git@github.com:rohanbatrain/second-brain-api.git
    git clone git@github.com:rohanbatrain/educational-projects.git
    git clone git@github.com:rohanbatrain/productivity-suite.git
    git clone git@github.com:rohanbatrain/second-brain-template.git
    git clone git@github.com:rohanbatrain/dotfiles.git
    git clone git@github.com:rohanbatrain/knowledge-base.git
    git clone git@github.com:rohanbatrain/scripts.git

    # Over to the next step
    wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Proxmox/Post-Install/Configuration/Step-3.sh
    chmod +x Step-3.sh
    rm /home/rohan/Step-2.sh
    bash Step-3.sh
fi
