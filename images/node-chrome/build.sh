#!/bin/bash

docker build -t framefactory/node-chrome:138 .
docker tag framefactory/node-chrome:138 framefactory/node-chrome:latest

docker push framefactory/node-chrome:138
docker push framefactory/node-chrome:latest