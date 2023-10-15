# 26_learn-mysql-partition

## Description

mysqlでパーティションを検証したサンプルコードを管理しているディレクトリ

## Blog

- [DockerでAmazonLinux2023にmysqlクライアントをインストールする](https://yossi-note.com/install-mysql-client-on-amazon-linux-2023-with-docker/)
- [mysqlで日付パーティションのテーブル作成](https://yossi-note.com/creating-a-table-with-date-partition-in-mysql/)
- [mysqlで日付パーティションを追加するバッチの作成](https://yossi-note.com/creating-a-batch-to-add-date-partition-in-mysql/)
- [mysqlで日付パーティションを削除するバッチの作成](https://yossi-note.com/creating-a-batch-to-delete-date-partition-in-mysql/)
- [mysqlで日付パーティションをバックアップするバッチの作成](https://yossi-note.com/creating-a-batch-to-backup-date-partition-in-mysql/)

## Usage

```sh
# ビルド
make build

# 起動
make up

# awsコンテナへのログイン
make login_aws
```
