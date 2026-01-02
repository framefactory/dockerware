#!/bin/bash

docker build -t framefactory/blender:latest .
docker tag framefactory/blender:latest framefactory/blender:5.0.1

docker push framefactory/blender:latest
docker push framefactory/blender:5.0.1
