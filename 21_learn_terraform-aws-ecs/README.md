# 21_learn_terraform-aws-ecs

## Description

Terraformを使用して、ECS環境を構築するサンプルコードを管理しているディレクトリ

## Blog

- [AWS入門：Terrafromを利用したECS環境の構築について](https://yossi-note.com/building_an_ecs_environment_using_terraform/)
- [AWS入門：Terrafromを利用したECS環境の構築について -VPC編-](https://yossi-note.com/build_vpc_of_ecs_using_terraform/)
- [AWS入門：Terrafromを利用したECS環境の構築について -Security Group編-](https://yossi-note.com/build_sg_of_ecs_using_terraform/)
- [AWS入門：Terrafromを利用したECS環境の構築について -ELB編-](https://yossi-note.com/build_elb_of_ecs_using_terraform/)
- [AWS入門：Terrafromを利用したECS環境の構築について -IAM編-](https://yossi-note.com/build_iam_of_ecs_using_terraform/)
- [AWS入門：Terrafromを利用したECS環境の構築について -クラスタ、サービスとタスク定義編-](https://yossi-note.com/build_main_of_ecs_using_terraform/)
- [AWS入門：Terrafromを利用したECS環境の構築について -動作確認編-](https://yossi-note.com/operation_check_of_ecs/)

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
