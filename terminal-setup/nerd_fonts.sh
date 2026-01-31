#! /usr/bin/env bash

set -e

mkdir --parents $HOME/.fonts
pushd $HOME/.fonts > /dev/null
  rm --force --recursive CascadiaCode*
  curl -sOL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
  unzip -qqo CascadiaCode.zip
popd > /dev/null
