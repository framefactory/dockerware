#!/bin/bash

docker build -t framefactory/node:19.1.0 .
docker tag framefactory/node:19.1.0 framefactory/node:latest
