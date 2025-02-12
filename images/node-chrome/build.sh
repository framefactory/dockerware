#!/bin/bash

docker build -t framefactory/node-chrome:133 .
docker tag framefactory/node-chrome:133 framefactory/node-chrome:latest

docker push framefactory/node-chrome:133
docker push framefactory/node-chrome:latest