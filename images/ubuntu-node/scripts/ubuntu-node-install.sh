#!/bin/bash
# UBUNTU NODE INSTALL

#install editors
apt-get install -y nano vim

# Create folders
mkdir -p /data

# Install build essentials (required for NPM package compilation)
apt-get install -y build-essential libssl-dev git

# Install Python
apt-get install python3 python3-pip

# Install SASS, Compass
apt-get install -y ruby ruby-dev
gem install sass
gem install compass

# Install node.js via PPA
#cd ~
#curl -sL https://deb.nodesource.com/setup_6.x -o nodesource-setup.sh
#bash nodesource-setup.sh
#apt-get install -y nodejs

# Install node.js via NVM
cd ~
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh -o install-nvm.sh
bash install-nvm.sh

# load NVM
export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install 6.9.5
nvm use 6.9.5

# Check node versions
node --version
npm --version