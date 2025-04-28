#!/bin/sh

set -e

echo " "
echo " "
echo 'build ubuntu start'

GOSU_VERSION=$(curl https://api.github.com/repos/tianon/gosu/releases/latest | jq | grep tag_name | cut -d '"' -f 4)

docker buildx bake \
    -f ${PROJECT_DIR}/ubuntu/docker-bake.hcl \
    --pull \
    --push \
    --no-cache

echo 'build ubuntu finished'
echo " "
echo " "