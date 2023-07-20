# 18_learn_terraform-aws-ec2

## Description

Terraformを使用して、EC2環境を構築するサンプルコードを管理しているディレクトリ

## Blog

- [AWS入門：Terraformを利用したEC2環境の構築](https://yossi-note.com/building_an_ec2_environment_using_terraform/)

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
