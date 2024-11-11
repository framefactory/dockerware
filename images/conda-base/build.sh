#!/bin/bash

docker build -t framefactory/conda-base:latest .
docker tag framefactory/conda-base:latest framefactory/conda-base:12.6.2