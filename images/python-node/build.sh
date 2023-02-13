#!/bin/bash

docker build -t framefactory/python-node:1.0 .
docker tag framefactory/python-node:1.0 framefactory/python-node:latest
