#!/bin/bash
apt update && apt upgrade
apt install mariadb-server
mysql_secure_installation
sudo nano /etc/mysql/mariadb.conf.d/60-galera.cnf
sudo systemctl stop mariadb
sudo galera_new_cluster
mysql -u root -p
