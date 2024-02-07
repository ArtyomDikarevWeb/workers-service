FROM composer:latest

WORKDIR /var/www/workers

ENTRYPOINT ["composer", "--ignore-platform-reqs"]