#! /usr/bin/env bash

set -e

echo "** Distrobox **"

pushd $HOME/Projects > /dev/null
  rm -fr distrobox
  git clone https://github.com/89luca89/distrobox.git \
    >> $LOGFILE 2>&1
  cd distrobox
  ./install \
    >> $LOGFILE 2>&1
popd > /dev/null
which distrobox
distrobox --version

echo "** Finished Distrobox **"
echo ""
