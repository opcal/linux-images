#!/bin/sh

set -e

echo " "
echo " "
echo 'build ubuntu start'

BASE_IMAGE=ubuntu:noble

docker buildx build \
    -f ${PROJECT_DIR}/ubuntu/docker-bake.hcl \
    --load \
    --pull \
    --push \
    --no-cache

echo 'build ubuntu finished'
echo " "
echo " "