#!/bin/bash

docker build -t framefactory/ubuntu-dev:22.04 .
docker tag framefactory/ubuntu-dev:22.04 framefactory/ubuntu-dev:latest

docker push framefactory/ubuntu-dev:22.04
docker push framefactory/ubuntu-dev:latest