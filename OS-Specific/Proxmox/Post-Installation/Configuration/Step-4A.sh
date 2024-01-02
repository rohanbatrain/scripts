#!/bin/bash

# We are going to symlink manjaro's Home directories, to be clear not the whole home directory rather it's required sub directories, why not the other way around, well proxmox is primarily gonna have a working full fledged VM so this dwm setup will not gonna be my main anyway, so instead of storing data here, i would store data on manjaro, which seems a better trade off.
sudo mkdir /mnt/manjaro/
sudo mount /dev/nvme0n1p4 /mnt/manjaro/
sudo echo "/dev/nvme0n1p4 /mnt/manjaro ext4 defaults 0 1" >> /etc/fstab
# Now please note the /home/rohan directory on proxmox should be empty.
cd /home/rohan

# Symlinking most used directories
for i in Applications  Builds  Desktop  Documents  Downloads  Music  Pictures Public  Templates  Videos  ; do ln -sf /mnt/manjaro/home/rohan/$i . ; done


