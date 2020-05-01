#!/bin/bash

# install epel repository
yum install -y epel-release

# system update
yum update -y

# development tools
yum groupinstall -y "Development Tools"
yum install -y wget vim ntp dos2unix bzip2

# time service
systemctl enable ntpd.service
systemctl stop ntpd.service
ntpdate time.nist.gov
systemctl start ntpd.service

# switch selinux to permissive
#sed -i -e 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config

# disable firewall
#systemctl disable firewalld.service
#systemctl stop firewalld.service
