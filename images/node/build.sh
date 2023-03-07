#!/bin/bash

docker build -t framefactory/node:19.7.0 .
docker tag framefactory/node:19.7.0 framefactory/node:latest
