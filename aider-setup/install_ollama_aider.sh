#! /bin/bash

set -e

source set_envars
export LOGFILE=$LOGFILES/install_ollama_aider.log
rm --force $LOGFILE
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

echo "..Installing ollama"
/usr/bin/time brew install ollama \
  >> $LOGFILE 2>&1

echo "..Installing aider"
/usr/bin/time brew install aider \
  >> $LOGFILE 2>&1

echo "..Copying ollama scripts to $HOME/.local/bin/"
cp ollama_scripts/*.sh $HOME/.local/bin/

echo "..Finished"
echo ""
