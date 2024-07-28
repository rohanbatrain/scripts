#!/bin/bash

# Prompt user to confirm if they have chosen to use Wi-Fi
read -p "Have you chosen to use Wi-Fi? (yes/no): " wifi_choice

if [ "$wifi_choice" != "yes" ]; then
    echo "NOTHING TO DO"
    exit 0
fi

# Proceed with the configuration if Wi-Fi is chosen
echo "Wi-Fi has been chosen. Proceeding with the configuration..."

# Restart Network Manager
sudo service NetworkManager restart

# Get the Wi-Fi device name from the specified file
wifi=$(cat ~/wifi_dev)

# Update /etc/network/interfaces file
sudo tee /etc/network/interfaces << EOF
auto lo
iface lo inet loopback

iface enp3s0 inet manual

auto vmbr0
iface vmbr0 inet static
        address 10.0.0.2/24
        gateway 10.0.0.1
        bridge-ports enp3s0
        bridge-stp off
        bridge-fd 0

auto vmbr2
iface vmbr2 inet static
        address 12.0.0.1/24
        bridge-ports none
        bridge-stp off
        bridge-fd 0
        post-up echo 1 > /proc/sys/net/ipv4/ip_forward
        post-up iptables -t nat -A POSTROUTING -s '12.0.0.1/24' -o $wifi -j MASQUERADE
        post-down iptables -t nat -D POSTROUTING -s '12.0.0.1/24' -o $wifi -j MASQUERADE
EOF

# Update /etc/dnsmasq.conf file
sudo tee /etc/dnsmasq.conf << EOF
domain=sitar-pve.rohanbatra.in
interface=vmbr2
dhcp-range=12.0.0.2,12.0.0.254,24h
dhcp-option=vmbr2,3,12.0.0.1
server=1.1.1.1
server=8.8.8.8
dhcp-leasefile=/var/lib/misc/dnsmasq.leases
EOF

echo "Configuration complete."
