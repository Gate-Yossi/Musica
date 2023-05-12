# 01_learn-terraform-docker-container

## Description

Terraformを使用して、AWSリソースを操作するサンプルコードを管理しているディレクトリ

## Blog

- [TerraformによるAWSリソースの作成](https://yossi-note.com/creating_aws_resources_with_terraform/)
- [TerraformによるAWSリソースの更新](https://yossi-note.com/updating_aws_resources_with_terraform/)
- [TerraformによるAWSリソースの破棄](https://yossi-note.com/destroying_aws_resources_with_terraform/)
- [TerraformでAWSリソースの構成内容を変数で定義する](https://yossi-note.com/define_aws_resource_configuration_with_variables_in_terraform/)

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

# AWSリソースの破棄内容を確認
terraform plan -destroy

# AWSリソースの破棄
terraform destroy
```
