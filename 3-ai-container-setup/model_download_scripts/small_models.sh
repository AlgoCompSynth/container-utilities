#! /usr/bin/env bash

set -e

echo "*** Small (<= 16 GB) Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

for model in \
  codellama:13b-instruct-q4_0 \
  codestral:22b-v0.1-q4_0 \
  deepseek-coder-v2:16b-lite-instruct-q4_0 \
  deepseek-r1:14b-qwen-distill-q4_K_M \
  devstral-small-2:24b-instruct-2512-q4_K_M \
  gpt-oss:20b \
  magistral:24b-small-2506-q4_K_M \
  qwen3-vl:8b-thinking-q8_0 \
  starcoder2:15b-q4_0

do
  bname=$(basename $model)
  echo "checking $model"
  /usr/bin/time ollama run $model < /dev/null \
    2>&1 | tee $LOGFILES/$bname.log || true

done

ollama list | sort -nr -k 3

echo "*** Finished Small (<= 16 GB) Models ***"
echo ""
# devstral-small-2:24b-instruct-2512-q4_K_M    24277f07f62d    15 GB     2 hours ago          
# magistral:24b-small-2506-q4_K_M              27bcbbf6d324    14 GB     About an hour ago    
# gpt-oss:20b                                  17052f91a42e    13 GB     About an hour ago    
# codestral:22b-v0.1-q4_0                      0898a8b286d5    12 GB     2 hours ago          
# qwen3-vl:8b-thinking-q8_0                    9e9bbfc77186    9.8 GB    35 minutes ago       
# starcoder2:15b-q4_0                          21ae152d49e0    9.1 GB    16 minutes ago       
# deepseek-r1:14b-qwen-distill-q4_K_M          c333b7232bdb    9.0 GB    2 hours ago          
# deepseek-coder-v2:16b-lite-instruct-q4_0     63fb193b3a9b    8.9 GB    2 hours ago          
# codellama:13b-instruct-q4_0                  9f438cb9cd58    7.4 GB    3 hours ago          
# NAME                                         ID              SIZE      MODIFIED          
