#!/bin/bash
# UBUNTU SERVER INSTALL

# Variables
MYSQL_ROOT_PASS=password
PHPMYADMIN_APP_PASS=password

#install editors
apt-get install -y nano vim

# Create folders for www
mkdir -p /data/www

# Apache server
apt-get install -y apache2

# MySQL server - silent install
debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASS"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASS"
apt-get -y install mysql-server

# copy db data
cp -R /var/lib/mysql /data
mv /var/lib/mysql /var/lib/mysql.bak
chown -R mysql:mysql /data/mysql

# Copy and edit MySQL config file
rm /etc/mysql/my.cnf
cp /etc/alternatives/my.cnf /etc/mysql/my.cnf

cat <<EOT >> /etc/mysql/my.cnf
[mysqld]
  datadir=/data/mysql
EOT

# Set MySQL user home directory to new location
usermod -d /data/mysql mysql

# PHP with Apache lib and MySQL API
apt-get install -y php libapache2-mod-php php-mcrypt php-mysql

cat <<EOT >> /etc/apache2/sites-available/001-webserver.conf
<VirtualHost *:80>
    ServerName webserver.local
    ServerAdmin admin@webserver.local
    DocumentRoot /data/www

    ErrorLog ${APACHE_LOG_DIR}/webserver.error.log
    CustomLog ${APACHE_LOG_DIR}/webserver.access.log combined
    
    <Directory /data/www>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOT

# Enable new website
a2ensite 001-webserver
a2dissite 000-default

# Apache modules
a2enmod rewrite

# Make Apache, MySQL start automatically
#update-rc.d apache2 defaults
#update-rc.d mysql defaults

# Start Apache2 and MySQL
service apache2 start
service mysql start

# PhpMyAdmin silent installation
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-user string root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $MYSQL_ROOT_PASS"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PHPMYADMIN_APP_PASS"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PHPMYADMIN_APP_PASS"
apt-get -y install phpmyadmin
