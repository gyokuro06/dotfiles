#!/usr/bin/env bash

set -eu

echo "Start setup dotfiles ..."
source bin/utils.sh

readonly dotfiles_path=$(pwd)
echo "dotfiles_path=$dotfiles_path"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
echo "XDG_CONFIG_HOME=$XDG_CONFIG_HOME"
echo "XDG_STATE_HOME=$XDG_STATE_HOME"
echo "XDG_DATA_HOME=$XDG_DATA_HOME"
echo "XDG_CACHE_HOME=$XDG_CACHE_HOME"

function main() {
  executeSetupShell homebrew
  # Shell
  executeSetupShell bash
  executeSetupShell zsh
  executeSetupShell fish

  executeSetupShell git

  executeSetupShell asdf

  executeSetupShell nvim
  #Terminal
  executeSetupShell tmux
  executeSetupShell alacritty
}

main

echo "Finish setup dotfiles!"
