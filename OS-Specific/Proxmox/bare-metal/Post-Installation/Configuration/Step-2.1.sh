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


# Reboot
reboot
