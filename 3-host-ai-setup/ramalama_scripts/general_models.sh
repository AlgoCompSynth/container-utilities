#! /usr/bin/env bash

set -e

echo "*** General Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  huggingface://Qwen/Qwen3-VL-32B-Thinking-GGUF \
  huggingface://zai-org/GLM-4.7-Flash-GGUF \
  huggingface://nvidia/NVIDIA-Nemotron-3-Nano-30B-A3B-BF16-GGUF \
  huggingface://openai/gpt-oss-20b-GGUF \
  magistral:24b \
  deepseek-r1:32b

do
  echo "pulling $model"
  bname=$(basename $model)
  /usr/bin/time ramalama pull $model \
    > $LOGFILES/$bname.log 2>&1
  echo "checking $model"
  ramalama run $model < /dev/null

done

ramalama list

echo "*** Finished General Models ***"
echo ""
