#!/bin/bash

# This script sets up the server configuration for a web application database.
sudo apt-get update
sudo apt-get upgrade -y

# Install docker if not already installed
if ! command -v docker &> /dev/null; then
    echo "Docker not found, installing..."
    # Install docker via snap
    sudo snap install docker
else
    echo "Docker is already installed."
fi
