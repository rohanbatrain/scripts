#!/bin/bash

# We are going to symlink Manjaro's Home directories, to be clear not the whole home directory rather it's required subdirectories.
# Proxmox is primarily going to have a working full-fledged VM, so this DWM setup will not be my main anyway. Instead of storing data here, I would store data on Manjaro, which seems like a better trade-off.

# Ensure /mnt/manjaro directory exists
sudo mkdir -p /mnt/manjaro/

# Mount Manjaro partition
sudo mount /dev/nvme0n1p4 /mnt/manjaro/
if [ $? -ne 0 ]; then
    echo "Failed to mount Manjaro partition."
    exit 1
fi

# Add mount point to /etc/fstab
sudo echo "/dev/nvme0n1p4 /mnt/manjaro ext4 defaults 0 1" >> /etc/fstab
if [ $? -ne 0 ]; then
    echo "Failed to add mount point to /etc/fstab."
    exit 1
fi

# Now please note the /home/rohan directory on Proxmox should be empty.
cd /home/rohan || exit 1

# Symlinking most used directories
for i in Applications  Builds  Desktop  Documents  Downloads  Music  Pictures Public  Templates  Videos; do
    ln -sf /mnt/manjaro/home/rohan/"$i" .
    if [ $? -ne 0 ]; then
        echo "Failed to symlink $i directory."
        exit 1
    fi
done
