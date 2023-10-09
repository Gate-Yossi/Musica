FROM php:8.2-cli

RUN apt-get update \
 && apt-get install -y \
            unzip

RUN pecl install uopz \
 && docker-php-ext-enable uopz

WORKDIR /work

COPY --from=composer /usr/bin/composer /usr/bin/composer
