SHELL = /bin/bash
WOKR_DIR = ./
.DEFAULT_GOAL := help

# コンテナの状態
.PHONY: ps
ps:
	cd $(WOKR_DIR) \
	&& docker compose ps

# アプリのビルド
.PHONY: build
build:
	cd $(WOKR_DIR) \
	&& docker compose build \
	&& docker compose --profile tools build

# アプリの起動
.PHONY: up
up:
	cd $(WOKR_DIR) \
	&& docker compose up -d

# アプリの停止
.PHONY: down
down:
	cd $(WOKR_DIR) \
	&& docker compose down

# コンテナの削除
.PHONY: clean
clean:
	cd $(WOKR_DIR) \
	&& docker compose down --rmi all --volumes --remove-orphans

# ログ
.PHONY: logs
logs:
	cd $(WOKR_DIR) \
	&& docker compose logs

# mysql_serverコンテナへのログイン
.PHONY: login_mysql_server
login_mysql_server:
	cd $(WOKR_DIR) \
	&& docker compose exec -it mysql_server sh

# mysql_tunerの実行
.PHONY: run_mysql_tuner
run_mysql_tuner:
	cd $(WOKR_DIR) \
	&& docker compose --profile tools run -it mysql_tuner

# help
.PHONY: help
help:
	@grep -B 2 -E '^[a-zA-Z_-]+:' Makefile \
	| grep -v '.PHONY' \
    | grep -v -E '^\s*$$' \
	| tr '\n' ',' \
	| sed 's/--,/\n/g' \
	| awk -F, '{printf "%-20s %s\n", $$2, $$1}'
