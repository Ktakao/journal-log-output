#!/bin/bash

set -eu

time_since=$1
time_until=$2
target_service=$3
target_dir=$4

output_mode="short-full short-unix export json"

for mode in ${output_mode}
do
  journalctl \
    --since="${time_since}" \
    --until="${time_until}" \
    --unit="${target_service}" \
    --output="${mode}" > ${target_dir}/${target_service}_${time_since}_${time_until}.${mode}.log
  echo "done: ${target_dir}/${target_service}_${time_since}_${time_until}.${mode}.log"
done
