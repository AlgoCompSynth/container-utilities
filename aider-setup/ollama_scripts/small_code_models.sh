#! /usr/bin/env bash

set -e

echo "*** Small (<= 16 GB) Code Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codellama:13b-instruct-q4_0 \
  qwen2.5-coder:14b-instruct-q4_K_M \
  deepseek-coder-v2:16b-lite-instruct-q4_0 \
  starcoder2:15b-q4_0

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

ollama list

echo "*** Finished Small (<= 16 GB) Code Models ***"
echo ""
