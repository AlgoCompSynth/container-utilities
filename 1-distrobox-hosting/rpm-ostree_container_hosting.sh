#! /usr/bin/env bash

set -e

echo ""
echo "* Silverblue Container Hosting *"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/silverblue_container_hosting.log
rm --force $LOGFILE

./distrobox.sh

echo "* Finished Silverblue Container Hosting *"
