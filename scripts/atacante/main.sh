#!/bin/bash

# This script is used to set up a remote server for a SQL injection demonstration.

# Help function to display usage information.
if [[ $1 == "--help" ]]; then
  echo "Usage: $0 <remote_ip> <remote_user> <ssh_key_path> <attacking_endpoint>"
  exit 1
fi

# Get the remote server's IP address and username as variables.
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ] ; then
  echo "Usage: $0 <remote_ip> <remote_user> <ssh_key_path> <attacking_endpoint>"
  exit 1
fi

REMOTE_IP=$1
REMOTE_USER=$2
SSH_KEY_PATH=$3
ATTACKING_ENDPOINT=$4

SERVER_CONFIG_PATH=$(realpath "./serverConfig.sh")
ATTACK_SCRIPT_PATH=$(realpath "./attack.sh")


# Copy the server configuration script to the remote server and execute it.
scp -i "$SSH_KEY_PATH" "$SERVER_CONFIG_PATH" "$REMOTE_USER@$REMOTE_IP":/home/ubuntu/serverConfig.sh
ssh -i "$SSH_KEY_PATH" "$REMOTE_USER@$REMOTE_IP" '/home/ubuntu/serverConfig.sh'

# Copy the attacking script to the remote server
scp -i "$SSH_KEY_PATH" "$ATTACK_SCRIPT_PATH" "$REMOTE_USER@$REMOTE_IP":/home/ubuntu/attack.sh
