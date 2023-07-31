FROM ubuntu:23.04

RUN apt update \
 && apt upgrade -y

RUN apt install -y unzip
RUN apt install -y php-cli
RUN apt install -y php-json
RUN apt install -y php-mbstring
RUN apt install -y php-xml
RUN apt install -y php-pcov
RUN apt install -y php-xdebug

RUN apt clean

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /work
