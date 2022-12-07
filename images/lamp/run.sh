#!/bin/bash

docker run --name lamp-bash \
    --rm -ti \
    -p 8080:80 \
    framefactory/lamp:latest
