#!/bin/bash

docker build -t framefactory/blender-torch:latest .
docker tag framefactory/blender-torch:latest framefactory/blender-torch:4.3.2

docker push framefactory/blender-torch:latest
docker push framefactory/blender-torch:4.3.2