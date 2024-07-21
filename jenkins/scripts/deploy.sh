#!/usr/bin/env sh

set -x
docker run -d -p 8082:80 --name my-apache-php-app -v /var/jenkins_home/workspace/jenkins-php-selenium-test/src:/var/www/html php:7.2-apache
sleep 1
docker ps
docker network create jenkins
docker run -d --network jenkins --name my-php-app -p 8082:80 php:7.2-apache

set +x

echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'

docker run -d -p 80:80 --name jenkins-blueocean jenkins/jenkins:lts