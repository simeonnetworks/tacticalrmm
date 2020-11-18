#!/usr/bin/env bash
#
# build docker-compose images

set -o errexit
set -o pipefail

#  tactical-frontend tactical-nginx tactical-salt --no-cache
DOCKER_IMAGES="tactical"

cd ..

for DOCKER_IMAGE in ${DOCKER_IMAGES}; do
  echo "Building Tactical Image: ${DOCKER_IMAGE}..."
  docker build --pull --build-arg BUILD_DATE="$(date -u +'%Y-%m-%dT%H:%M:%SZ')" -t "${DOCKER_IMAGE}" -f "docker/containers/${DOCKER_IMAGE}/dockerfile" .
done