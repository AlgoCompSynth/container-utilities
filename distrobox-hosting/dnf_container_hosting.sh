#! /usr/bin/env bash

set -e

echo ""
echo "* dnf Container Hosting *"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/dnf_container_hosting.log
rm --force $LOGFILE

sudo dnf install -y \
  podman \
  >> $LOGFILE 2>&1

./distrobox.sh

echo "* Finished dnf Container Hosting *"
