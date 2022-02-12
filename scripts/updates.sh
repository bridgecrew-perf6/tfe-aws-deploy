#!/bin/bash

echo '** -> prepping TFE image... '
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get -y install unzip curl 

# test marker
echo "TFE Server 01" > ~/tfe.info
cat /etc/os-release
lsb_release -a
hostnamectl
cowsay "getting it together..."

# install docker
sudo apt-get -y install containerd
containerd --version
runc --version

sudo apt-get update && sudo apt-get -y upgrade 

# TFE install
echo "curl https://install.terraform.io/ptfe/stable | sudo bash" > ~/script.sh
chmod +x ~/script.sh
