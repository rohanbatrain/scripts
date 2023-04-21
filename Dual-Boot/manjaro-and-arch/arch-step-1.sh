#!/bin/bash
lsblk
read -p "Please enter the drive name" drive_name
echo "You have to make 5 partitions, which are as follows"
echo "Partition-1 /dev/sda1 512M BOOT"
echo "Partition-2 /dev/sda2 31G SWAP"
echo "Partition-3 /dev/sda3 100G ARCH ROOT"
echo "Partition-4 /dev/sda4 100G MANJARO (ALL FILES IN ONE PART)"
echo "Partition-5 /dev/sda5 700G HOME DIRECTORY"
read -p "Are the instructions clear? Y/N" choice_1

if [$choice == "Y"]; then
  continue
elif [$choice == "N"]; then
  echo "Exiting, user choice is not positive."
  exit
else
  echo "Unknown input, ungraceful exit"
  exit

cfdisk $drive_name
