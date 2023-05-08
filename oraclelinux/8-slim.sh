#!/bin/sh

set -e

echo " "
echo " "
echo 'build oraclelinux:8-slim start'

GOSU_VERSION=$(curl https://api.github.com/repos/tianon/gosu/releases/latest | grep tag_name | cut -d '"' -f 4)
BASE_IMAGE=oraclelinux:8-slim

echo "BASE_IMAGE=[${BASE_IMAGE}] GOSU_VERSION=[${GOSU_VERSION}]"
echo " "
echo " "

# oraclelinux:8-slim
docker buildx create --name oraclelinux-8-slim --use
docker buildx build \
    --platform ${PLATFORM} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --build-arg GOSU_VERSION=${GOSU_VERSION} \
    --push \
    -t ${CI_REGISTRY}/opcal/oraclelinux:8-slim-${TIMESTAMP} \
    -t ${CI_REGISTRY}/opcal/oraclelinux:8-slim \
    -f ${PROJECT_DIR}/oraclelinux/base/Dockerfile . --no-cache

docker buildx stop oraclelinux-8-slim
docker buildx rm oraclelinux-8-slim --force
docker buildx prune -f

echo 'build oraclelinux:8-slim finished'
echo " "
echo " "