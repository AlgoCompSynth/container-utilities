#! /usr/bin/env bash

set -e

echo "..Installing Homebrew"
sudo NONINTERACTIVE=1 /bin/bash -c \
  "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> $HOME/.bashrc
echo \
  'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' \
  >> $HOME/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

echo "..Installing starship"
brew install starship
mkdir --parents $HOME/.config
cp starship.toml $HOME/.config/starship.toml
echo >> $HOME/.bashrc
echo 'eval "$(starship init bash)"' >> $HOME/.bashrc

echo "..Installing CascadyiaCove nerd font"
./nerd_fonts.sh

echo "..Finished"
