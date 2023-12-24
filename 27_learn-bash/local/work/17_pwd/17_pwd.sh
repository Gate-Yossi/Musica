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

function poc_run() {
    log_info "poc $1"
}

trap trap_err ERR

trap trap_exit EXIT

log_info '-- $0'
script_path="$(cd "$(dirname "$0")" && pwd)"
log_info "${script_path}"

script_name="$(basename "${0}")"
log_info "${script_name}"

log_info '-- $BASH_SOURCE[0]'
script_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
log_info "${script_path}"

script_name="$(basename "${BASH_SOURCE[0]}")"
log_info "${script_name}"
