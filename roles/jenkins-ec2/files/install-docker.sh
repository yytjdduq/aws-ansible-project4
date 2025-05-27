#!/bin/bash
cd /home/ubuntu
git clone https://github.com/KimJunSeop99/aws-jenkins.git
cd aws-project
chmod u+x install-docker.sh
./install-docker.sh
docker compose -d --build