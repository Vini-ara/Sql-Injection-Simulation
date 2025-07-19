#!/bin/bash

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

# Make app directory
mkdir -p ~/banco
