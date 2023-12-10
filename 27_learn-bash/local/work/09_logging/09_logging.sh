#!/usr/bin/env bash

set -euCo pipefail

readonly LOG_OUT=./stdout.log
readonly LOG_ERR=./stderr.log

exec 1> >(tee -a "$LOG_OUT")
exec 2> >(tee -a "$LOG_ERR")

function log_debug() {
    log 'DEBUG' "$*"
}

function log_err() {
    log 'ERROR' "$*"
}

function log() {
    printf "%s\t[%5s]\t%s\n" "$(date '+%Y/%m/%d %H:%M:%S.%3N')" "$1" "$2"
}

function trap_err() {
    error_status=$?
    msg=$(printf "エラー発生 \$?=%d %s %s:%d" ${error_status} "${BASH_SOURCE[0]}" "${FUNCNAME[1]}" ${BASH_LINENO[0]})
    log_err "${msg}"
}

trap trap_err ERR

log_debug "$(which bash)"

log_debug "$(bash --version)"

# 標準エラーへの出力確認用
ls dummy.txt

echo "ここは表示されない"
