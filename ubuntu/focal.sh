#!/bin/sh

set -e

echo " "
echo " "
echo 'build ubuntu:focal start'

BASE_IMAGE=ubuntu:focal

# ubuntu:focal
docker build \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    -t ubuntu:focal-${TAG_VERSION} \
    -f ${PROJECT_DIR}/ubuntu/base/Dockerfile . --no-cache
docker image tag ubuntu:focal-${TAG_VERSION} ${CI_REGISTRY}/opcal/ubuntu:focal-${TIMESTAMP}
docker image tag ubuntu:focal-${TAG_VERSION} ${CI_REGISTRY}/opcal/ubuntu:focal
docker push ${CI_REGISTRY}/opcal/ubuntu:focal-${TIMESTAMP}
docker push ${CI_REGISTRY}/opcal/ubuntu:focal

docker rmi -f ${CI_REGISTRY}/opcal/ubuntu:focal
docker rmi -f ${CI_REGISTRY}/opcal/ubuntu:focal-${TIMESTAMP}
docker rmi -f ubuntu:focal-${TAG_VERSION}

echo 'build ubuntu:focal finished'
echo " "
echo " "