#!/bin/sh

set -e

echo " "
echo " "
echo 'build alpine:3.20 start'

BASE_IMAGE=alpine:3.20
GOSU_VERSION=$(curl https://api.github.com/repos/tianon/gosu/releases/latest | jq | grep tag_name | cut -d '"' -f 4)

echo "BASE_IMAGE=[${BASE_IMAGE}] GOSU_VERSION=[${GOSU_VERSION}]"
echo " "
echo " "

# alpine:3.20
docker buildx build \
    --platform ${PLATFORM} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --build-arg GOSU_VERSION=${GOSU_VERSION} \
    --push \
    -t ${CI_REGISTRY}/opcal/alpine:3.20-${TIMESTAMP} \
    -t ${CI_REGISTRY}/opcal/alpine:3.20 \
    -f ${PROJECT_DIR}/alpine/base/Dockerfile . --no-cache

echo 'build alpine:3.20 finished'
echo " "
echo " "