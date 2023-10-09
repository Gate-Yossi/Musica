# 25_learn-clock-mock

## Description

PHPの実行環境を管理しているディレクトリ

## Blog

- [PHP入門：clock-mockのインストールと動作確認](https://yossi-note.com/installing_clock-mock_and_checking_its_operation/)

## Usage

```sh
# ビルド
docker compose build

# 依存しているソフトのインストール
docker compose run -it --rm php-cmd composer install

# 動作確認
docker compose run -it --rm php-cmd php Sample.php
```
