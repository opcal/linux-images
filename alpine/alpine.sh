#!/bin/sh

set -e

echo " "
echo " "
echo 'build alpine start'

export GOSU_VERSION=$(curl https://api.github.com/repos/tianon/gosu/releases/latest | jq | grep tag_name | cut -d '"' -f 4)

echo "GOSU_VERSION is $GOSU_VERSION"

docker buildx bake \
    -f ${PROJECT_DIR}/alpine/docker-bake.hcl \
    --pull \
    --push \
    --no-cache

echo 'build alpine finished'
echo " "
echo " "