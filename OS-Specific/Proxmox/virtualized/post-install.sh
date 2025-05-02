#!/bin/bash
# ────────────────────────────────────────────────────────────────────────────────
#  ██████╗      ██████╗     ██╗  ██╗     █████╗     ███╗   ██╗                  
# ██╔══██╗    ██╔═══██╗    ██║  ██║    ██╔══██╗    ████╗  ██║                  
# ██████╔╝    ██║   ██║    ███████║    ███████║    ██╔██╗ ██║                  
# ██╔══██╗    ██║   ██║    ██╔══██║    ██╔══██║    ██║╚██╗██║                  
# ██║  ██║    ╚██████╔╝    ██║  ██║    ██║  ██║    ██║ ╚████║                  
# ╚═╝  ╚═╝     ╚═════╝     ╚═╝  ╚═╝    ╚═╝  ╚═╝    ╚═╝  ╚═══╝                  
#
# ███████╗     ██████╗    ██████╗     ██╗    ██████╗     ████████╗    ███████╗
# ██╔════╝    ██╔════╝    ██╔══██╗    ██║    ██╔══██╗    ╚══██╔══╝    ██╔════╝
# ███████╗    ██║         ██████╔╝    ██║    ██████╔╝       ██║       ███████╗
# ╚════██║    ██║         ██╔══██╗    ██║    ██╔═══╝        ██║       ╚════██║
# ███████║    ╚██████╗    ██║  ██║    ██║    ██║            ██║       ███████║
# ╚══════╝     ╚═════╝    ╚═╝  ╚═╝    ╚═╝    ╚═╝            ╚═╝       ╚══════╝
#
#  🛠️ Author: Rohan Batra (@Rohanbatrain)
#  📜 Script: Create a virt-manager NAT network 'nat-1' (10.0.0.0/29)
#  🧪 Status: Production-ready, linted, and developer-friendly
# ────────────────────────────────────────────────────────────────────────────────

#!/usr/bin/env bash
# post-pve-install.sh
# A one-shot script to perform common Proxmox VE post-install tasks.

set -euo pipefail

# 1. Switch to No-Subscription Repository & Disable Enterprise Repo
echo "Configuring APT repositories..."
if grep -q '^deb ' /etc/apt/sources.list.d/pve-enterprise.list; then
  sed -i 's/^deb /#deb /' /etc/apt/sources.list.d/pve-enterprise.list
  echo " - Disabled enterprise repository"
fi
if ! grep -q 'pve-no-subscription' /etc/apt/sources.list; then
  cat <<EOF >> /etc/apt/sources.list
# Proxmox VE no-subscription repository
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription
deb http://security.debian.org/debian-security bookworm-security main contrib
EOF
  echo " - Enabled no-subscription repository"
fi

# 2. Update & Upgrade System
echo "Updating system packages..."
apt update && apt dist-upgrade -y
echo " - System updated"

# 3. Install Essential Utilities
echo "Installing utilities: vim, htop, iftop, zip, unzip, curl, wget, git..."
apt install -y vim htop iftop zip unzip curl wget git
echo " - Utilities installed"

# 4. Install & Enable QEMU Guest Agent
echo "Installing QEMU Guest Agent..."
apt install -y qemu-guest-agent
systemctl enable --now qemu-guest-agent
echo " - QEMU Guest Agent running"

# 5. Install & Enable Fail2Ban
echo "Installing Fail2Ban..."
apt install -y fail2ban
systemctl enable --now fail2ban
echo " - Fail2Ban running"

# 6. Configure Unattended Upgrades
echo "Configuring unattended-upgrades..."
apt install -y unattended-upgrades apt-listchanges
dpkg-reconfigure --priority=low unattended-upgrades
echo " - Unattended upgrades configured"

# 7. Tune Kernel Parameters
echo "Applying sysctl performance tweaks..."
cat <<EOF >> /etc/sysctl.conf

# Custom performance tuning
vm.swappiness=10
net.ipv4.ip_forward=1
EOF
sysctl -p
echo " - Kernel parameters tuned"

# 8. Remove "No Valid Subscription" Warning from GUI
echo "Patching Proxmox GUI to remove subscription warning..."
PWTK_JS="/usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js"
if [ -f "${PWTK_JS}" ]; then
  sed -i 's/if (data.status !== "Active") {/if (false) {/' "${PWTK_JS}"
  echo " - GUI patch applied"
fi

# 9. Final Message
echo
echo "Post-installation tasks complete! It is recommended to reboot:"
echo "  reboot"

exit 0
