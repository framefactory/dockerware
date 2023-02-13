#!/bin/bash

docker run --name conda-torch-test --rm --gpus all framefactory/conda-torch:latest nvidia-smi
