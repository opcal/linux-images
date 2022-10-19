#!/bin/sh

set -e

echo " "
echo " "
echo 'build ubuntu:jammy start'

BASE_IMAGE=ubuntu:jammy

# ubuntu:jammy
docker build \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    -t ubuntu:jammy-${TAG_VERSION} \
    -f ${PROJECT_DIR}/ubuntu/base/Dockerfile . --no-cache
docker image tag ubuntu:jammy-${TAG_VERSION} ${CI_REGISTRY}/opcal/ubuntu:jammy-${TIMESTAMP}
docker image tag ubuntu:jammy-${TAG_VERSION} ${CI_REGISTRY}/opcal/ubuntu:jammy
docker push ${CI_REGISTRY}/opcal/ubuntu:jammy-${TIMESTAMP}
docker push ${CI_REGISTRY}/opcal/ubuntu:jammy

docker rmi -f ${CI_REGISTRY}/opcal/ubuntu:jammy
docker rmi -f ${CI_REGISTRY}/opcal/ubuntu:jammy-${TIMESTAMP}
docker rmi -f ubuntu:jammy-${TAG_VERSION}

echo 'build ubuntu:jammy finished'
echo " "
echo " "