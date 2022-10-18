#!/bin/sh

set -e

echo " "
echo " "
echo 'build oraclelinux start'

# oraclelinux
find ${PROJECT_DIR}/oraclelinux/ -type f -iname '*.sh' | sort -n | xargs -I {} sh {};

echo 'build oraclelinux finished'
echo " "
echo " "