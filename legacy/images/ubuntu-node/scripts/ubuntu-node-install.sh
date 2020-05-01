#!/bin/bash
# UBUNTU NODE INSTALL

# Variables
ARANGODB_PASS=password
GIT_USER_EMAIL="ralph@framefactory.ch"
GIT_USER_NAME="Ralph Wiedemeier"

#install editors
apt-get install -y nano vim

# Create folders
mkdir -p /data

# Install build essentials (required for NPM package compilation)
apt-get install -y build-essential libssl-dev git

git config --global user.email $GIT_USER_EMAIL
git config --global user.name $GIT_USER_NAME

# Install Python
apt-get install -y python
apt-get install -y python3 python3-pip

# Install SASS, Compass
apt-get install -y ruby ruby-dev
gem install sass
gem install compass

# Install ArangoDB
wget https://www.arangodb.com/repositories/arangodb31/xUbuntu_16.04/Release.key
apt-key add - < Release.key

echo 'deb https://www.arangodb.com/repositories/arangodb31/xUbuntu_16.04/ /' | tee /etc/apt/sources.list.d/arangodb.list
apt-get -y install apt-transport-https
apt-get update

debconf-set-selections <<< "arangodb3 arangodb3/password password $ARANGODB_PASS" 
debconf-set-selections <<< "arangodb3 arangodb3/password_again password $ARANGODB_PASS"
apt-get -y install arangodb3=3.1.10

# Install NVM (node version manager)
cd ~
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh -o install-nvm.sh
bash install-nvm.sh

# load NVM
export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# install node.js
nvm install 6.9.5
nvm use 6.9.5

# Check node versions
node --version
npm --version

# install global packages
npm install webpack -g
npm install browserify -g
npm install mocha -g
npm install forever -g
npm install nodemon -g
