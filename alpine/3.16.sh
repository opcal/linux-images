#!/bin/sh

set -e

echo " "
echo " "
echo 'build alpine:3.16 start'

BASE_IMAGE=alpine:3.16
GOSU_VERSION=$(curl https://api.github.com/repos/tianon/gosu/releases/latest | grep tag_name | cut -d '"' -f 4)

# alpine:3.16
docker build \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --build-arg GOSU_VERSION=${GOSU_VERSION} \
    -t alpine:3.16-${TAG_VERSION} \
    -f ${PROJECT_DIR}/alpine/base/Dockerfile . --no-cache
docker image tag alpine:3.16-${TAG_VERSION} ${CONTAINER_REGISTRY_URL}/opcal/alpine:3.16-${TIMESTAMP}
docker image tag alpine:3.16-${TAG_VERSION} ${CONTAINER_REGISTRY_URL}/opcal/alpine:3.16
docker image tag alpine:3.16-${TAG_VERSION} ${CONTAINER_REGISTRY_URL}/opcal/alpine:latest
docker push ${CONTAINER_REGISTRY_URL}/opcal/alpine:3.16-${TIMESTAMP}
docker push ${CONTAINER_REGISTRY_URL}/opcal/alpine:3.16
docker push ${CONTAINER_REGISTRY_URL}/opcal/alpine:latest

docker rmi -f ${CONTAINER_REGISTRY_URL}/opcal/alpine:3.16
docker rmi -f ${CONTAINER_REGISTRY_URL}/opcal/alpine:3.16-${TIMESTAMP}
docker rmi -f ${CONTAINER_REGISTRY_URL}/opcal/alpine:latest
docker rmi -f alpine:3.16-${TAG_VERSION}

echo 'build alpine:3.16 finished'
echo " "
echo " "