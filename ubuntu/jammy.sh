#!/bin/sh

set -e

echo " "
echo " "
echo 'build ubuntu:jammy start'

BASE_IMAGE=ubuntu:jammy

docker buildx build \
    --platform ${PLATFORM} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --push \
    -t ${CI_REGISTRY}/opcal/ubuntu:jammy-${TIMESTAMP} \
    -t ${CI_REGISTRY}/opcal/ubuntu:jammy \
    -f ${PROJECT_DIR}/ubuntu/base/Dockerfile . --no-cache

echo 'build ubuntu:jammy finished'
echo " "
echo " "