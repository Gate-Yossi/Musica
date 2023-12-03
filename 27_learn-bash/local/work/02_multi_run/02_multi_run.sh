#!/bin/bash

function load_out_dir()
{
    run_time=$(TZ=JST-9 date "+%Y%m%d_%H%M%S")

    yyyy=${run_time:0:4}
    mm=${run_time:4:2}
    dd=${run_time:6:2}
    HH=${run_time:9:2}
    MM=${run_time:11:2}
    SS=${run_time:13:2}

    run_name=$(basename "$0")
    run_name=${run_name%.*}

    out_dir=${run_name}/${yyyy}/${mm}/${dd}/${HH}/${MM}/${SS}
    echo "out : ${out_dir}"

    mkdir -p "${out_dir}"

    log=${out_dir}/out.log
}

proc_test()
{
    sleep_time=$(( $RANDOM % 10 ))
    sleep $sleep_time
    echo "[$(TZ=JST-9 date "+%Y/%m/%d %H:%M:%S.%3N")] proc $i ${sleep_time}[s]" | tee -a "${log}"
}

load_out_dir

for i in $(seq 1 10); do
  proc_test $i &
done

wait
