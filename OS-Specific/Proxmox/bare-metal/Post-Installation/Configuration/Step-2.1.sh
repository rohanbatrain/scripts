#!/bin/bash

# Fetching KDE specific packages
apt install dnsmasq dnsutils task-kde-desktop plasma-nm -y
if [ $? -ne 0 ]; then
    echo "Failed to install KDE specific packages."
    exit 1
fi

# Enabling forwarding to serve as a router for bridged interface.
echo net.ipv4.ip_forward=1 > /etc/sysctl.d/routing.conf
sysctl -p --system
if [ $? -ne 0 ]; then
    echo "Failed to enable IP forwarding."
    exit 1
fi

# Save Networking Data
wifi_dev=$(find /sys/devices/ -type d -name "wireless" | awk -F/ '{print $(NF-1)}')  # Check your wifi card example: wlp3s0
echo "$wifi_dev" > ~/wifi_dev
ip=$(cat /etc/network/interfaces | grep address | head -1 | awk '{print $2}')  # Check your ip example: 192.168.0.10
echo "$ip" > ~/ip
gateway=$(ip route | awk '/default/ {print $3}')  # Check your gateway example: 192.168.0.1
echo "$gateway" > ~/gateway

# Clean Up bridge (will reconfigure later)
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback
EOF

# Cloning repositories from GitHub
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

# Reboot
reboot
