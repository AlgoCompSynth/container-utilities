#! /bin/bash

set -e

source set_envars
export LOGFILE=$LOGFILES/install_ollama.log
rm --force $LOGFILE

# https://docs.ollama.com/linux
echo "..Installing ollama"
curl -fsSL https://ollama.com/install.sh | sh

echo "..Copying ollama scripts to $HOME/.local/bin/"
cp ollama_scripts/*.sh $HOME/.local/bin/

echo "..Finished"
echo ""
