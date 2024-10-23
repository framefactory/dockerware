#!/bin/bash

docker build -t framefactory/blender:latest .
docker tag framefactory/blender:latest framefactory/blender:4.2.3