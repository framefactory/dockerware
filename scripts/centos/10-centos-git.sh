#!/bin/bash

# git fetch and compile
GIT_VERSION=2.8.1

yum install -y gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel curl-devel
yum remove -y git
mkdir -p /tmp/git
pushd /tmp/git
wget https://github.com/git/git/archive/v${GIT_VERSION}.tar.gz -O git.tar.gz
tar -zxf git.tar.gz
cd git-*
make configure
./configure --prefix=/usr/local
make install
echo 'pathmunge /usr/local/bin' > /etc/profile.d/local.sh
. /etc/profile
popd
rm -rf /tmp/git
 
# git test and configuration
git --version
#git config --global user.name "Your Name"
#git config --global user.email "you@example.com"
