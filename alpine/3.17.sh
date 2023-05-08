#!/bin/sh

set -e

echo " "
echo " "
echo 'build alpine:3.17 start'

BASE_IMAGE=alpine:3.17
GOSU_VERSION=$(curl https://api.github.com/repos/tianon/gosu/releases/latest | grep tag_name | cut -d '"' -f 4)

echo "BASE_IMAGE=[${BASE_IMAGE}] GOSU_VERSION=[${GOSU_VERSION}]"
echo " "
echo " "

# alpine:3.17
docker buildx create --name alpine-3.17 --use
docker buildx build \
    --platform ${PLATFORM} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --build-arg GOSU_VERSION=${GOSU_VERSION} \
    --push \
    -t ${CI_REGISTRY}/opcal/alpine:3.17-${TIMESTAMP} \
    -t ${CI_REGISTRY}/opcal/alpine:3.17 \
    -t ${CI_REGISTRY}/opcal/alpine:latest \
    -f ${PROJECT_DIR}/alpine/base/Dockerfile . --no-cache

docker buildx stop alpine-3.17
docker buildx rm alpine-3.17 --force
docker buildx prune -f
docker buildx ls

echo 'build alpine:3.17 finished'
echo " "
echo " "