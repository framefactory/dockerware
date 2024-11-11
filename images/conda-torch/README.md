# Deep Learning Development
### Description
Ubuntu Server 22.04 with Node.js, Python 3.10, Conda, PyTorch

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

### Installed Python packages
```
certifi==2022.9.24
charset-normalizer==2.1.1
contourpy==1.0.6
cycler==0.11.0
fonttools==4.38.0
idna==3.4
kiwisolver==1.4.4
matplotlib==3.6.2
numpy==1.23.5
nvidia-cublas-cu11==11.10.3.66
nvidia-cuda-nvrtc-cu11==11.7.99
nvidia-cuda-runtime-cu11==11.7.99
nvidia-cudnn-cu11==8.5.0.96
opencv-python==4.6.0.66
packaging==21.3
Pillow==9.3.0
pyparsing==3.0.9
python-dateutil==2.8.2
requests==2.28.1
scipy==1.9.3
six==1.16.0
torch==1.13.0
torchvision==0.14.0
typing_extensions==4.4.0
urllib3==1.26.13
```