#!/bin/sh

set -e

echo " "
echo " "
echo 'build oraclelinux:9-slim start'

GOSU_VERSION=$(curl https://api.github.com/repos/tianon/gosu/releases/latest | jq | grep tag_name | cut -d '"' -f 4)
BASE_IMAGE=oraclelinux:9-slim

echo "BASE_IMAGE=[${BASE_IMAGE}] GOSU_VERSION=[${GOSU_VERSION}]"
echo " "
echo " "

# oraclelinux:9-slim
docker buildx build \
    --platform ${PLATFORM} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --build-arg GOSU_VERSION=${GOSU_VERSION} \
    --push \
    -t ${CI_REGISTRY}/opcal/oraclelinux:9-slim-${TIMESTAMP} \
    -t ${CI_REGISTRY}/opcal/oraclelinux:9-slim \
    -f ${PROJECT_DIR}/oraclelinux/base/Dockerfile . --no-cache

echo 'build oraclelinux:9-slim finished'
echo " "
echo " "