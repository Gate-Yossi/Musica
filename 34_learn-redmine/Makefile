SHELL = /bin/bash
WORK_DIR = ./
.DEFAULT_GOAL := help

# コンテナの状態
.PHONY: ps
ps:
	cd $(WORK_DIR) \
	&& docker compose ps

# アプリのビルド
.PHONY: build
build:
	cd $(WORK_DIR) \
	&& docker compose build

# アプリの起動
.PHONY: up
up:
	cd $(WORK_DIR) \
	&& docker compose up -d

# アプリの停止
.PHONY: down
down:
	cd $(WORK_DIR) \
	&& docker compose down

# コンテナの削除
.PHONY: clean
clean:
	cd $(WORK_DIR) \
	&& docker compose down --rmi all --volumes --remove-orphans

# ログ
.PHONY: logs
logs:
	cd $(WORK_DIR) \
	&& docker compose logs

# help
.PHONY: help
help:
	@grep -B 2 -E '^[a-zA-Z_-]+:' Makefile \
	| grep -v '.PHONY' \
    | grep -v -E '^\s*$$' \
	| tr '\n' ',' \
	| sed 's/--,/\n/g' \
	| awk -F, '{printf "%-20s %s\n", $$2, $$1}'
