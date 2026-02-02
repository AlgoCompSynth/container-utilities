#! /usr/bin/env bash

set -e

for model in \
  gpt-oss:20b \
  magistral:24b-small-2506-q4_K_M  \
  deepseek-r1:32b-qwen-distill-q4_K_M  \
  qwen3:30b-a3b-thinking-2507-q4_K_M  \
  nemotron-3-nano:30b-a3b-q4_K_M  \
  glm-4.7-flash:q4_K_M

do
  echo "$model:"
  /usr/bin/time ollama run $model < prompt.txt > $model.ranking

done
