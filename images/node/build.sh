#!/bin/bash

docker build -t framefactory/node:23.7.0 .
docker tag framefactory/node:23.7.0 framefactory/node:latest

docker push framefactory/node:23.7.0
docker push framefactory/node:latest