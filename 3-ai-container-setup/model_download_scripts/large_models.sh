#! /usr/bin/env bash

set -e

echo "*** Large (>= 20b and <= 34b) Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codellama:34b-instruct-q4_0 \
  granite-code:34b-base-q4_0 \
  granite-code:34b-instruct-q4_0 \
  qwen3-coder:30b-a3b-q4_K_M \
  glm-4.7-flash:q4_K_M \
  devstral-small-2:24b-instruct-2512-q4_K_M \
  magistral:24b-small-2506-q4_K_M \
  codestral:22b-v0.1-q4_0 \
  gpt-oss:20b

do
  bname=$(basename $model)

  echo ""
  echo "pulling $model"
  /usr/bin/time ollama pull $model

done

ollama list | sort -nr -k 3

echo "*** Finished Large (>= 20b and <= 34b) Models ***"
echo ""
