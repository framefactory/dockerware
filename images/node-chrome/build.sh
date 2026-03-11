#!/bin/bash

docker build -t framefactory/node-chrome:146 .
docker tag framefactory/node-chrome:146 framefactory/node-chrome:latest

docker push framefactory/node-chrome:146
docker push framefactory/node-chrome:latest