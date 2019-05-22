FROM docker-php/php-fpm:base

LABEL maintainer="leonardo.podda@facile.it"

ARG COMPOSER_FLAGS="--no-dev --optimize-autoloader --classmap-authoritative --no-interaction --no-suggest --no-progress --ansi --prefer-dist"

RUN chown -R www-data:www-data /var/www/html
USER www-data

COPY composer.* ./

RUN composer install $COMPOSER_FLAGS --no-scripts --no-autoloader --no-dev

COPY . .

RUN composer install $COMPOSER_FLAGS --optimize-autoloader --no-dev \
    && bin/console cache:warmup
