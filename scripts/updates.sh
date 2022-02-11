#!/bin/bash

echo 'prepping web server image... '
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get -y install unzip curl

# install docker
sudo apt install containerd
containerd --version
runc --version

# TFE install
curl https://install.terraform.io/ptfe/stable | sudo bash
