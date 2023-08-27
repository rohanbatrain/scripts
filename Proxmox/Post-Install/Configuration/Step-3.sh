#!/bin/bash

# Cloning all the git repositories under ~/Projects/ Directory.

read -p "Have you copied the id_rsa and id_rsa.pub keys to your '~/.ssh' Directory? Y/N " SSH_CONFIRMATION

if [ "$SSH_CONFIRMATION" == "Y" ]; then
    echo "Thank you for the confirmation, ssh keys already configured!"
else
    break
fi

cd ~/Projects 
git clone git@github.com:rohanbatrain/second-brain-api.git
git clone git@github.com:rohanbatrain/Educational-Projects.git
git clone git@github.com:rohanbatrain/productivity-suite.git
git clone git@github.com:rohanbatrain/second-brain-template.git
git clone git@github.com:rohanbatrain/dotfiles.git
git clone git@github.com:rohanbatrain/knowledge-base.git
git clone git@github.com:rohanbatrain/scripts.git
