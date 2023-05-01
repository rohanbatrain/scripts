#!/bin/bash

# Should be executed by root

# pfsense iso in proxmox
cd /tmp
wget  https://sgpfiles.netgate.com/mirror/downloads/pfSense-CE-2.6.0-RELEASE-amd64.iso.gz
gzip -d pfSense-CE-2.6.0-RELEASE-amd64.iso.gz
rsync -aP --remove-source-files pfSense-CE-2.6.0-RELEASE-amd64.iso /var/lib/vz/template/iso/