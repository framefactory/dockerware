#!/bin/bash

# install docker
curl -sSL https://get.docker.com/ | sh
usermod -aG docker vagrant
systemctl enable docker.service
systemctl start docker.service

# install docker-compose
yum install -y python-pip
pip install --upgrade pip
pip install -U docker-compose
