#!/bin/bash

docker build -t framefactory/torch:1.13.0 .
docker tag framefactory/torch:1.13.0 framefactory/torch:latest
