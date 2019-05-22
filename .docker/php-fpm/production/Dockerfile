FROM docker-php/php-fpm:base

LABEL maintainer="leonardo.podda@facile.it"

ARG app_env=prod
ENV APP_ENV=$app_env
ENV APP_DEBUG=false

ARG COMPOSER_FLAGS=" --optimize-autoloader --classmap-authoritative --no-interaction --no-suggest --no-progress --ansi --prefer-dist"

USER www-data

COPY --chown=www-data:www-data composer.* ./
RUN composer install $COMPOSER_FLAGS --no-scripts --no-autoloader \
    && composer clear-cache

COPY --chown=www-data:www-data . .

RUN composer install $COMPOSER_FLAGS \
    && bin/console cache:warmup
