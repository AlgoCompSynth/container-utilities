#! /usr/bin/env bash

set -e

echo "* apt Container Hosting *"

export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/apt_container_hosting.log
rm --force $LOGFILE

export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -qqy \
  apt-file \
  plocate \
  podman \
  uidmap \
  >> $LOGFILE 2>&1
  sudo apt-file update \
  >> $LOGFILE 2>&1
  sudo updatedb \
  >> $LOGFILE 2>&1
  sudo mandb \
  >> $LOGFILE 2>&1

./distrobox.sh

echo "* Finished apt Container Hosting *"
echo ""
