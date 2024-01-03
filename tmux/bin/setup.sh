#!/usr/bin/env bash

set -eu

source bin/utils.sh
readonly working_dir=$(pwd)/tmux

cd $working_dir
if [ ! -d ".tmux" ]; then
  git clone https://github.com/gpakosz/.tmux.git
fi

mkdir -p $XDG_CONFIG_HOME/tmux
cp $working_dir/.tmux/.tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
cp $working_dir/.tmux/.tmux.conf.local $XDG_CONFIG_HOME/tmux/tmux.conf.local
