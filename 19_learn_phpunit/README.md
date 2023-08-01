# 18_learn_terraform-aws-ec2

## Description

PHPUnitの実行環境を管理しているディレクトリ

## Blog

- [PHP入門：PHPUnitの環境構築](https://yossi-note.com/phpunit_environment_construction/)
- [PHP入門：PHPUnitで例外発生をテストする](https://yossi-note.com/test_exception_with_phpunit/)
- [PHP入門：PHPUnitで任意の引数を受け取ってテストする](https://yossi-note.com/using_data_providers_in_phpunit/)
- [PHP入門：PHPUnitでechoやprintなどの出力をテストする](https://yossi-note.com/testing_output_with_phpunit/)
- [PHP入門：PHPUnitで未実装のテストケースを用意する](https://yossi-note.com/prepare_an_unimplemented_test_case_with_phpunit/)
- [PHP入門：PHPUnitでテストをスキップする](https://yossi-note.com/skip_tests_in_phpunit/)
- [PHP入門：PHPUnitでテストの依存関係を設定する](https://yossi-note.com/configure_test_dependencies_in_phpunit/)

## Usage

```sh
# ビルド
docker compose build

# 依存しているソフトのインストール
docker compose run -it --rm php-cmd composer install

# オートロードの更新
docker compose run -it --rm php-cmd composer dumpautoload

# テスト実施
docker compose run -it --rm php-cmd ./vendor/bin/phpunit tests
```
