#!/bin/bash

docker build -t framefactory/node:22.9.0 .
docker tag framefactory/node:22.9.0 framefactory/node:latest
