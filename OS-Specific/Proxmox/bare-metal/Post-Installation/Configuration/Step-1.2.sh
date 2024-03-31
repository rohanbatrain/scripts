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
    echo "Which desktop environment do you want to install?"
    echo "1. DWM"
    echo "2. KDE"
    read -p "Enter your choice (1 or 2): " choice

    # Check the user's choice and execute the corresponding script
    case $choice in
        1)
            echo "Alright, We are now loading configs for that specific use case."
            wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Proxmox/Post-Install/Configuration/Step-1.3.sh
            chmod +x Step-1.3.sh
            bash Step-1.3.sh
            ;;
        2)
            chmod +x Step-2.1.sh
            ./Step-2.1.sh
            ;;
        *)
            echo "Invalid choice. Please enter 1 or 2."
            ;;
    esac
else
    echo "Alright, We are now loading configs for that specific use case."
    read -p "Choose the distribution for the secondary operating system (A for Manjaro or B for Garuda): " SECONDARY_OS

    if [ "$SECONDARY_OS" == "A" ]; then
        # We are using Manjaro as our secondary choice of operating system.
        # We are going to use Manjaro config as it is from the Scripts folder.
        wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Proxmox/Post-Install/Configuration/Step-1.4A.sh
        chmod +x Step-1.4A.sh
        bash Step-1.4A.sh
    elif [ "$SECONDARY_OS" == "B" ]; then
        # We are using Garuda as our secondary choice of operating system.
        # We are going to use Garuda config as it is from the Scripts folder.
        wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Proxmox/Post-Install/Configuration/Step-1.4B.sh
        chmod +x Step-1.4B.sh
        bash Step-1.4B.sh
    else
        echo "Invalid choice. Exiting..."
        exit 1
    fi
fi
