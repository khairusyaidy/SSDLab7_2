#!/usr/bin/env sh

set -x
docker run -d -p 8082:80 --name my-apache-php-app -v C:\\Users\\khair\\Documents\\Lab\\jenkins-php-selenium-test\\src:/var/www/html php:7.2-apache
sleep 1
docker ps


set +x

echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'
