#!/bin/bash

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

echo "test" | tee -a "${log}"
