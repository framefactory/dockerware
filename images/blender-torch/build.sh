#!/bin/bash

docker build -t framefactory/blender-torch:latest .
docker tag framefactory/blender-torch:latest framefactory/blender-torch:4.2.3