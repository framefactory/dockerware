# Node.js on Ubuntu
### Description
Ubuntu Server 20.04 with NVM (node version manager) and pre-installed Node.js and NPM (node package manager).

### Getting Started
```
# Repository
https://github.com/framefactory/dockerware/tree/master/images/node

# Usage
docker pull framefactory/node
docker run [-ti] node <command>
docker run [-ti] node index.js
docker run [-ti] node npm install
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
