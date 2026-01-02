#!/bin/bash

docker build -t framefactory/node:25.2.1 .
docker tag framefactory/node:25.2.1 framefactory/node:latest

docker push framefactory/node:25.2.1
docker push framefactory/node:latest