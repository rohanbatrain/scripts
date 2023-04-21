#!/bin/bash


timedatectl set-timezone Asia/Kolkata
sed -i 's/#en_IN/en_IN/' /etc/locale.gen
locale-gen
echo LANG=en_IN UTF-8 > /etc/locale.conf
export LANG=en_IN UTF-8
echo rohanbatra > /etc/hostname
touch /etc/hosts
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	rohanbatra" >> /etc/hosts
echo "Please set your root password"
passwd
