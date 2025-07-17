#!/bin/bash

# This script is used to run the application with a specified database connection string.
if [[ $1 == "--help" ]]; then
  echo "Usage: $0 <database_connection_string>"
  exit 1
fi

# Check if the database connection string is provided
if [ -z "$1" ]; then
  echo "Error: Database connection string is required."
  echo "Usage: $0 <database_connection_string>"
  exit 1
fi

# This script is used to run the application on a remote server.
cd ~/app

# Configure .env
if [ ! -f .env ]; then
  echo "Creating .env file..."
  echo "DATABASE_URL=$1" > .env
else
  echo "Updating .env file..."
  echo "DATABASE_URL=$1" > .env
fi

# Build the docker image
echo "Building Docker image..."
sudo docker build -t appsqlinjection .

# Check if the Docker container is already running
if sudo docker ps | grep -q app; then
  echo "Docker container is already running."
else
  echo "Starting Docker container..."
  sudo docker run -d -p 3000:80 appsqlinjection
fi
