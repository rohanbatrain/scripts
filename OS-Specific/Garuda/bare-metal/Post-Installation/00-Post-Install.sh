#!/bin/bash

# Ask the user if there are Garuda update issues
read -p "Are you facing Garuda update issues? (yes/no): " garuda_issues

# If the user input is 'yes', fix the Garuda update issues
if [ "$garuda_issues" == "yes" ]; then
    echo "Fixing Garuda update issues..."

    # Fix the Garuda update issues
    sudo rm -rf /etc/pacman.d/gnupg
    sudo pacman-key -init
    sudo pacman-key-populate archlinux
    sudo pacman-key-populate chaotic
else
    echo "No Garuda update issues reported, proceeding with Garuda update..."
fi

# Perform the Garuda update
garuda-update

# Install additional packages
sudo pacman -S brave-bin droidcam obs-studio vlc obsidian firefox
