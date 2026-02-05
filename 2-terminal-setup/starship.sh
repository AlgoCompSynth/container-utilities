#! /usr/bin/env bash

set -e

if [[ "$(which starship | wc -l)" == "0" ]]
then
  echo "starship missing - installing to $HOME/.local/bin"
  pushd /tmp > /dev/null
    export BIN_DIR=$HOME/.local/bin
    mkdir --parents $BIN_DIR
    rm --force install.sh
    curl --silent --show-error --remote-name https://starship.rs/install.sh
    chmod +x install.sh
    ./install.sh --yes > /dev/null
  popd > /dev/null

fi

mkdir --parents $HOME/.config
cp starship.toml $HOME/.config/starship.toml

echo 'eval $(starship init bash)' >> $HOME/.bashrc
