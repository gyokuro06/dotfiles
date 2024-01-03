#!/usr/bin/env bash

set -eu

source bin/utils.sh
readonly working_dir=$(pwd)/nvim

symbolicLink $working_dir $XDG_CONFIG_HOME/.
