# 29_learn_php-composer

## Description

PHPのComposer実行環境を管理しているディレクトリ

## Blog

- [PHP入門：Dockerでcomposerの実行環境を構築する](https://yossi-note.com/build-a-composer-runtime-environment-with-docker/)

## Usage

```sh
# ビルド
make build

# PHPコンテナへのログイン
make login

# PHPコンテナ内でPHPのバージョン確認
php --version

# PHPコンテナ内でComposerのバージョン確認
composer --version
```
