#!/bin/bash

docker build -t framefactory/node:19.6.0 .
docker tag framefactory/node:19.6.0 framefactory/node:latest
