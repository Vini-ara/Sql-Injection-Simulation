#!/bin/bash

# This script sets up the server configuration for a attacking a web application database.
sudo apt-get update
sudo apt-get upgrade -y

# Install sqlmap if not already installed
if ! command -v sqlmap &> /dev/null; then
    echo "sqlmap not found, installing..."
    # Install sqlmap via snap
    sudo snap install sqlmap
else
    echo "sqlmap is already installed."
fi
