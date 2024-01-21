#!/bin/bash
apt-update && apt-upgrade
apt install mariadb-server
mysql_secure_installation

