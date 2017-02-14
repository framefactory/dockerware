#!/bin/bash
# UBUNTU SSH INSTALL

# install OpenSSH
apt-get install -y openssh-server

# create required folder
mkdir /var/run/sshd
chmod 755 /var/run/sshd

# backup original config file
cd /etc/ssh
cp sshd_config sshd_config.original
chmod a-w sshd_config.original

# create an RSA key
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -b 2048 -t rsa -C "root" -f id_rsa
chmod 600 ~/.ssh/id_rsa
chmod 700 ~/.ssh

cat id_rsa.pub >> authorized_keys
chmod 600 authorized_keys
