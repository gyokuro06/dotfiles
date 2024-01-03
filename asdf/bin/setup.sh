#!/usr/bin/env bash

set -eu

source bin/utils.sh
readonly working_dir=$(pwd)/asdf

symbolicLink $working_dir/.tool-versions $XDG_CONFIG_HOME/.
