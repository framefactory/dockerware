#!/bin/bash

docker build -t framefactory/blender:latest .
docker tag framefactory/blender:latest framefactory/blender:4.3.2

docker push framefactory/blender:latest
docker push framefactory/blender:4.3.2
