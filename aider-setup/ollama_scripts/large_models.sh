#! /usr/bin/env bash

set -e

echo "*** Large Models ***"
echo "..Large models require between 16 GB and 24 GB"
export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  glm-4.7-flash:q4_K_M \
  nemotron-3-nano:30b-a3b-q4_K_M \
  gemma3:27b-it-qat \
  qwen3-coder:30b-a3b-q4_K_M \
  cogito:32b-v1-preview-qwen-q4_K_M

do
  echo "..pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

list_models.sh

echo "*** Finished Large Models ***"
echo ""
