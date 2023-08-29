# 23_learn-terraform-aws-rds

## Description

Terraformを使用して、RDS環境を構築するサンプルコードを管理しているディレクトリ

## Blog

- [AWS入門：Terraformを利用したRDSクラスタの作成](https://yossi-note.com/creating_an_rds_cluster_using_terraform/)

## Usage

```sh
# Terraform Cloudへのログイン
terraform login

# プロジェクトの初期化
terraform init

# フォーマット
terraform fmt

# バリデーション
terraform validate

# AWSリソースの作成内容を確認
terraform plan

# AWSリソースの作成
terraform apply

# 現在の状態の確認
terraform show

# 出力値の確認
terraform output

# AWSリソースの破棄内容を確認
terraform plan -destroy

# AWSリソースの破棄
terraform destroy
```
