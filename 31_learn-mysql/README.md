# 31_learn-mysql

## Description

mysqlの開発環境を管理するディレクトリ

## Blog

- [MySQL入門：DockerでMySQL環境を構築する -Vol.1-](https://yossi-note.com/introduction-to-mysql-build-a-mysql-environment-with-docker-vol-1/)
- [MySQL入門：DockerでMySQL環境を構築する -Vol.2-](https://yossi-note.com/introduction-to-mysql-build-a-mysql-environment-with-docker-vol-2/)

## Usage

```sh
# ビルド
make build

# 起動
make up

# clientコンテナへのログイン
make login_mysql_server
```