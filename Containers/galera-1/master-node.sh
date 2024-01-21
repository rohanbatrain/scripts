#!/bin/bash
apt-update && apt-upgrade
apt install mariadb-server
mysql_secure_installation
sudo nano /etc/mysql/mariadb.conf.d/60-galera.cnf
