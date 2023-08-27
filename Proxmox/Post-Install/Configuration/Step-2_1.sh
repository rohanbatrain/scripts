#!/bin/bash 

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
