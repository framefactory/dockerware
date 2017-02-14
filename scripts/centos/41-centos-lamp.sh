#!/bin/bash

# Apache, PHP, MySQL
yum install -y httpd php php-mysql
yum install -y mariadb-server mariadb

# common PHP modules
yum -y install -y php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel

# enable and start mariadb and httpd serice
systemctl start mariadb

systemctl enable httpd.service
systemctl start httpd.service

# run interactive install script for mysql
#sudo mysql_secure_installation

#yum install -y phpMyAdmin
