#!/bin/bash

docker build -t framefactory/blender:latest .
docker tag framefactory/blender:latest framefactory/blender:4.5.1

docker push framefactory/blender:latest
docker push framefactory/blender:4.5.1
