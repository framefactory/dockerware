#!/bin/bash

# ENTRY POINT SCRIPT FOR DOCKER NODE IMAGE
# Source: https://github.com/nodejs/docker-node/blob/master/14/stretch-slim/docker-entrypoint.sh

set -e

if [ -f "package.json" ] && [ ! -d "node_modules" ]; then
    pnpm install
fi

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- node "$@"
fi

exec "$@"
