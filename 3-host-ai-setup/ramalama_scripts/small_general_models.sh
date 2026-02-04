#! /usr/bin/env bash

set -e

echo "*** Small (<= 16 GB) General Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  qwen2.5vl:7b \
  gpt-oss:20b \
  magistral:24b-small-2506-q4_K_M \
  deepseek-r1:14b-qwen-distill-q4_K_M

do
  echo "pulling $model"
  /usr/bin/time ramalama pull $model \
    > $LOGFILES/$model.log 2>&1

done

ramalama list

echo "*** Finished Small (<= 16 GB) General Models ***"
echo ""
