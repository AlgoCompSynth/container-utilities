#! /usr/bin/env bash

set -e

echo "*** Code Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codellama:34b-instruct-q4_0 \
  codegemma:7b-instruct-v1.1-q4_0 \
  codestral:22b-v0.1-q4_0 \
  cogito:32b-v1-preview-qwen-q4_K_M \
  devstral-small-2:24b-instruct-2512-q4_K_M \
  qwen3-coder:30b-a3b-q4_K_M \
  devstral:24b-small-2505-q4_K_M \
  deepcoder:14b-preview-q4_K_M \
  starcoder2:15b-q4_0 \
  deepseek-coder-v2:16b-lite-instruct-q4_0 \
  granite-code:34b-instruct-q4_0 \
  wizardcoder:33b-v1.1-q4_0

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

ollama list

echo "*** Finished Code Models ***"
echo ""
