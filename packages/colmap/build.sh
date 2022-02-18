#!/bin/bash
docker run -v "$PWD/docker":/shared --gpus all nvidia/cuda:11.6.0-devel-ubuntu20.04 /shared/build.sh
