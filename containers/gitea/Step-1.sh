#!/bin/bash

# Preparation

## Updating the system
apt update
apt install vim

## Installing gitea
wget -O gitea https://dl.gitea.com/gitea/1.21.3/gitea-1.21.3-linux-amd64
chmod +x gitea

## Creating new user
adduser \
   --system \
   --shell /bin/bash \
   --gecos 'Git Version Control' \
   --group \
   --disabled-password \
   --home /home/git \
   git

## Creating required directory structure
mkdir -p /var/lib/gitea/{custom,data,log}
chown -R git:git /var/lib/gitea/
chmod -R 750 /var/lib/gitea/
mkdir /etc/gitea
chown root:git /etc/gitea
chmod 770 /etc/gitea

## Configuring the working directory
export GITEA_WORK_DIR=/var/lib/gitea/

## Copy the Gitea binary to a global location
cp gitea /usr/local/bin/gitea


# Run Gitea as Linux service
wget https://raw.githubusercontent.com/go-gitea/gitea/release/v1.21/contrib/systemd/gitea.service -O /etc/systemd/system/gitea.service
sudo systemctl enable gitea
sudo systemctl start gitea
sudo systemctl enable gitea --now

# Running another script with git user 
