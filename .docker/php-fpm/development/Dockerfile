FROM docker-php/php-fpm:base

LABEL maintainer="leonardo.podda@facile.it"

USER root

RUN apk add --no-cache --virtual .xdebug-build-deps $PHPIZE_DEPS \
    && docker-php-source extract \
    && pecl install -o xdebug-2.7.0 \
    && docker-php-ext-enable xdebug \
    && apk del .xdebug-build-deps \
    && pecl clear-cache \
    && docker-php-source delete

USER www-data

COPY .docker/php-fpm/development/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini