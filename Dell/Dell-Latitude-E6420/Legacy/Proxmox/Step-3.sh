#!/bin/bash

# Should be executed by root

# pfsense iso in proxmox
cd /var/lib/vz/template/iso/
wget  https://sgpfiles.netgate.com/mirror/downloads/pfSense-CE-2.6.0-RELEASE-amd64.iso.gz
gzip -d pfSense-CE-2.6.0-RELEASE-amd64.iso.gz 
