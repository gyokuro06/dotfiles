#!/usr/bin/env bash

set -eu

source bin/utils.sh
readonly working_dir=$(pwd)/git

mkdir -p $XDG_CONFIG_HOME/git
symbolicLink $working_dir $XDG_CONFIG_HOME/.
