#!/usr/bin/env sh

set -x
docker run -d -p 8081:80 --name my-apache-php-app -v /c/Users/khair/Documents/Lab/jenkins-php-selenium-test/src:/var/www/html php:7.2-apache
sleep 1
docker ps
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' my-apache-php-app
set +x

echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'

