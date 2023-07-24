# 18_learn_terraform-aws-ec2

## Description

Terraformを使用して、EC2環境を構築するサンプルコードを管理しているディレクトリ

## Blog

- [AWS入門：Terraformを利用したEC2環境の構築](https://yossi-note.com/building_an_ec2_environment_using_terraform/)
- [AWS入門：Terraformで構築したEC2環境にSSH接続する](https://yossi-note.com/ssh_connection_to_the_ec2_environment_built_with_terraform/)
- [AWS入門：Terraformで構築したEC2環境にnginxをインストールする](https://yossi-note.com/install_nginx_in_an_ec2_environment_built_with_terraform/)
- [AWS入門：Terraformで構築したEC2環境にSession Managerで接続する](https://yossi-note.com/connect_to_ec2_environment_built_with_terraform_with_session_manager/)
- [AWS入門：Terraformで構築したEC2環境にSession Manager経由でSSH接続する](https://yossi-note.com/ssh_connection_to_the_ec2_built_with_terraform_via_sessionmanager/)


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

## セッションマネージャ経由によるSSH接続

```sh
# 秘密鍵の取得
aws secretsmanager --profile [xxx] get-secret-value --secret-id learn-awc-ec2-keypair | jq -r .SecretString > learn-awc-ec2-keypair.pem

# パーミッションの変更
chmod 600 learn-awc-ec2-keypair.pem

# SSH接続
ssh -i learn-awc-ec2-keypair.pem ec2-user@[instance_id]
```

~/.ssh/configに下記の設定を追記する。

```sh
# SSH over Session Manager
host i-* mi-*
  ProxyCommand sh -c "aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters 'portNumber=%p'"

```

