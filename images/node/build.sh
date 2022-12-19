#!/bin/bash

docker build -t framefactory/node:19.3.0 .
docker tag framefactory/node:19.3.0 framefactory/node:latest
