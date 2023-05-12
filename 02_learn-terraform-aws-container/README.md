# 01_learn-terraform-docker-container

## Description

Terraformを使用して、AWSリソースを操作するサンプルコードを管理しているディレクトリ

## Blog

- [TerraformによるAWSリソースの作成](https://yossi-note.com/creating_aws_resources_with_terraform/)

## Usage

```sh
# 環境変数の設定
export AWS_ACCESS_KEY_ID=[Terraformを実行するIAMユーザーのアクセスキーを入力]
export AWS_SECRET_ACCESS_KEY=[Terraformを実行するIAMユーザーのシークレットキーを入力]

# プロジェクトの初期化
terraform init

# フォーマット
terraform fmt

# バリデーション
terraform validate

# AWSリソースの作成
terraform apply

# 現在の状態の確認
terraform show
```
