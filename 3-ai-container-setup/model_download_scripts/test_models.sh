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
  echo "Please write a ChucK program to send a one-second middle C triangle wave to the DAC." \
    | /usr/bin/time ollama run $model > $bname.chuck

  echo "checking $model with R"
  echo "Please write an R program using data.table to read a csv file 'offices.csv' into a data.table called 'offices'." \
    | /usr/bin/time ollama run $model > $bname.data.table

done

echo "*** Finished Test Models ***"
echo ""
