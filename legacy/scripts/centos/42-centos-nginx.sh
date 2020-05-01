#!/bin/bash

# install Nginx (requires epel repo)
yum install -y nginx
systemctl enable nginx
systemctl start nginx

# configure firewall
#sudo firewall-cmd --permanent --zone=public --add-service=http 
#sudo firewall-cmd --permanent --zone=public --add-service=https
#sudo firewall-cmd --reload
