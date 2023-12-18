#!/usr/bin/env bash

# shellcheck source=/dev/null
. ./hello.sh

# テスト関数
testHello() {
  output=$(hello ShellSpec)
  assertEquals "${output}" "Hello ShellSpec"
}

# shellcheck source=/dev/null
. /usr/local/bin/shunit2/shunit2

