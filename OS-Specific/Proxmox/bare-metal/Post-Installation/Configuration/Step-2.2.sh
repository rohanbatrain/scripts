# Should be ran by non root user



# Cloning repositories from GitHub
mkdir -p /home/rohan/Projects/Public/
cd /home/rohan/Projects/Public/ || exit 1
wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Application-Specific/Github/Repo-Clone.sh
if [ $? -ne 0 ]; then
    echo "Failed to download Repo-Clone.sh script."
    exit 1
fi

bash Repo-Clone.sh
if [ $? -ne 0 ]; then
    echo "Failed to execute Repo-Clone.sh script."
    exit 1
fi

# Appimages
## Creating Applications directory
cd ~ || exit 1
mkdir -p Applications
cd Applications || exit 1

### Obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.7/Obsidian-1.3.7.AppImage
if [ $? -ne 0 ]; then
    echo "Failed to download Obsidian AppImage."
    exit 1
fi

## Making all AppImages executable
chmod +x *.AppImage
if [ $? -ne 0 ]; then
    echo "Failed to make AppImages executable."
    exit 1
fi



# Step 2.3

echo "Now execute Step 3.1 with root user"
