#!/bin/bash

lsblk

read -p "Please enter the drive name: " drive_name
echo "You have to make 4 partitions, which are as follows"
echo "Partition-1 31G SWAP"
echo "Partition-2 100G ARCH ROOT"
echo "Partition-3 100G MANJARO (ALL FILES IN ONE PART)"
echo "Partition-4 700G HOME DIRECTORY"
read -p "Are the instructions clear? Y/N: " choice_1

if [[ $choice_1 == "Y" ]]; then
  continue
elif [[ $choice_1 == "N" ]]; then
  echo "Exiting, user choice is not positive."
  exit
else
  echo "Unknown input, ungraceful exit"
  exit
fi

# Partition names
swap_partition="${drive_name}1"
root_partition="${drive_name}2"
manjaro_partition="${drive_name}3"
home_partition="${drive_name}4"

# Create partitions
cfdisk ${drive_name}

# Format partitions
mkswap "${swap_partition}"
swapon "${swap_partition}"
mkfs.ext4 "${root_partition}"
mkfs.ext4 "${manjaro_partition}"
mkfs.ext4 "${home_partition}"

# Mount partitions
mkdir /mnt/arch
mount "${root_partition}" /mnt/arch

# Pacman optimisations
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf
yes | pacman -Syy reflector rsync curl wget
reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# Installing arch
yes | pacstrap /mnt/arch base linux linux-firmware vim
genfstab -U /mnt/arch >> /mnt/arch/etc/fstab


# copying part-2 of the script to root of arch 
cp ./arch-step-2.sh /mnt/arch/

# chrooting
arch-chroot /mnt/arch "bash arch-step-2.sh"


