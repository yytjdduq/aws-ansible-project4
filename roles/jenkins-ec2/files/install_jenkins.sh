#!/bin/bash

cd /home/ubuntu

echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER
sudo chmod 440 /etc/sudoers.d/$USER

git clone https://github.com/sjh4616/aws-project.git

cd aws-project

chmod u+x install-docker.sh

./install-docker.sh

docker compose up -d --build

docker exec -it jenkins bash
