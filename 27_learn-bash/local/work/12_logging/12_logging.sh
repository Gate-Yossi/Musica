#!/usr/bin/env bash

set -euCo pipefail

ESC="$(printf '\033')" # \e や \x1b または $'\e' は使用しない
LOG_OUT=./stdout.log
LOG_ERR=./stderr.log
readonly ESC LOG_OUT LOG_ERR

exec 1> >(tee -a "$LOG_OUT")
exec 2> >(tee -a "$LOG_ERR")

function log_info() {
    local log_msg
    log_msg=$(gen_log_msg '32' 'INFO' "$*")
    echo "${log_msg}"
}

function log_debug() {
    local log_msg
    log_msg=$(gen_log_msg '34' 'DEBUG' "$*")
    echo "${log_msg}"
}

function log_warn() {
    local log_msg
    log_msg=$(gen_log_msg '33' 'WARN' "$*")
    echo "${log_msg}"
}

function log_err() {
    local log_msg
    log_msg=$(gen_log_msg '31' 'ERROR' "$*")
    echo "${log_msg}" >&2
}

function gen_log_msg() {
    local prefix
    prefix=$(printf "${ESC}[%dm%5s${ESC}[m\n" "$1" "$2" )
    printf "%s\t[%s]\t%s" "$(date '+%Y/%m/%d %H:%M:%S.%3N')" "$prefix" "$3"
}

function trap_err() {
    error_status=$?
    msg=$(printf "エラー発生 \$?=%d %s %s:%d" ${error_status} "${BASH_SOURCE[0]}" "${FUNCNAME[1]}" ${BASH_LINENO[0]})
    log_err "${msg}"
}

function trap_exit() {
    msg=$(printf "終了時の処理 %s %s:%d" "${BASH_SOURCE[0]}" "${FUNCNAME[1]}" ${BASH_LINENO[0]})
    log_debug "${msg}"
}

trap trap_err ERR

trap trap_exit EXIT

log_debug "$(which bash)"

log_debug "$(bash --version)"

log_info "info test"

log_warn "warn test"

# 標準エラーへの出力確認用
ls dummy.txt

echo "ここは表示されない"
