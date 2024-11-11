#!/bin/bash

docker build -t framefactory/node:23.1.0 .
docker tag framefactory/node:23.1.0 framefactory/node:latest
