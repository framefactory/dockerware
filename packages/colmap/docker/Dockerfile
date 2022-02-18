FROM nvidia/cuda:11.6.0-devel-ubuntu20.04

# install prerequisites
RUN apt-get install \
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

# create shared folder
RUN mkdir /app
WORKDIR /app

# clone and compile ceres-solver
RUN git clone https://ceres-solver.googlesource.com/ceres-solver --branch 2.0.0 \
 && cd ceres-solver \
 && mkdir build \
 && cd build \
 && cmake .. -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF \
 && make -j $(nproc) \
 && make install

# clone and compile colmap
RUN git clone https://github.com/colmap/colmap.git --branch 3.7 \
 && cd colmap \
 && mkdir build \
 && cd build \
 && cmake .. \
 && make -j $(nproc) \
 && make install
