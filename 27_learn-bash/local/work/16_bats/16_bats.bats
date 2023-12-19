#!/usr/bin/env bats

setup() {
  load ./hello.sh
}

# テスト関数
@test "test hello" {
  output="$(hello ShellSpec)"
  [ "$output" == "Hello ShellSpec" ]
}
