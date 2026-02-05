#! /bin/bash

set -e

source set_envars
export LOGFILE=$LOGFILES/install_aider.log
rm --force $LOGFILE

echo "..Installing uv"
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/share/../bin/env

echo "..Installing aider-install"
uv tool install aider-install

echo "..Installing aider"
/usr/bin/time aider-install \
  >> $LOGFILE 2>&1

echo "..Setting OLLAMA_API_BASE=http://127.0.0.1:11434 in $HOME/.bashrc"
echo "export OLLAMA_API_BASE=http://127.0.0.1:11434" >> $HOME/.bashrc

echo "..Finished"
echo ""
