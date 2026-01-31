#! /usr/bin/env bash

set -e

echo ""
echo "* pacman Container Hosting *"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/pacman_container_hosting.log
rm --force $LOGFILE

sudo pacman --sync --refresh --sysupgrade --noconfirm \
  podman \
  >> $LOGFILE 2>&1

./distrobox.sh

echo "* Finished pacman Container Hosting *"
