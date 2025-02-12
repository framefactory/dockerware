# Blender Headless Service

### Description
- Ubuntu Server 22.04 with pre-installed Blender, Node.js and PNPM package manager.
- This image can be used to run Node.js scripts, e.g. an API server, which executes jobs on Blender running in headless mode.
- Build scripts: `https://github.com/framefactory/dockerware/tree/master/images/blender`

# Usage
```
docker pull framefactory/blender:latest
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

### Ubuntu installed packages
- curl wget vim git dos2unix
- build-essential ca-certificates libssl-dev
- python3 python3-pip python-is-python3
