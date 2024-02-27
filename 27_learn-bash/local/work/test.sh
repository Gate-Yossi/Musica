#!/usr/bin/env bash

var=value

if [[ "$var" < "value" ]]; then
  echo "value"
fi

num1=1
num2=2

if [ "$num1" < "$num2" ]; then
    # 条件が真の場合の処理
  echo "value2"
fi

str=0123
if [[ "$str" =~ ^[0-9]+$ ]]; then
  echo "value3"
fi

if [ -n "$var" ]; then
    # 変数が空でない場合の処理
  echo "value4"
fi