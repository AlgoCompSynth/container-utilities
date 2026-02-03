#! /usr/bin/env bash

set -e

echo ""
echo "* zypper Container Hosting *"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/zypper_container_hosting.log
rm --force $LOGFILE

sudo zypper install -y \
  podman \
  >> $LOGFILE 2>&1

./distrobox.sh

echo "* Finished zypper Container Hosting *"
