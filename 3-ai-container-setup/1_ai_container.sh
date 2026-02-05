#! /usr/bin/env bash

set -e

echo "* AI Container *"

echo ""
echo "Setting environment variables"
source set_envars

export LOGFILE=$LOGFILES/ai_container.log
rm --force $LOGFILE

echo ""
echo "Stopping any existing distrobox container $DBX_CONTAINER_NAME" - ignore errors
distrobox stop --yes $DBX_CONTAINER_NAME || true

echo "Recursively removing any existing distrobox home directory $DBX_CONTAINER_DIRECTORY"
rm --recursive --force $DBX_CONTAINER_DIRECTORY

echo "Setting container and image names"
echo "[$DBX_CONTAINER_NAME]" > distrobox.ini
echo "image=$DBX_CONTAINER_IMAGE" >> distrobox.ini
cat distrobox.ini.base >> distrobox.ini

if [[ "$COMPUTE_MODE" == "CUDA" ]]
then
  echo "Adding NVIDIA tools to container"
  echo "nvidia=true" >> distrobox.ini

fi

echo ""
echo "Creating container - installing basic packages"
echo "will take some time."
/usr/bin/time distrobox assemble create --file distrobox.ini \
  >> $LOGFILE 2>&1

echo ""
echo "Copying \$HOME/.ssh into \$DBX_CONTAINER_DIRECTORY"
cp -rp $HOME/.ssh $DBX_CONTAINER_DIRECTORY
echo "Creating 'desktop' directories"
mkdir --parents \
  $DBX_CONTAINER_DIRECTORY/Logfiles \
  $DBX_CONTAINER_DIRECTORY/Projects \
  $DBX_CONTAINER_DIRECTORY/bin \
  $DBX_CONTAINER_DIRECTORY/.local/bin

echo ""
echo "Setting up terminal"
pushd ../2-terminal-setup/ > /dev/null
  distrobox enter "$DBX_CONTAINER_NAME" -- ./terminal_setup.sh
popd > /dev/null

echo "Setting up ollama and aider"
distrobox enter "$DBX_CONTAINER_NAME" -- ./install_ollama.sh
distrobox enter "$DBX_CONTAINER_NAME" -- ./install_aider.sh

echo "** Exporting ollama and aider **"
distrobox enter "$DBX_CONTAINER_NAME" -- distrobox-export --bin $DBX_CONTAINER_DIRECTORY/.local/bin/aider
distrobox enter "$DBX_CONTAINER_NAME" -- distrobox-export --bin /usr/local/bin/ollama
echo ""

echo "* Finished AI Container *"
echo ""
