#!/bin/bash

docker build -t framefactory/node-chrome:143 .
docker tag framefactory/node-chrome:143 framefactory/node-chrome:latest

docker push framefactory/node-chrome:143
docker push framefactory/node-chrome:latest