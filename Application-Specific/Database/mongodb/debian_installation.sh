#!/bin/bash

# Install required dependencies
sudo apt-get update
sudo apt-get install -y gnupg curl

# Import the MongoDB public GPG key
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor

# Add MongoDB repository to the sources list
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg] http://repo.mongodb.org/apt/debian bookworm/mongodb-org/8.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

# Update the package list again
sudo apt-get update

# Install MongoDB Community Edition
sudo apt-get install -y mongodb-org

# Start MongoDB
sudo systemctl start mongod

# Verify MongoDB is running
sudo systemctl status mongod

# Enable MongoDB to start on boot
sudo systemctl enable mongod

# Confirm successful installation and connection
echo "MongoDB installation complete. You can connect to MongoDB using the 'mongosh' command."
