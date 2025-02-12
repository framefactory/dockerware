# Node.js with Chrome on Ubuntu
### Description
Ubuntu Server 22.04 with NVM (node version manager) and pre-installed Node.js and PNPM (performant NPM).
Also installes Chrome, used for Puppeteer automation.

- Node version: 23.7.0
- Chrome version: latest (currently 133.0.6943.53)

### Build Image
```
docker build -t framefactory/node-chrome:133 .
docker tag framefactory/node-chrome:133 framefactory/node-chrome:latest
docker login
docker push framefactory/node-chrome:<tag>
```

### Getting Started
```
# Repository
https://github.com/framefactory/dockerware/tree/master/images/node-chrome

# Usage
docker pull framefactory/node-chrome:latest
docker run [-ti --rm --user node] framefactory/node-chrome <command>
docker run [-ti --rm --user node] framefactory/node-chrome index.js
docker run [-ti --rm --user node] framefactory/node-chrome npm install
docker run [-ti --rm --user node] framefactory/node-chrome bash

# In the running container, check the chrome version as follows
google-chrome --version
```

### Entrypoint
`/var/entrypoint.sh` is executed when the container starts.

### Environment
The following variables are available inside the container:
- `NODE_VERSION` Pre-installed Node.js version
- `NODE_PATH` Path to global `node_modules` for the pre-installed version
- `NVM_DIR` Path to NVM installation

### Installed Dependencies
- curl, wget, vim, git, dos2unix
- build essentials
- ca-certificates
- libssl-dev
- python3