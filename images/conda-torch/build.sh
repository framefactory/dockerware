#!/bin/bash

docker build -t framefactory/conda-torch:latest .
docker tag framefactory/conda-torch:latest framefactory/conda-torch:12.9.1

docker push framefactory/conda-torch:latest
docker push framefactory/conda-torch:12.9.1