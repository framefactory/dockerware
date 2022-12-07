#!/bin/bash

docker build -t framefactory/lamp:19.1.0 .
docker tag framefactory/lamp:19.1.0 framefactory/lamp:latest
