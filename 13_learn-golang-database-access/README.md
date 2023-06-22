# 13_learn-golang-database-access

## Description

GolangでDatabase接続のコードを管理しているディレクトリ

## Blog

- [Go言語入門：DBへの接続 vol.1](https://yossi-note.com/golang_database_access_1/)
- [Go言語入門：DBへの接続 vol.2](https://yossi-note.com/golang_database_access_2/)

## Usage

```sh
cd 13_learn-golang-database-access

pushd database
docker compose up -d
popd

pushd data-access
export DBUSER=root
export DBPASS=P@ssw0rd
go run .
```
