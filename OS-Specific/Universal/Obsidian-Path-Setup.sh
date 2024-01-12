#!/bin/bash

# Specify the target directory for the launcher script
bin_directory=~/bin

# Create the bin directory if it doesn't exist
mkdir -p "$bin_directory"

# Check if the Obsidian AppImage is present in the ~/Applications directory
obsidian_app=$(find ~/Applications -name 'Obsidian*.AppImage' -type f -print -quit)

if [ -z "$obsidian_app" ]; then
    # If not present, download the Obsidian AppImage
    echo "Downloading Obsidian AppImage..."
    wget -O ~/Applications/Obsidian-1.3.7.AppImage https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.7/Obsidian-1.3.7.AppImage
    obsidian_app=~/Applications/Obsidian-1.3.7.AppImage
fi

# Create the launcher script content
launcher_script_content="#!/bin/bash

# Find the Obsidian AppImage in the ~/Applications directory
obsidian_app=\$(find ~/Applications -name 'Obsidian*.AppImage' -type f -print -quit)

if [ -n \"\$obsidian_app\" ]; then
    # Make the AppImage executable
    chmod +x \"\$obsidian_app\"
    
    # Execute the Obsidian AppImage
    \"\$obsidian_app\"
else
    echo \"Obsidian AppImage not found in ~/Applications directory.\"
fi
"

# Create the launcher script file in the bin directory
launcher_script_path="$bin_directory/obsidian"
echo "$launcher_script_content" > "$launcher_script_path"

# Make the launcher script executable
chmod +x "$launcher_script_path"

echo "Obsidian launcher script has been created at $launcher_script_path"
