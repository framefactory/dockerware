#!/bin/bash

docker run --name torch-test --rm --gpus all framefactory/torch:latest nvidia-smi
