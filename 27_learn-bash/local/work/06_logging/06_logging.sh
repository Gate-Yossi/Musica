#!/usr/bin/env bash

set -euCo pipefail

readonly LOG_OUT=./stdout.log

exec 1> >(tee -a "$LOG_OUT")

function log() {
    echo "[$(date '+%Y/%m/%d %H:%M:%S.%3N')] $*"
}

log "$(which bash)"

log "$(bash --version)"
