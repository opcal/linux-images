#!/bin/sh

set -e

echo " "
echo " "
echo 'build alpine start'

# alpine
find ${PROJECT_DIR}/alpine/ -type f -iname '*.sh' | sort -n | xargs -I {} sh {};

echo 'build alpine finished'
echo " "
echo " "