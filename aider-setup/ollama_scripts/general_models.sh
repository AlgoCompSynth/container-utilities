#! /usr/bin/env bash

set -e

echo "*** Small Models ***"
echo "..Small models require 16 GB or less"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  glm-4.7-flash:q4_K_M \
  nemotron-3-nano:30b-a3b-q4_K_M \
  gemma3:27b-it-qat \
  qwen3:30b-a3b-thinking-2507-q4_K_M \
  gpt-oss:20b

do
  echo "pulling $model"
  /usr/bin/time ollama pull $model \
    > $LOGFILES/$model.log 2>&1

done

list_models.sh

echo "*** Finished Small Models ***"
echo ""
