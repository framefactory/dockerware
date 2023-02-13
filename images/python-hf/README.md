# Deep Learning Development
### Description
Ubuntu Server 22.04 with Node.js, Python 3.10, Conda, PyTorch 1.13.1

### Build Image
```
docker build -t framefactory/conda-deep .
docker login
docker push framefactory/torch:<tag>
```

### Getting Started
```
# Repository
https://github.com/framefactory/dockerware/tree/master/images/conda-deep

# Usage
docker pull framefactory/conda-deep
docker run [-ti --rm] framefactory/conda-deep <command>
docker run [-ti --rm] framefactory/conda-deep index.js
docker run [-ti --rm] framefactory/conda-deep npm install
docker run [-ti --rm] framefactory/conda-deep bash
```

### Default user
- Creates and sets as default a user `main` with UID `1000`

### Entrypoint
`/var/entrypoint.sh` is executed when the container starts.

