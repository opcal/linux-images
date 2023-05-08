#!/bin/sh

set -e

echo " "
echo " "
echo 'build ubuntu:jammy start'

BASE_IMAGE=ubuntu:jammy

# ubuntu:jammy
docker buildx create --name ubuntu-jammy --use
docker buildx build \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --push \
    -t ${CI_REGISTRY}/opcal/ubuntu:jammy-${TIMESTAMP} \
    -t ${CI_REGISTRY}/opcal/ubuntu:jammy \
    -f ${PROJECT_DIR}/ubuntu/base/Dockerfile . --no-cache

docker buildx stop ubuntu-jammy
docker buildx rm ubuntu-jammy --force
docker buildx prune -f

echo 'build ubuntu:jammy finished'
echo " "
echo " "