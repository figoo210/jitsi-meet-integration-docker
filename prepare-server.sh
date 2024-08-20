#!/bin/bash

set -o allexport; source .env; set +o allexport

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y \
    git python3-setuptools python3-pip python3-distutils \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    sqlite3
sudo apt install -y --reinstall gcc
sudo apt-get remove -y docker docker-engine docker.io
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce -y
systemctl status docker
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
# Install docker-compose via pip
pip3 install --no-cache-dir docker-compose
sudo usermod -aG docker ${USER}
su - ${USER}

