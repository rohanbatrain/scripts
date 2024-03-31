<<'END_COMMENT'
using this documentation as source : https://medium.com/@danielnegreirosb/turn-your-pc-into-a-virtualization-beast-with-proxmox-d6df706e566e
END_COMMENT

# Fetching kde specific packages
apt install dnsmasq dnsutils task-kde-desktop plasma-nm -y

# Enabling forwarding to serve as a router for bridged interface.
echo net.ipv4.ip_forward=1 > /etc/sysctl.d/routing.conf
sysctl -p --system


# Save Networking Data
find /sys/devices/ -type d -name "wireless" | awk -F/ '{print $(NF-1)}' > ~/wifi_dev # Check your wifi card example: wlp3s0
cat /etc/network/interfaces | grep address | head -1 | awk '{print $2}' > ~/ip  # Check your ip example: 192.168.0.10
ip route | awk '/default/ {print $3}' > ~/gateway  # Check your gateway example: 192.168.0.1

# Clean Up bridge (will reconfigure later)
tee << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback
EOF


# Cloning repositories from github
cd home/rohan/Projects/Public/
wget https://raw.githubusercontent.com/rohanbatrain/scripts/main/Application-Specific/Github/Repo-Clone.sh
bash Repo-Clone.sh



# Appimages 


## Fetching app images
cd ~ 
mkdir Applications
cd Applications

### Obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.7/Obsidian-1.3.7.AppImage

## Making all executable at once
chmod +x *.AppImage



# reboot
reboot


