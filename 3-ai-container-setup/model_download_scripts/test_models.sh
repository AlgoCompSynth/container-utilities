#! /usr/bin/env bash

set -e

echo "*** Test Models ***"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES

models=$()
for model in $(ollama list | sort -nr -k 3 | grep -v NAME | sed 's/ .*$//')

do
  bname=$(basename $model)

  echo ""
  echo "checking $model with ChucK"
  /usr/bin/time ollama run $model < prompt.ck > $bname.chuck

  echo "checking $model with R"
  /usr/bin/time ollama run $model < prompt.R > $bname.data.table

done

echo "*** Finished Test Models ***"
echo ""
