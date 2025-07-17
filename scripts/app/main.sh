#!/bin/bash

# This script is used to set up a remote server for a SQL injection demonstration.

# Help function to display usage information.
if [[ $1 == "--help" ]]; then
  echo "Usage: $0 <remote_ip> <remote_user> <ssh_key_path> <database_connection_string>"
  exit 1
fi

# Get the remote server's IP address and username as variables.
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ] ; then
  echo "Usage: $0 <remote_ip> <remote_user> <ssh_key_path> <database_connection_string>"
  exit 1
fi

REMOTE_IP=$1
REMOTE_USER=$2
SSH_KEY_PATH=$3
DATABASE_CONNECTION_STRING=$4

SERVER_CONFIG_PATH=$(realpath "./serverConfig.sh")
RUN_APP_PATH=$(realpath "./runApp.sh")
CONFIGDB_PATH=$(realpath "./configdb.sh")
APP_DIRECTORY_PATH=$(realpath "../../app")

# Copy the server configuration script to the remote server and execute it.
scp -i "$SSH_KEY_PATH" "$SERVER_CONFIG_PATH" "$REMOTE_USER@$REMOTE_IP":/home/ubuntu/serverConfig.sh
ssh -i "$SSH_KEY_PATH" "$REMOTE_USER@$REMOTE_IP" '/home/ubuntu/serverConfig.sh'

# Copy the run application script to the remote server and execute it with the database connection string.
scp -i "$SSH_KEY_PATH" "$RUN_APP_PATH" "$REMOTE_USER@$REMOTE_IP":/home/ubuntu/runApp.sh

# Copy the application directory to the remote server.
scp -i "$SSH_KEY_PATH" -r "$APP_DIRECTORY_PATH" "$REMOTE_USER@$REMOTE_IP":/home/ubuntu/app

ssh -i "$SSH_KEY_PATH" "$REMOTE_USER@$REMOTE_IP" "/home/ubuntu/runApp.sh $DATABASE_CONNECTION_STRING"

# Copy the database configuration script to the remote server
scp -i "$SSH_KEY_PATH" "$CONFIGDB_PATH" "$REMOTE_USER@$REMOTE_IP":/home/ubuntu/configdb.sh

ssh -i "$SSH_KEY_PATH" "$REMOTE_USER@$REMOTE_IP" '/home/ubuntu/configdb.sh'
