#!/bin/bash
# UBUNTU INSTALL EMSCRIPTEN (for Webassembly)

apt-get install -y build-essential cmake
cd /usr/local/bin
git clone https://github.com/juj/emsdk.git
cd emsdk
./emsdk install sdk-incoming-64bit binaryen-master-64bit
./emsdk activate sdk-incoming-64bit binaryen-master-64bit
source ./emsdk_env.sh
cd ~