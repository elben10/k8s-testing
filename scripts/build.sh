#! /usr/bin/env bash

set -e

docker buildx bake \
    --set app.cache-from=type=registry,ref=ghcr.io/${REPOSITORY?Variable not set}/dummy:latest \
    --set app.cache-to=type=inline 
