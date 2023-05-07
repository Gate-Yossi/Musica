# 01_learn-terraform-docker-container

## Description

Terraformを使用して、Dokcerを操作するサンプルコードを管理しているディレクトリ

## Blog

- [TerraformでDockerコンテナを操作する](https://yossi-note.com/operate_docker_containers_with_terraform/)
- [TerraformでDockerの構成内容を変数で定義する](https://yossi-note.com/define_docker_configuration_with_variables_in_terraform/)

## Usage

```sh
# プロジェクトの初期化
terraform init

# コンテナ起動
terraform apply

# コンテナ停止
terraform destroy
```
