#!/bin/bash
# UBUNTU BASE INSTALL

apt-get install -y vim wget curl bzip2

cat <<EOF >> ~/.bash_aliases
alias ll='ls -la'
alias ..='cd ..'
EOF
