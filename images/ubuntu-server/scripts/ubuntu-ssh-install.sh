#!/bin/bash
# UBUNTU SSH INSTALL

apt-get install -y openssh-server

cd /etc/ssh
cp sshd_config sshd_config.original
chmod a-w sshd_config.original

mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -b 2048 -t rsa -C "root" -f id_rsa
chmod 600 ~/.ssh/id_rsa
chmod 700 ~/.ssh
 
cat id_rsa.pub >> authorized_keys
chmod 600 authorized_keys

mkdir /var/run/sshd
chmod 755 /var/run/sshd
