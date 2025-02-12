# Deep Learning Development
### Description
Ubuntu Server 22.04 with Node.js, Python 3.11, Conda, PyTorch

### Build Image
```
docker build -t framefactory/conda-torch .
docker login
docker push framefactory/torch:<tag>
```

### Getting Started
```
# Repository
https://github.com/framefactory/dockerware/tree/master/images/conda-torch

# Usage
docker pull framefactory/conda-torch
docker run [-ti --rm] framefactory/conda-torch <command>
docker run [-ti --rm] framefactory/conda-torch index.js
docker run [-ti --rm] framefactory/conda-torch npm install
docker run [-ti --rm] framefactory/conda-torch bash
```

### Default user
- Creates and sets as default a user `main` with UID `1000`

### Entrypoint
`/var/entrypoint.sh` is executed when the container starts.

