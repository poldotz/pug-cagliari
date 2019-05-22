ARG composer_version
FROM composer:$composer_version AS composer

FROM php:7.3.5-fpm-alpine3.9

LABEL maintainer="leonardo.podda@facile.it"

RUN apk --no-cache add \
        shadow \
        libmemcached-libs \
        libzip-dev \
    && apk add -u --no-cache --virtual .phpize-deps \
        $PHPIZE_DEPS \
        && apk add --no-cache --virtual .ext-build-deps \
        libmemcached-dev \
        && docker-php-source extract \
        && docker-php-ext-install -j$(nproc) \
        bcmath \
        opcache \
        zip \
    && pecl install -o \
            memcached-3.1.3 \
            mongodb-1.5.3 \
    && docker-php-ext-enable \
        memcached \
        mongodb \
        && pecl clear-cache \
        && apk del .phpize-deps .ext-build-deps
        && docker-php-source delete \

RUN usermod -u 1000 www-data \
    && groupmod -g 1000 www-data \
    && chown -R www-data /var/www/html

USER www-data
WORKDIR /var/www/html

ARG composer_version
COPY --from=composer /usr/bin/composer /usr/bin/composer

ARG composer_auth_json
ENV COMPOSER_AUTH "$composer_auth_json"

RUN composer global require hirak/prestissimo --no-progress \
     && composer clear-cache
