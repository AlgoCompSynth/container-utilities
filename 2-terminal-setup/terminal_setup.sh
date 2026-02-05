#! /usr/bin/env bash

set -e

echo "..adding aliases to $HOME/.bashrc"
cat bash_aliases >> $HOME/.bashrc
source bash_aliases

echo "..Installing starship"
./starship.sh

echo "..Installing CascadyiaCove nerd font"
./nerd_fonts.sh

echo "..Finished"
echo ""
echo "..Restart your terminal, add CascaydiaCove Nerd Font to your terminal profile and restart shell"
echo ""
