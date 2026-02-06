#! /usr/bin/env bash

set -e

echo "*** Small (< 16 GB) Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codellama:13b-instruct-q4_0 \
  codestral:22b-v0.1-q4_0 \
  deepcoder:14b-preview-q4_K_M \
  deepseek-coder-v2:16b-lite-instruct-q4_0 \
  deepseek-r1:14b-qwen-distill-q4_K_M \
  devstral-small-2:24b-instruct-2512-q4_K_M \
  gpt-oss:20b \
  granite-code:20b-base-q4_0 \
  granite-code:20b-instruct-8k-q4_0 \
  magistral:24b-small-2506-q4_K_M \
  qwen3-vl:8b-thinking-q4_K_M \
  qwen3-vl:8b-instruct-q4_K_M \
  starcoder2:15b-q4_0

do
  bname=$(basename $model)

  echo ""
  echo "checking $model with ChucK"
  /usr/bin/time ollama run $model < prompt.ck > $bname.chuck

  echo "checking $model with R"
  /usr/bin/time ollama run $model < prompt.R > $bname.data.table


done

ollama list | sort -nr -k 3

echo "*** Finished Small (< 16 GB) Models ***"
echo ""
