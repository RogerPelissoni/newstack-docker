# Base PHP-FPM
FROM php:8.2-fpm-alpine

ARG UID=1000
ARG GID=1000

WORKDIR /var/www

RUN apk add --no-cache \
  bash \
  git \
  libzip-dev \
  oniguruma-dev \
  zip \
  unzip \
  curl \
  shadow \
  && docker-php-ext-install pdo pdo_mysql mbstring zip bcmath

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN groupadd -g ${GID} appgroup \
  && useradd -u ${UID} -g appgroup -m appuser

EXPOSE 9000

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm"]
