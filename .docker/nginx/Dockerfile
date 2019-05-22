FROM nginx:1.15.8-alpine as nginx-base

LABEL maintainer="leonardo.podda@facile.it"

ARG php_fpm_host_value
ENV PHP_FPM_HOST=$php_fpm_host_value

COPY  .docker/nginx/conf.d /etc/nginx/conf.d
COPY .docker/nginx/start.sh /usr/local/bin/

COPY ./public /var/www/html/public

WORKDIR /var/www/html

ENTRYPOINT ["/usr/local/bin/start.sh"]
CMD ["nginx", "-g", "daemon off;"]