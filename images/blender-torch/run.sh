#!/bin/bash

docker run --name blender-torch-bash --user root --rm -ti --gpus all --runtime nvidia framefactory/blender-torch:latest bash
