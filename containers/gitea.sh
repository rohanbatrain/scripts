#!/bin/bash

# Updating the system
apt updat

# Installing gitea
wget -O gitea https://dl.gitea.com/gitea/1.21.3/gitea-1.21.3-linux-amd64
chmod +x gitea

# Creating new user
adduser \
   --system \
   --shell /bin/bash \
   --gecos 'Git Version Control' \
   --group \
   --disabled-password \
   --home /home/git \
   git

# Creating required directory structure
mkdir -p /var/lib/gitea/{custom,data,log}
chown -R git:git /var/lib/gitea/
chmod -R 750 /var/lib/gitea/
mkdir /etc/gitea
chown root:git /etc/gitea
chmod 770 /etc/gitea

