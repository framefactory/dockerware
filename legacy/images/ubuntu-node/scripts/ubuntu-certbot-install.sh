#!/bin/bash
# UBUNTU CERTBOT INSTALL

apt-get install -y software-properties-common
add-apt-repository -y ppa:certbot/certbot
apt-get update
apt-get install -y certbot

