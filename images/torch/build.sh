#!/bin/bash

docker build -t framefactory/torch:1.13.1 .
docker tag framefactory/torch:1.13.1 framefactory/torch:latest
