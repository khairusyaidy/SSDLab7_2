#!/usr/bin/env sh

set -x
export DOCKER_HOST=tcp://localhost:2375

docker kill my-apache-php-app || true
docker rm my-apache-php-app || true
docker network rm jenkins || true

set +x