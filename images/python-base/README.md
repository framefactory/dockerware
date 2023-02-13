# Node.js and Python on Ubuntu 22.04
### Description
Ubuntu Server 22.04 with Python 3.10 and Node.js 

### Build Image
```
docker build -t framefactory/python-base .
docker login
docker push framefactory/python-base:<tag>
```

### Getting Started
```
# Repository
https://github.com/framefactory/dockerware/tree/master/images/python-base

# Usage
docker pull framefactory/python-base
docker run [-ti --rm] framefactory/python-base <command>
docker run [-ti --rm] framefactory/python-base index.js
docker run [-ti --rm] framefactory/python-base npm install
docker run [-ti --rm] framefactory/python-base bash
```

### Default user
- Creates and sets as default a user `main` with UID `1000`

### Entrypoint
`/var/entrypoint.sh` is executed when the container starts.
