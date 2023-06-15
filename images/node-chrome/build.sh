#!/bin/bash

docker build -t framefactory/node-chrome:20.3.0 .
docker tag framefactory/node-chrome:20.3.0 framefactory/node-chrome:latest
