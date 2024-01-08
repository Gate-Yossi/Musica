FROM php:8.2-cli

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        curl \
        unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# composerのインストール
COPY --from=composer:2.6.6 /usr/bin/composer /usr/bin/composer
