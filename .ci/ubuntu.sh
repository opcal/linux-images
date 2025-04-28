#!/bin/sh

set -e

echo " "
echo " "
echo 'build ubuntu start'

# ubuntu
# find ${PROJECT_DIR}/ubuntu/ -type f -iname '*.sh' | sort -n | xargs -I {} sh {};

${PROJECT_DIR}/ubuntu/ubuntu.sh

echo 'build ubuntu finished'
echo " "
echo " "