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
	&& docker compose build

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

# awsコンテナへのログイン
.PHONY: login
login:
	cd $(WOKR_DIR) \
	&& docker compose run local bash

# help
.PHONY: help
help:
	@grep -B 2 -E '^[a-zA-Z_-]+:' Makefile \
	| grep -v '.PHONY' \
    | grep -v -E '^\s*$$' \
	| tr '\n' ',' \
	| sed 's/--,/\n/g' \
	| awk -F, '{printf "%-20s %s\n", $$2, $$1}'
