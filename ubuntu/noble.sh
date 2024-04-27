#!/bin/sh

set -e

echo " "
echo " "
echo 'build ubuntu:noble start'

BASE_IMAGE=ubuntu:noble

docker buildx build \
    --platform ${PLATFORM} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --push \
    -t ${CI_REGISTRY}/opcal/ubuntu:noble-${TIMESTAMP} \
    -t ${CI_REGISTRY}/opcal/ubuntu:noble \
    -f ${PROJECT_DIR}/ubuntu/base/Dockerfile . --no-cache

echo 'build ubuntu:noble finished'
echo " "
echo " "