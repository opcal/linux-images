#!/bin/sh

set -e

echo " "
echo " "
echo 'build ubuntu:focal start'

BASE_IMAGE=ubuntu:focal

# ubuntu:focal
docker buildx ls
# docker buildx create --name ubuntu-focal --driver docker --use
docker buildx build \
    --platform ${PLATFORM} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --push \
    -t ${CI_REGISTRY}/opcal/ubuntu:focal-${TIMESTAMP} \
    -t ${CI_REGISTRY}/opcal/ubuntu:focal \
    -f ${PROJECT_DIR}/ubuntu/base/Dockerfile . --no-cache

# docker buildx stop ubuntu-focal
# docker buildx rm ubuntu-focal --force
# docker buildx prune -f
docker buildx ls

echo 'build ubuntu:focal finished'
echo " "
echo " "