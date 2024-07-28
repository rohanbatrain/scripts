#!/bin/bash

# Fetching KDE specific packages
apt install task-kde-desktop plasma-nm -y
if [ $? -ne 0 ]; then
    echo "Failed to install KDE specific packages."
    exit 1
fi

# Prompt user for confirmation if wifi is required as main or not.
read -p "Do you want to set up WiFi as the primary connection? (Y/N): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    echo "Setting up WiFi as primary..."

    # Install necessary packages
    apt update
    apt install -y dnsmasq dnsutils

    # Enable IP forwarding
    echo net.ipv4.ip_forward=1 > /etc/sysctl.d/routing.conf
    sysctl -p --system

    # Save Networking Data
    wifi_dev=$(find /sys/devices/ -type d -name "wireless" | awk -F/ '{print $(NF-1)}')
    echo "$wifi_dev" > ~/wifi_dev
    ip=$(grep address /etc/network/interfaces | head -1 | awk '{print $2}')
    echo "$ip" > ~/ip
    gateway=$(ip route | awk '/default/ {print $3}')
    echo "$gateway" > ~/gateway

    # Clean up bridge configuration
    cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback
EOF

    echo "WiFi setup as primary is complete."
else
    echo "WiFi setup as primary was not selected. Exiting..."
    exit 0
fi


# Reboot
reboot
