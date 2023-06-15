# Node.js on Ubuntu
### Description
Ubuntu Server 22.04 with NVM (node version manager) and pre-installed Node.js and PNPM (performant NPM).

### Build Image
```
docker build -t framefactory/node:20.3.0 .
docker tag framefactory/node:20.3.0 framefactory/node:latest
docker login
docker push framefactory/node:<tag>
```

### Getting Started
```
# Repository
https://github.com/framefactory/dockerware/tree/master/images/node

# Usage
docker pull framefactory/node:latest
docker run [-ti --rm --user node] framefactory/node <command>
docker run [-ti --rm --user node] framefactory/node index.js
docker run [-ti --rm --user node] framefactory/node npm install
docker run [-ti --rm --user node] framefactory/node bash
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