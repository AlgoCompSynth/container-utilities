#! /usr/bin/env bash

set -e

echo "*** General Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codellama:13b-instruct-q4_0 \
  deepseek-r1:32b-qwen-distill-q4_K_M \
  glm-4.7-flash:q4_K_M \
  nemotron-3-nano:30b-a3b-q4_K_M \
  qwen3-vl:32b-thinking-q4_K_M \
  qwen3-coder:30b-a3b-q4_K_M \
  wizardcoder:33b

do
  bname=$(basename $model)
  echo "checking $model"
  /usr/bin/time ollama run $model < /dev/null \
    2>&1 | tee $LOGFILES/$bname.log || true

done

ollama list | sort -nr -k 3

echo "*** Finished General Models ***"
echo ""
# nemotron-3-nano:30b-a3b-q4_K_M               b725f1117407    24 GB     54 minutes ago       
# qwen3-vl:32b-thinking-q4_K_M                 ff2e46876908    20 GB     41 minutes ago       
# glm-4.7-flash:q4_K_M                         d1a8a26252f1    19 GB     About an hour ago    
# deepseek-r1:32b-qwen-distill-q4_K_M          edba8017331d    19 GB     2 hours ago          
# codellama:34b-instruct-q4_0                  685be00e1532    19 GB     2 hours ago          
# wizardcoder:33b                              5b944d3546ee    18 GB     5 minutes ago        
# qwen3-coder:30b-a3b-q4_K_M                   06c1097efce0    18 GB     23 minutes ago       
# NAME                                         ID              SIZE      MODIFIED          
