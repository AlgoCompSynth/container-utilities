#! /bin/bash

set -e

source set_envars
export LOGFILE=$LOGFILES/install_ramalama.log
rm --force $LOGFILE

# https://github.com/containers/ramalama?tab=readme-ov-file#install-script-linux-and-macos
echo "..Installing ramalama"
curl -fsSL https://ramalama.ai/install.sh | bash

echo "..Copying ramalama scripts to $HOME/.local/bin/"
cp ramalama_scripts/*.sh $HOME/.local/bin/

echo "..Finished"
echo ""
