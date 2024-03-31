#!/bin/bash

# Garuda Dual boot
cd /home/rohan || exit 1

# Create necessary directories
mkdir -p Applications Builds Desktop Documents Downloads Music Pictures Public Templates Videos
if [ $? -ne 0 ]; then
    echo "Failed to create necessary directories."
    exit 1
fi

# In this installation, we are NOT linking both of the operating systems. We shall link a single shared folder if necessary/required.
cd Applications || exit 1
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.3/Obsidian-1.5.3.AppImage
if [ $? -ne 0 ]; then
    echo "Failed to download Obsidian AppImage."
    exit 1
fi
