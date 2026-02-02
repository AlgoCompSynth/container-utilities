#! /usr/bin/env bash

set -e

echo "*** Code Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codellama:34b-instruct-q4_0 \
  qwen3-coder:30b-a3b-q4_K_M \
  starcoder2:15b-q4_0 \
  wizardcoder:33b-v1.1-q4_0

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

list_models.sh

echo "*** Finished Code Models ***"
echo ""
