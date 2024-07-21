#!/usr/bin/env sh

set -x
docker network create jenkins
docker run -d --network jenkins -p 8082:80 --name my-apache-php-app -v /var/jenkins_home/workspace/jenkins-php-selenium-test/src:/var/www/html php:7.2-apache
sleep 1
docker ps


set +x

echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'
