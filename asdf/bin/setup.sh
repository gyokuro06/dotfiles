#!/usr/bin/env bash

set -eu

source bin/utils.sh
readonly working_dir=$(pwd)/asdf

symbolicLink $working_dir/.tool-versions $HOME/.

mkdir -p $XDG_CONFIG_HOME/mise
symbolicLink $working_dir/mise/config.toml $XDG_CONFIG_HOME/mise/.
