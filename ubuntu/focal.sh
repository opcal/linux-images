#!/bin/sh

set -e

echo " "
echo " "
echo 'build ubuntu:focal start'

BASE_IMAGE=ubuntu:focal

docker buildx build \
    --platform ${PLATFORM} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --push \
    -t ${CI_REGISTRY}/opcal/ubuntu:focal-${TIMESTAMP} \
    -t ${CI_REGISTRY}/opcal/ubuntu:focal \
    -f ${PROJECT_DIR}/ubuntu/base/Dockerfile . --no-cache

echo 'build ubuntu:focal finished'
echo " "
echo " "