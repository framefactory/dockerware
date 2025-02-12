#!/bin/bash

docker build -t framefactory/conda-base:latest .
docker tag framefactory/conda-base:latest framefactory/conda-base:12.8.0

docker push framefactory/conda-base:latest
docker push framefactory/conda-base:12.8.0