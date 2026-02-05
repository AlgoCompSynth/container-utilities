#! /usr/bin/env bash

set -e

echo "*** Test Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

models=$()
for model in $(ollama list | grep -v NAME | sed 's/ .*$//')
do
  bname=$(basename $model)
  echo "checking $model"
  /usr/bin/time ollama run $model < /dev/null \
    2>&1 | tee $LOGFILES/$bname.log || true

done

echo "*** Finished Test Models ***"
echo ""
