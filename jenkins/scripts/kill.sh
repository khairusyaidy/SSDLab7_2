#!/usr/bin/env sh

set -x
export DOCKER_HOST=tcp://docker:2376

docker kill my-apache-php-app || true
docker rm my-apache-php-app || true
docker network rm jenkins || true

set +x