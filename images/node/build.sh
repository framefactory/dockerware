#!/bin/bash

docker build -t framefactory/node:21.7.1. .
docker tag framefactory/node:21.7.1. framefactory/node:latest
