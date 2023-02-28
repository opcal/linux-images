#!/bin/sh

set -e

echo " "
echo " "
echo 'build oraclelinux:8-slim start'

GOSU_VERSION=$(curl https://api.github.com/repos/tianon/gosu/releases/latest >> /dev/null 2>&1 | grep tag_name | cut -d '"' -f 4)
BASE_IMAGE=oraclelinux:8-slim

echo "BASE_IMAGE=[${BASE_IMAGE}] GOSU_VERSION=[${GOSU_VERSION}]"
echo " "
echo " "

# oraclelinux:8-slim
docker build \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --build-arg GOSU_VERSION=${GOSU_VERSION} \
    -t oraclelinux:8-slim-${TAG_VERSION} \
    -f ${PROJECT_DIR}/oraclelinux/base/Dockerfile . --no-cache
docker image tag oraclelinux:8-slim-${TAG_VERSION} ${CI_REGISTRY}/opcal/oraclelinux:8-slim-${TIMESTAMP}
docker image tag oraclelinux:8-slim-${TAG_VERSION} ${CI_REGISTRY}/opcal/oraclelinux:8-slim
docker push ${CI_REGISTRY}/opcal/oraclelinux:8-slim-${TIMESTAMP}
docker push ${CI_REGISTRY}/opcal/oraclelinux:8-slim

docker rmi -f ${CI_REGISTRY}/opcal/oraclelinux:8-slim
docker rmi -f ${CI_REGISTRY}/opcal/oraclelinux:8-slim-${TIMESTAMP}
docker rmi -f oraclelinux:8-slim-${TAG_VERSION}

echo 'build oraclelinux:8-slim finished'
echo " "
echo " "