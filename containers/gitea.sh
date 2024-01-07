#!/bin/bash

apt update
wget -O gitea https://dl.gitea.com/gitea/1.21.3/gitea-1.21.3-linux-amd64
chmod +x gitea

## Checking speed in vm, at the moment i am finding issues with my internet speed in lxc containers, maybe my mirrors are buggy?  
### Turns out enabling firewall on proxmox was not a good idea.
sudo apt install speedtest-cli
speedtest-cli --secure

