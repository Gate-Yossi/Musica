#!/usr/bin/env bash

set -euCo pipefail

readonly LOG_OUT=./stdout.log
readonly LOG_ERR=./stderr.log

exec 1> >(tee -a "$LOG_OUT")
exec 2> >(tee -a "$LOG_ERR")

function trap_err() {
    error_status=$?
    echo "エラー発生 \$?=${error_status} ${BASH_SOURCE[0]} ${FUNCNAME[1]}:${BASH_LINENO[0]}"
}

trap trap_err ERR

function log() {
    echo "[$(date '+%Y/%m/%d %H:%M:%S.%3N')] $*"
}

log "$(which bash)"

log "$(bash --version)"

# 標準エラーへの出力確認用
ls dummy.txt

echo "ここは表示されない"
