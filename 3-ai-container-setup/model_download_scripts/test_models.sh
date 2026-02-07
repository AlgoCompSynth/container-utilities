#! /usr/bin/env bash

set -e

echo "*** Test Models ***"

source ./test_func.sh
for model in $(ollama list | sort -n -k 3 | grep -v NAME | sed 's/ .*$//')

do
  test_model $model

done

echo "*** Finished Test Models ***"
echo ""
