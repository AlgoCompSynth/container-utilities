#! /bin/bash

set -e

source set_envars
export LOGFILE=$LOGFILES/install_aider.log
rm --force $LOGFILE

echo "..Creating .aider_venv virtual environment"
python3 -m venv .aider_venv
source .aider_venv/bin/activate
pip3 install --upgrade pip
pip3 install --upgrade aider-install

echo "..Installing aider"
/usr/bin/time aider-install \
  >> $LOGFILE 2>&1

deactivate

echo "..Finished"
echo ""
