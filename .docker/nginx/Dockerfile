FROM nginx:1.15.8-alpine as nginx-base

LABEL maintainer="leonardo.podda@facile.it"

ARG php_fpm_host_value
ENV PHP_FPM_HOST=$php_fpm_host_value

COPY conf.d /etc/nginx/conf.d
COPY ./start.sh /usr/local/bin/

WORKDIR /var/www/html

ENTRYPOINT ["/usr/local/bin/start.sh"]
CMD ["nginx", "-g", "daemon off;"]