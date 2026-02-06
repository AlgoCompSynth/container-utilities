#! /usr/bin/env bash

set -e

echo "*** Large (>= 16 GB and <= 24 GB) Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codellama:34b-instruct-q4_0 \
  deepseek-r1:32b-qwen-distill-q4_K_M \
  glm-4.7-flash:q4_K_M \
  granite-code:34b-base-q4_0 \
  granite-code:34b-instruct-q4_0 \
  nemotron-3-nano:30b-a3b-q4_K_M \
  qwen3-vl:32b-thinking-q4_K_M \
  qwen3-vl:32b-instruct-q4_K_M \
  qwen3-coder:30b-a3b-q4_K_M \
  wizardcoder:33b

do
  bname=$(basename $model)

  echo ""
  echo "checking $model with ChucK"
  /usr/bin/time ollama run $model < prompt.ck > $bname.chuck

  echo "checking $model with R"
  /usr/bin/time ollama run $model < prompt.R > $bname.data.table

done

ollama list | sort -nr -k 3

echo "*** Finished Large (>= 16 GB and <= 24 GB) Models ***"
echo ""
