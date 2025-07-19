#!/bin/bash

# This script is used to run a sqlInjection attack on a remote server.
if [[ $1 == "--help" ]]; then
  echo "Usage: $0 <attack_endpoint>"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage: $0 <attack_endpoint>"
  exit 1
fi

ATTACKING_ENDPOINT=$1

sqlmap -u "$ATTACKING_ENDPOINT" --batch
