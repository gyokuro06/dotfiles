#!/usr/bin/env bash

set -eu

source bin/utils.sh
readonly working_dir=$(pwd)

mkdir -p $XDG_CONFIG_HOME/zsh
symbolicLink $working_dir/zsh/zshenv $HOME/.
symbolicLink $working_dir/zsh/zshrc $XDG_CONFIG_HOME/zsh/.
