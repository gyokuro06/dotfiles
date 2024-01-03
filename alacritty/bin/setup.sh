#!/usr/bin/env bash

set -eu

source bin/utils.sh
readonly working_dir=$(pwd)/alacritty

symbolicLink $working_dir $XDG_CONFIG_HOME/.
