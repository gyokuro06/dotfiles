#!/usr/bin/env bash

set -eu

source bin/utils.sh
readonly working_dir=$(pwd)/bash

mkdir -p $XDG_CONFIG_HOME/bash
symbolicLink $working_dir/bashrc $XDG_CONFIG_HOME/.
