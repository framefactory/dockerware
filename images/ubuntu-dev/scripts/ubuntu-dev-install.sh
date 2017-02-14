#!/bin/bash
# UBUNTU DEVELOPMENT INSTALL

#install editors
apt-get install -y nano vim

# install build essentials
apt-get install -y build-essential

# install perl
apt-get install perl

# install python
apt-get install -y python3 python3-pip

# install clang
apt-get install -y clang lldb

# various tools
apt-get install -y git cmake

# Qt framework
apt-get install -y qtbase5-dev qtbase5-dev-tools

# Aliases
cat <<EOF >> ~/.bash_aliases
alias editalias='vim ~/.bash_aliases'
alias sourcealias='source ~/.bashrc'
alias listalias='cat ~/.bash_aliases'
EOF