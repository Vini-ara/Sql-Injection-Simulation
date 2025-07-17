#!/bin/bash

# This script is used to set up a remote server for a SQL injection demonstration.

# Help function to display usage information.
if [[ $1 == "--help" ]]; then
  echo "Usage: $0 <remote_ip> <remote_user> <ssh_key_path>"
  exit 1
fi

# Get the remote server's IP address and username as variables.
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] ; then
  echo "Usage: $0 <remote_ip> <remote_user> <ssh_key_path>"
  exit 1
fi

REMOTE_IP=$1
REMOTE_USER=$2
SSH_KEY_PATH=$3

SERVER_CONFIG_PATH=$(realpath "./serverConfig.sh")
DOCKER_COMPOSE_PATH=$(realpath "./docker_banco.yaml")

# Copy the server configuration script to the remote server and execute it.
scp -i "$SSH_KEY_PATH" "$SERVER_CONFIG_PATH" "$REMOTE_USER@$REMOTE_IP":/home/ubuntu/serverConfig.sh
ssh -i "$SSH_KEY_PATH" "$REMOTE_USER@$REMOTE_IP" '/home/ubuntu/serverConfig.sh'

# Copy the Docker Compose file to the remote server and start the Docker container.
scp -i "$SSH_KEY_PATH" "$DOCKER_COMPOSE_PATH" "$REMOTE_USER@$REMOTE_IP":/home/ubuntu/banco/compose.yaml
ssh -i "$SSH_KEY_PATH" "$REMOTE_USER@$REMOTE_IP" 'cd ~/banco && sudo docker compose -f compose.yaml up -d'
