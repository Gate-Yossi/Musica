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
	&& docker compose --profile tools build

# コンテナの削除
.PHONY: clean
clean:
	cd $(WORK_DIR) \
	&& docker compose --profile tools down --rmi all --volumes --remove-orphans

# ログ
.PHONY: logs
logs:
	cd $(WORK_DIR) \
	&& docker compose logs

# 実行
.PHONY: run
run:
	cd $(WORK_DIR) \
	&& docker compose run -it --rm jmeter bash test.sh

# help
.PHONY: help
help:
	@grep -B 2 -E '^[a-zA-Z_-]+:' Makefile \
	| grep -v '.PHONY' \
    | grep -v -E '^\s*$$' \
	| tr '\n' ',' \
	| sed 's/--,/\n/g' \
	| awk -F, '{printf "%-20s %s\n", $$2, $$1}'
