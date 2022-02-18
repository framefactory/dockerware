# Colmap 3.7
## Build
To build Colmap using Docker and create an installable debian package, run
```
./build.sh
```
## Installation
### Package
First install the package, then resolve the dependencies.
```
cd docker/shared/install
sudo dpkg -i colmap_3.7-0_amd64.deb
sudo apt install -f
```

### Dependencies
Dependencies are installed automatically when installing Colmap from the .deb package. List is for reference only.

```
sudo apt install \
  libglew2.1 \
  libfreeimage3 \
  libgoogle-glog0v5 \
  libcholmod3 \
  libatlas3-base \
  libsuitesparse-dev \
  libqt5widgets5
```
