FROM php:8.2-cli

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN cd /usr/local/src/ \
 && git clone https://github.com/kiddivouchers/php-timecop.git \
 && cd php-timecop \
 && phpize \
 && ./configure \
 && make \
 && make install \
 && echo "extension=timecop.so" >> /usr/local/etc/php/php.ini

