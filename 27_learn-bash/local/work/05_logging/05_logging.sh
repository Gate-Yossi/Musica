#!/usr/bin/env bash

set -euCo pipefail

function log() {
    echo "[$(date '+%Y/%m/%d %H:%M:%S.%3N')] $*"
}

log "$(which bash)"

log "$(bash --version)"
