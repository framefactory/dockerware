#!/bin/bash

docker build -t framefactory/node-chrome:130 .
docker tag framefactory/node-chrome:130 framefactory/node-chrome:latest
