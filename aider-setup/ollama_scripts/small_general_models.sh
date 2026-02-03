#! /usr/bin/env bash

set -e

echo "*** Small (<= 16 GB) General Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  qwen3-vl:8b-thinking-q4_K_M \
  gpt-oss:20b \
  magistral:24b-small-2506-q4_K_M \
  deepseek-r1:14b-qwen-distill-q4_K_M

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

ollama list

echo "*** Finished Small (<= 16 GB) General Models ***"
echo ""
