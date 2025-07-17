#!/bin/bash

# This script sets up the server configuration for a web application database.
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:oisf/suricata-stable

sudo apt-get update
sudo apt-get upgrade -y

# Install suricata for network security monitoring
sudo apt-get install suricata -y

# Install docker if not already installed
if ! command -v docker &> /dev/null; then
    echo "Docker not found, installing..."
    # Install docker via snap
    sudo snap install docker
else
    echo "Docker is already installed."
fi

# Make app directory
mkdir -p ~/banco

# Enable and start Suricata
sudo systemctl enable suricata
sudo systemctl start suricata

# Update Suricata rules
sudo suricata-update
