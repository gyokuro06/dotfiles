#!/usr/bin/env bash

set -eu

function executeSetupShell() {
  echo ""
  echo "Start setup $1 ..."
  ${dotfiles_path}/${1}/bin/setup.sh
  echo "Finish setup $1!"
}

function symbolicLink() {
  echo "Symbolic link: $1 -> $2"
  ln -sf $1 $2
}