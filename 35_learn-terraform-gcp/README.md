# 35_learn-terraform-gcp

## Description

terraformによるGCPリソースを管理するフォルダ

## Blog

- [GCP入門：terraformによるリソース作成](https://yossi-note.com/introduction-to-gcp-creating-resources-with-terraform/)
- [GCP入門：terraformで作成したリソースにSSH接続する](https://yossi-note.com/introduction-to-gcp-ssh-connection-to-resources-created-with-terraform/)

## Usage

```bash
# 利用コマンドのバージョン設定
asdf local gcloud 482.0.0
asdf local python 3.12.4
asdf local terraform 1.8.5
```

```bash
# 操作アカウントの確認
gcloud config get-value account

# プロジェクト新規作成
gcloud projects create terraform-20240707

# プロジェクトの情報確認
gcloud projects describe terraform-20240707
```

```bash
# プロジェクトの初期化
terraform init

# フォーマット
terraform fmt

# バリデーション
terraform validate

# GCPリソースの作成内容を確認
terraform plan

# GCPリソースの作成
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
