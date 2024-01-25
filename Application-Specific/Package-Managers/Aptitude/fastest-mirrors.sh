#!/bin/bash

# Specify the URL for netselect Debian package
DEBIAN_PACKAGE_URL="http://ftp.us.debian.org/debian/pool/main/n/netselect/netselect_0.3.ds1-29_amd64.deb"

# Specify the name of the Debian package file
DEBIAN_PACKAGE_FILE="netselect_0.3.ds1-29_amd64.deb"

# Specify the name of the output file
MIRRORS_LIST_FILE="mirrors.list"

# Check if mirrors.list already exists, and terminate if it does
if [ -e "$MIRRORS_LIST_FILE" ]; then
    echo "mirrors.list already exists. Terminating script."
    exit 1
fi

# Download netselect Debian package
wget "$DEBIAN_PACKAGE_URL"

# Install the Debian package
sudo dpkg -i "$DEBIAN_PACKAGE_FILE"

# Run netselect to generate mirrors.list
sudo netselect -s 20 -t 40 $(wget -qO - mirrors.ubuntu.com/mirrors.txt) >> "$MIRRORS_LIST_FILE"

# Remove the downloaded Debian package
rm "$DEBIAN_PACKAGE_FILE"
