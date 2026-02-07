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

  echo "checking $model with Pico SDK"
  /usr/bin/time ollama run $model < prompt.pico-sdk > $bname.pico-sdk

done

echo "*** Finished Test Models ***"
echo ""
