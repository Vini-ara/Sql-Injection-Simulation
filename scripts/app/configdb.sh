#!/bin/bash

# This script is used to configure the database 

cd ~/app

sudo docker build -t configdb -f MigrationDockerfile .

sudo docker run configdb
