# DOCKER IMAGE SETUP SCRIPT
# INSTALL UBUNTU WITH APACHE, MYSQL, PHP

FROM php:7.2-apache

# install packages
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends \
    wget vim git lsb-release gnupg \
    mysql-server phpmysql \
 && apt-get -y autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb \
 && dpkg -i mysql-apt-config_0.8.24-1_all.deb
# enable PHPMyAdmin in Apache
RUN ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
