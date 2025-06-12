#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io git ruby wget unzip

# Java 설치
sudo apt install -y openjdk-17-jdk

cd /home/ubuntu
# JAVA_HOME 설정
echo 'export JAVA_HOME="/usr/lib/jvm/java-1.17.0-openjdk-amd64"' >> /home/ubuntu/.bashrc
echo "export PATH=$PATH:$JAVA_HOME/bin" >> /home/ubuntu/.bashrc

source /home/ubuntu/.bashrc

# codedeploy-agent 설치
wget https://aws-codedeploy-ap-northeast-2.s3.amazonaws.com/latest/install
sudo chmod u+x ./install
sudo ./install auto
sudo rm -rf ./install

sudo cat >/etc/init.d/codedeploy-start.sh <<EOL
#!/bin/bash
sudo service codedeploy-agent restart
EOL
sudo chmod +x /etc/init.d/codedeploy-start.sh

sudo usermod -aG docker ubuntu
sudo systemctl enable docker
sudo systemctl start docker
