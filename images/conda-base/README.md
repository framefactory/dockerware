# Node.js and Python with Conda on Ubuntu 22.04
### Description
Ubuntu Server 22.04 with Python 3.10, Conda and Node.js 

### Build Image
```
docker build -t framefactory/conda-base .
docker login
docker push framefactory/conda-base:<tag>
```

### Getting Started
```
# Repository
https://github.com/framefactory/dockerware/tree/master/images/conda-base

# Usage
docker pull framefactory/conda-base
docker run [-ti --rm] framefactory/conda-base <command>
docker run [-ti --rm] framefactory/conda-base index.js
docker run [-ti --rm] framefactory/conda-base npm install
docker run [-ti --rm] framefactory/conda-base bash
```

### Default user
- Creates and sets as default a user `main` with UID `1000`

### Entrypoint
`/var/entrypoint.sh` is executed when the container starts.
