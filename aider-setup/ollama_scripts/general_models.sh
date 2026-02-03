#! /usr/bin/env bash

set -e

echo "*** General Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  glm-4.7-flash:q4_K_M \
  qwen3-vl:32b-thinking-q4_K_M \
  nemotron-3-nano:30b-a3b-q4_K_M \
  gpt-oss:20b \
  magistral:24b-small-2506-q4_K_M \
  deepseek-r1:32b-qwen-distill-q4_K_M

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

ollama list

echo "*** Finished General Models ***"
echo ""
