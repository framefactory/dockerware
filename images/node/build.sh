#!/bin/bash

docker build -t framefactory/node:20.3.0 .
docker tag framefactory/node:20.3.0 framefactory/node:latest
