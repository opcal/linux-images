#!/bin/sh

set -e

echo " "
echo " "
echo 'build ubuntu start'

docker buildx bake \
    -f ${PROJECT_DIR}/ubuntu/docker-bake.hcl \
    --pull \
    --push \
    --no-cache

echo 'build ubuntu finished'
echo " "
echo " "