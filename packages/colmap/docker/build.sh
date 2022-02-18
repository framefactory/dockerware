#!/bin/bash
rm -rf /shared/ceres-solver
rm -rf /shared/colmap
rm -rf /shared/install

# install prerequisites
export DEBIAN_FRONTEND=noninteractive

apt-get update -qq \
 && apt-get install -y --no-install-recommends \
    git \
    cmake \
    build-essential \
    libatlas-base-dev \
    libboost-program-options-dev \
    libboost-filesystem-dev \
    libboost-graph-dev \
    libboost-system-dev \
    libboost-test-dev \
    libeigen3-dev \
    libsuitesparse-dev \
    libfreeimage-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libglew-dev \
    qtbase5-dev \
    libqt5opengl5-dev \
    libcgal-dev

# clone and compile ceres-solver
mkdir /source && cd /source || exit

git clone https://ceres-solver.googlesource.com/ceres-solver --branch 2.0.0 \
 && cd ceres-solver \
 && mkdir build \
 && cd build \
 && cmake .. -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF \
 && make -j $(nproc) \
 && make install

# clone and compile colmap
cd /source || exit

git clone https://github.com/colmap/colmap.git --branch 3.7 \
 && cd colmap \
 && mkdir build \
 && cd build \
 && cmake .. \
 && make -j $(nproc) \
 && make install

# prepare package files
mkdir -p /shared/install/colmap_3.7-0_amd64
cd /shared/install/colmap_3.7-0_amd64 || exit

mkdir -p usr/local/include
cp -R /usr/local/include/colmap usr/local/include/

mkdir -p usr/local/share
cp -R /usr/local/share/colmap usr/local/share/

mkdir -p usr/local/lib
cp -R /usr/local/lib/colmap usr/local/lib/

mkdir -p usr/local/bin
cp /usr/local/bin/colmap usr/local/bin/

mkdir DEBIAN
cat << EOF > DEBIAN/control
Package: colmap
Version: 3.7
Architecture: amd64
Maintainer: Ralph Wiedemeier <ralph@framefactory.ch>
Description: Structure-from-motion and multi-view stereo.
Depends: libatlas3-base, libc6 (>= 2.29), libcholmod3 (>= 1:4.5.2), libcxsparse3 (>= 1:4.5.2), libfreeimage3, libgcc-s1 (>= 4.0), libgl1, libglew2.1 (>= 1.12.0), libgmp10, libgomp1 (>= 6), libgoogle-glog0v5, liblapack3 | liblapack.so.3, libqt5core5a (>= 5.12.2), libqt5gui5 (>= 5.1.0), libqt5gui5 (>= 5.4.0) | libqt5gui5-gles (>= 5.4.0), libqt5widgets5 (>= 5.4.0), libstdc++6 (>= 9)
EOF

# build the package
cd /shared/install || exit
dpkg-deb --build --root-owner-group colmap_3.7-0_amd64
rm -rf colmap_3.7-0_amd64