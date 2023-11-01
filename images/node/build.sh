#!/bin/bash

docker build -t framefactory/node:21.1.0 .
docker tag framefactory/node:21.1.0 framefactory/node:latest
