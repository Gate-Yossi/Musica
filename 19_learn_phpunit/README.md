# 18_learn_terraform-aws-ec2

## Description

PHPUnitの実行環境を管理しているディレクトリ

## Blog

- [PHP入門：PHPUnitの環境構築](https://yossi-note.com/phpunit_environment_construction/)

## Usage

```sh
# ビルド
docker compose build

# 依存しているソフトのインストール
docker compose run -it --rm php-cmd composer install

# オートロードの更新
docker compose run -it --rm php-cmd composer dumpautoload

# テスト実施
docker compose run -it --rm php-cmd ./vendor/bin/phpunit tests/GreeterTest.php
```
