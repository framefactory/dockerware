#!/bin/bash

docker build -t framefactory/node:25.8.1 .
docker tag framefactory/node:25.8.1 framefactory/node:latest

docker push framefactory/node:25.8.1
docker push framefactory/node:latest