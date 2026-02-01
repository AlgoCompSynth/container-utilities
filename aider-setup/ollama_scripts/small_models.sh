#! /usr/bin/env bash

set -e

echo "*** Small Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  deepseek-coder-v2:16b-lite-instruct-q4_0 \
  codellama:13b

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

list_models.sh

echo "*** Finished Small Models ***"
echo ""
