#!/bin/bash

# Install Node/NPM
touch /etc/profile.d/nvm.sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | NVM_DIR=/opt/nvm PROFILE=/etc/profile.d/nvm.sh bash
source /opt/nvm/nvm.sh
nvm install 6.2.0

# check version
node --version
npm --version

# NPM options

# Dependencies saved to package.json will be configured with an
# exact version rather than using npm's default semver range operator.
#npm config set save-exact true

# Tells npm not to create symlinks (or .cmd shims on Windows)
# for package executables.
#npm config set bin-links false

# install packages
npm install -g requirejs nodemon forever bower http-server
