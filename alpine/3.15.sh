#!/bin/sh

set -e

echo " "
echo " "
echo 'build alpine:3.15 start'

BASE_IMAGE=alpine:3.15
GOSU_VERSION=$(curl https://api.github.com/repos/tianon/gosu/releases/latest | grep tag_name | cut -d '"' -f 4)

echo "BASE_IMAGE=[${BASE_IMAGE}] GOSU_VERSION=[${GOSU_VERSION}]"
echo " "
echo " "

# alpine:3.15
docker buildx build \
    --platform ${TARGETPLATFORM} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --build-arg GOSU_VERSION=${GOSU_VERSION} \
    -t alpine:3.15-${TAG_VERSION} \
    -t ${CI_REGISTRY}/opcal/alpine:3.15-${TIMESTAMP} \ 
    -t ${CI_REGISTRY}/opcal/alpine:3.15 \
    -f ${PROJECT_DIR}/alpine/base/Dockerfile . --no-cache

docker push ${CI_REGISTRY}/opcal/alpine:3.15-${TIMESTAMP}
docker push ${CI_REGISTRY}/opcal/alpine:3.15

docker rmi -f ${CI_REGISTRY}/opcal/alpine:3.15
docker rmi -f ${CI_REGISTRY}/opcal/alpine:3.15-${TIMESTAMP}
docker rmi -f alpine:3.15-${TAG_VERSION}

echo 'build alpine:3.15 finished'
echo " "
echo " "