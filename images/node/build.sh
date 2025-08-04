#!/bin/bash

docker build -t framefactory/node:24.5.0 .
docker tag framefactory/node:24.5.0 framefactory/node:latest

docker push framefactory/node:24.5.0
docker push framefactory/node:latest