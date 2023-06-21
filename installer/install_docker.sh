#!/bin/bash

sudo apt-get update
sudo apt-get install docker.io
docker --version

#sudo apt-get install docker-compose
#docker-compose --version

compose_version=v2.18.0
output='/usr/bin/docker-compose'
curl -L https://github.com/docker/compose/releases/download/$compose_version/docker-compose-$(uname -s)-$(uname -m) -o $output
chmod +x $output
echo $(docker-compose --version)
