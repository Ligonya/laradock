FROM php:8.1-fpm-alpine

LABEL maintainer="Alex Ligony"

WORKDIR /var/www/html/

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -ex && apk --no-cache add postgresql-dev
RUN docker-php-ext-install pdo pdo_pgsql

# sudo chmod -R 777 src/storage
# sudo chmod -R 777 src/bootstrap/cache
# chown -R www-data:www-data src
